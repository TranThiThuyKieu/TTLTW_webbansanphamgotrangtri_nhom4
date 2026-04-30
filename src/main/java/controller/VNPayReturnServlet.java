package controller;

import Payment.VNPayConfig;
import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CartItem;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

@WebServlet(name = "VNPayReturnServlet", value = "/vnpay_return")
public class VNPayReturnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String orderIdStr = request.getParameter("vnp_TxnRef");

        Map<String, String> fields = new HashMap<>();

        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if (fieldValue != null && fieldValue.length() > 0) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = fields.remove("vnp_SecureHash");

        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        for (Iterator<String> itr = fieldNames.iterator(); itr.hasNext();) {
            String fieldName = itr.next();
            String fieldValue = fields.get(fieldName);

            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    hashData.append('&');
                }
            }
        }

        String signValue = VNPayConfig.hmacSHA512(VNPayConfig.vnp_HashSecret, hashData.toString());

        if (!signValue.equals(vnp_SecureHash)) {
            response.sendRedirect("error.jsp");
            return;
        }

        if (orderIdStr == null) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        int orderId = Integer.parseInt(orderIdStr);
        OrderDao dao = new OrderDao();
        HttpSession session = request.getSession();

        if ("00".equals(vnp_ResponseCode)) {
            dao.updateOrderStatus(orderId, "Chờ xác nhận", "Đã thanh toán");

            Map<Integer, CartItem> fullCart = (Map<Integer, model.CartItem>) session.getAttribute("CART");
            String[] selectedIds = (String[]) session.getAttribute("SELECTED_ITEMS");

            if (fullCart != null && selectedIds != null) {
                for (String idStr : selectedIds) {
                    fullCart.remove(Integer.parseInt(idStr));
                }
                session.setAttribute("CART", fullCart);
                session.removeAttribute("SELECTED_ITEMS");
            }

            response.sendRedirect("MyPageServlet?tab=don-hang&success=1&orderId=" + orderId);
        } else {
            response.sendRedirect("CartServlet?action=view&error=vnpay_failed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}