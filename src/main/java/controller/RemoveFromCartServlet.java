package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "RemoveFromCartServlet", value = "/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int variantId = Integer.parseInt(request.getParameter("variantId"));

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("CART");

        if (cart != null) {
            cart.remove(variantId);
            session.setAttribute("CART", cart);
        }

        response.sendRedirect("CartServlet?action=view");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}