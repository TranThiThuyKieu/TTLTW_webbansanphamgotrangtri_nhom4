package controller;

import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "OrderStatsServlet", value = "/OrderStatsServlet")
public class OrderStatsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        String type = request.getParameter("type");
        int count = dao.countOrdersByTime(type);
        response.setContentType("application/json");
        response.getWriter().write("{\"count\":" + count + "}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}