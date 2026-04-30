package controller;

import Payment.VNPayConfig;
import dao.AddressDao;
import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    OrderDao orderDao = new OrderDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String[] selectedIds = (String[]) session.getAttribute("SELECTED_ITEMS");

        Map<Integer, CartItem> fullCart =
                (Map<Integer, CartItem>) session.getAttribute("CART");

        if (fullCart == null || selectedIds == null) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        List<CartItem> selectedCart = new ArrayList<>();

        for (String idStr : selectedIds) {
            int variantId = Integer.parseInt(idStr);
            CartItem item = fullCart.get(variantId);
            if (item != null) {
                selectedCart.add(item);
            }
        }

        if (selectedCart.isEmpty()) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        double subTotal = 0;
        double totalTax = 0;

        for (CartItem item : selectedCart) {
            double itemPrice = item.getVariant().getVariant_price().doubleValue();
            int quantity = item.getQuantity();

            subTotal += itemPrice * quantity;

            double itemTax = (itemPrice * quantity) * 0.1;
            totalTax += itemTax;
        }


        double total = subTotal + totalTax;

        AddressDao addressDao = new AddressDao();
        request.setAttribute("addresses", addressDao.getAddressesByUserId(user.getId()));
        request.setAttribute("selectedCartItems", selectedCart);

        request.setAttribute("total", total);
        request.setAttribute("taxAmount", totalTax);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Map<Integer, CartItem> fullCart = (Map<Integer, CartItem>) session.getAttribute("CART");
        String[] selectedIds = (String[]) session.getAttribute("SELECTED_ITEMS");

        if (fullCart == null || selectedIds == null) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        List<CartItem> cart = new ArrayList<>();
        for (String idStr : selectedIds) {
            int variantId = Integer.parseInt(idStr);
            CartItem item = fullCart.get(variantId);
            if (item != null) cart.add(item);
        }

        if (cart.isEmpty()) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        int addressId = Integer.parseInt(request.getParameter("address_id"));
        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("paymentMethod");
        if (paymentMethod == null) paymentMethod = "COD";

        double shippingFee = 0;
        try {
            String shipParam = request.getParameter("shipping_fee_input");
            if (shipParam != null) shippingFee = Double.parseDouble(shipParam);
        } catch (Exception e) { shippingFee = 0; }

        try {
            int orderId = orderDao.checkout(user.getId(), fullName, phone, addressId, note, paymentMethod, cart, shippingFee);

            if ("VNPAY".equals(paymentMethod)) {
                double subTotal = 0;
                for (CartItem item : cart) {
                    subTotal += item.getVariant().getVariant_price().doubleValue() * item.getQuantity();
                }
                double totalAmount = subTotal + (subTotal * 0.1) + shippingFee;
                long amount = (long) (totalAmount * 100);

                String vnp_TxnRef = String.valueOf(orderId);
                Map<String, String> vnp_Params = new HashMap<>();
                vnp_Params.put("vnp_Version", "2.1.0");
                vnp_Params.put("vnp_Command", "pay");
                vnp_Params.put("vnp_TmnCode", VNPayConfig.vnp_TmnCode);
                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                vnp_Params.put("vnp_CurrCode", "VND");
                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
                vnp_Params.put("vnp_OrderType", "other");
                vnp_Params.put("vnp_Locale", "vn");

                String baseUrl = request.getScheme() + "://" +
                        request.getServerName() + ":" +
                        request.getServerPort() +
                        request.getContextPath();

                String returnUrl = baseUrl + "/vnpay_return";

                vnp_Params.put("vnp_ReturnUrl", returnUrl);

                vnp_Params.put("vnp_IpAddr", VNPayConfig.getIpAddress(request));

                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                vnp_Params.put("vnp_CreateDate", formatter.format(cld.getTime()));

                List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
                Collections.sort(fieldNames);

                StringBuilder hashData = new StringBuilder();
                StringBuilder query = new StringBuilder();
                Iterator<String> itr = fieldNames.iterator();

                while (itr.hasNext()) {
                    String fieldName = itr.next();
                    String fieldValue = vnp_Params.get(fieldName);

                    if (fieldValue != null && fieldValue.length() > 0) {
                        hashData.append(fieldName);
                        hashData.append('=');
                        hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                        query.append('=');
                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                        if (itr.hasNext()) {
                            query.append('&');
                            hashData.append('&');
                        }
                    }
                }

                String queryUrl = query.toString();
                String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.vnp_HashSecret, hashData.toString());
                queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;

                response.sendRedirect(paymentUrl);
                return;
            }

            for (CartItem bought : cart) {
                fullCart.remove(bought.getVariant().getId());
            }
            session.setAttribute("CART", fullCart);
            session.removeAttribute("SELECTED_ITEMS");
            response.sendRedirect("MyPageServlet?tab=don-hang&success=1&orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CartServlet?action=view&error=1");
        }
    }

    private double calculateTotal(List<CartItem> cart, HttpServletRequest request) {
        double subTotal = 0;
        double totalTax = 0;

        for (CartItem item : cart) {
            double price = item.getVariant().getVariant_price().doubleValue();
            int qty = item.getQuantity();

            subTotal += price * qty;
            totalTax += (price * qty) * 0.1;
        }

        double totalWithTax = subTotal + totalTax;

        double shipping = 0;
        try {
            String shipParam = request.getParameter("shipping_fee_input");
            if (shipParam != null) shipping = Double.parseDouble(shipParam);
        } catch (Exception e) {
            shipping = (subTotal < 1000000) ? 50000 : 100000;
        }

        return totalWithTax + shipping;
    }
}