package controller;

import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RevenueStatsServlet", value = "/RevenueStatsServlet")
public class RevenueStatsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        String type = request.getParameter("type");
        double revenue = dao.getRevenueByTime(type);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"revenue\":" + revenue + "}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}