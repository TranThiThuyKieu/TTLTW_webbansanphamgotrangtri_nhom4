package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerManagerServlet", value = "/admin/customers")
public class CustomerManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDao dao = new UserDao();
        String keyword = request.getParameter("keyword");
        List<User> list;
        if (keyword != null && !keyword.trim().isEmpty()) {
            list = dao.searchCustomers(keyword);
        } else {
            list = dao.getAllCustomers();
        }
        String action = request.getParameter("action");
        if ("toggleStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            dao.updateStatus(id, status);
            response.sendRedirect("customers");
            return;
        }
        request.setAttribute("listUsers", list);
        request.setAttribute("listUsers", list);
        request.getRequestDispatcher("/admin_customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}