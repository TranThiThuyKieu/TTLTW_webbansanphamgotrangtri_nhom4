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
                    } if (variant == null) {
                        response.getWriter().print("""
                                {"success":false,"message":"Sản phẩm không tồn tại"}""");
                        return;
                    }
                    if (quantity > variant.getInventory_quantity()) {
                        response.getWriter().print("""
                                        {"success":false,"message":"Số lượng vượt quá tồn kho. Còn lại: """ + variant.getInventory_quantity() + """ 
                                        sản phẩm"}""");
                        return;
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
            BigDecimal subTotal = BigDecimal.ZERO;
            BigDecimal totalTax = BigDecimal.ZERO;

            if (cart != null) {
                for (CartItem item : cart.values()) {
                    BigDecimal itemPrice = item.getVariant().getVariant_price()
                            .multiply(BigDecimal.valueOf(item.getQuantity()));
                    subTotal = subTotal.add(itemPrice);

                    BigDecimal itemTax = itemPrice.multiply(new BigDecimal("0.1"));
                    totalTax = totalTax.add(itemTax);
                }
            }

            BigDecimal totalIncludingTax = subTotal.add(totalTax);

            request.setAttribute("subTotal", subTotal);
            request.setAttribute("taxAmount", totalTax);
            request.setAttribute("total", totalIncludingTax);

            if (cart != null) {
                request.setAttribute("cartItems", cart.values());
            }
            request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
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
                Map<Integer, CartItem> fullCart = (Map<Integer, CartItem>) session.getAttribute("CART");
                BigDecimal subtotal = BigDecimal.ZERO;

                for (String idStr : selectedItems) {
                    int variantId = Integer.parseInt(idStr);
                    if (fullCart != null && fullCart.containsKey(variantId)) {
                        CartItem item = fullCart.get(variantId);
                        BigDecimal itemPrice = item.getVariant().getVariant_price()
                                .multiply(BigDecimal.valueOf(item.getQuantity()));
                        subtotal = subtotal.add(itemPrice);
                    }
                }

                BigDecimal taxRate = new BigDecimal("0.1");
                BigDecimal taxAmount = subtotal.multiply(taxRate);

                session.setAttribute("SELECTED_ITEMS", selectedItems);
                session.setAttribute("CHECKOUT_SUBTOTAL", subtotal);
                session.setAttribute("CHECKOUT_TAX", taxAmount);

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