package controller;

import dao.AddressDao;
import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Address;
import model.CartItem;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

        String[] selectedIds = request.getParameterValues("selectedItems");

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

        double total = 0;
        for (CartItem item : selectedCart) {
            total += item.getVariant().getVariant_price().doubleValue()
                    * item.getQuantity();
        }

        AddressDao addressDao = new AddressDao();

        List<Address> addresses = addressDao.getAddressesByUserId(user.getId());

        request.setAttribute("addresses", addresses);

        request.setAttribute("selectedCartItems", selectedCart);
        request.setAttribute("total", total);

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
        String[] selectedIds = request.getParameterValues("selectedItems");

        if (fullCart == null || selectedIds == null) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        List<CartItem> cart = new ArrayList<>();

        for (String idStr : selectedIds) {
            int variantId = Integer.parseInt(idStr);

            CartItem item = fullCart.get(variantId);
            if (item != null) {
                cart.add(item);
            }
        }

        if (cart.size() == 0) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String addressIdStr = request.getParameter("address_id");
        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("paymentMethod");

        if (paymentMethod == null) {
            paymentMethod = "COD";
        }

        int addressId = Integer.parseInt(addressIdStr);

        try {

            int orderId = orderDao.checkout(
                    user.getId(),
                    fullName,
                    phone,
                    addressId,
                    note,
                    paymentMethod,
                    cart
            );

            for (CartItem bought : cart) {
                fullCart.remove(bought.getVariant().getId());
            }

            session.setAttribute("CART", fullCart);

            response.sendRedirect("MyPageServlet?tab=don-hang&success=1&orderId=" + orderId);

        } catch (Exception e) {

            response.sendRedirect("CartServlet?action=view&error=1");
        }
    }
}