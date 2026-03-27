package controller;

import dao.ProductDao;
import dao.AddressDao;
import dao.PaymentDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("CART");
        if (action != null && action.equals("updateQtyAjax")) {
            response.setContentType("application/json;charset=UTF-8");
            try {
                int variantId = Integer.parseInt(request.getParameter("variantId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                ProductDao dao = new ProductDao();
                ProductVariants variant = dao.getVariantById(variantId);
                if (cart != null && cart.containsKey(variantId)) {
                    CartItem item = cart.get(variantId);
                    if (variant != null && quantity <= variant.getInventory_quantity()) {
                        item.setQuantity(quantity);
                        BigDecimal price = variant.getVariant_price()
                                .multiply(BigDecimal.valueOf(quantity));
                        item.setTotalPrice(price);
                        session.setAttribute("CART", cart);
                        response.getWriter().print("{\"success\":true}");
                    } else {
                        response.getWriter().print("{\"success\":false}");
                    }
                } else {
                    response.getWriter().print("{\"success\":false}");
                }
            } catch (Exception e) {
                response.getWriter().print("{\"success\":false}");
            }
        } else if (action != null && action.equals("view")) {
            User user = (User) session.getAttribute("LOGGED_USER");

            if (user != null) {
                AddressDao addrDao = new AddressDao();
                PaymentDao payDao = new PaymentDao();
                request.setAttribute("addresses", addrDao.getAddressesByUserId(user.getId()));
                request.setAttribute("listPayments", payDao.getPaymentsByUserId(user.getId()));
            }
            BigDecimal total = BigDecimal.ZERO;
            if (cart != null) {
                for (CartItem item : cart.values()) {
                    BigDecimal price = item.getVariant().getVariant_price()
                            .multiply(BigDecimal.valueOf(item.getQuantity()));
                    total = total.add(price);
                }
            }
            request.setAttribute("total", total);
            if (cart != null) {
                request.setAttribute("cartItems", cart.values());
            }
            request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("CART");
        if (cart == null) {
            cart = new HashMap<>();
        }
        ProductDao dao = new ProductDao();
        if (action.equals("add")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (cart.containsKey(variantId)) {
                CartItem item = cart.get(variantId);
                item.setQuantity(item.getQuantity() + quantity);
            } else {
                Product product = dao.getProductById(productId);
                ProductVariants variant = dao.getVariantById(variantId);

                CartItem item = new CartItem();
                item.setProduct(product);
                item.setVariant(variant);
                item.setQuantity(quantity);

                cart.put(variantId, item);
            }

            session.setAttribute("CART", cart);
            session.setAttribute("ADD_CART_SUCCESS", "Đã thêm sản phẩm vào giỏ hàng!");

            response.sendRedirect("ProductDetailServlet?id=" + productId);
            return;
        } else if (action.equals("update")) {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (cart.containsKey(variantId)) {
                CartItem item = cart.get(variantId);
                item.setQuantity(quantity);
            }
        } else if (action.equals("remove")) {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            if (cart.containsKey(variantId)) {
                cart.remove(variantId);
            }
        }
        else if (action.equals("prepareCheckout")) {

            String[] selectedItems = request.getParameterValues("selectedItems");

            if (selectedItems != null && selectedItems.length > 0) {

                session.setAttribute("SELECTED_ITEMS", selectedItems);

                response.sendRedirect("CheckoutServlet");
                return;
            } else {
                response.sendRedirect("CartServlet?action=view");
                return;
            }
        }
        session.setAttribute("CART", cart);

    }
}