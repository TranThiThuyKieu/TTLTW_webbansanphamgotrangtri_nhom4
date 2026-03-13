package controller;

import dao.AddressDao;
import dao.PaymentDao;
import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "MyPageServlet", value = "/MyPageServlet")
public class MyPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String tab = request.getParameter("tab");
        if (tab == null) {
            tab = "ho-so";
        }
        request.setAttribute("activeTab", tab);
        if (tab.equals("thanh-toan")) {

            PaymentDao dao = new PaymentDao();
            List<Payment> listPayments = dao.getPaymentsByUserId(user.getId());
            request.setAttribute("listPayments", listPayments);

        }

        else if (tab.equals("dia-chi")) {

            AddressDao dao = new AddressDao();
            List<Address> addresses = dao.getAddressesByUserId(user.getId());
            request.setAttribute("addresses", addresses);

        }

        request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}