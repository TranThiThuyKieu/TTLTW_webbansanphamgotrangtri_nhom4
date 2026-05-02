package controller;

import dao.AddressDao;
import dao.PaymentDao;
import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

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
            tab = (String) request.getAttribute("activeTab");
        }

        if (tab == null) {
            tab = "ho-so";
        }
        request.setAttribute("activeTab", tab);
        if (tab.equals("thanh-toan")) {

            PaymentDao dao = new PaymentDao();
            List<Payment> listPayments = dao.getPaymentsByUserId(user.getId());
            request.setAttribute("listPayments", listPayments);

        }
        else if (tab.equals("don-hang")) {
            Integer monthlyOrderCount = null;
            Integer yearlyOrderCount = null;
            OrderDao orderDao = new OrderDao();
            List<Order> allOrders = orderDao.getOrdersByUserId(user.getId());

            String status = request.getParameter("status");
            List<Order> list = new ArrayList<>();

            int countOrder = 0;
            double totalSpent = 0;

            for (Order o : allOrders) {

                o.setDetails(orderDao.getDetailsByOrderId(o.getId()));

                if ("Đã giao".equals(o.getStatus()) && "Đã thanh toán".equals(o.getPaymentStatus())) {
                    countOrder++;
                    totalSpent += o.getTotalOrder();
                }

                if (status == null || status.isEmpty() || o.getStatus().equals(status)) {
                    list.add(o);
                }
            }
            double[] monthlyTotal = new double[12];
            Map<Integer, Double> yearlyTotal = new HashMap<>();
            for (Order o : allOrders) {
                o.setDetails(orderDao.getDetailsByOrderId(o.getId()));
                if ("Đã giao".equals(o.getStatus()) && "Đã thanh toán".equals(o.getPaymentStatus())) {
                    countOrder++;
                    totalSpent += o.getTotalOrder();
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    cal.setTime(o.getCreateAt());
                    int month = cal.get(java.util.Calendar.MONTH);
                    int year = cal.get(java.util.Calendar.YEAR);
                    monthlyTotal[month] += o.getTotalOrder();
                    yearlyTotal.put(year,
                            yearlyTotal.getOrDefault(year, 0.0) + o.getTotalOrder());
                }
                if (status == null || status.isEmpty() || o.getStatus().equals(status)) {
                    list.add(o);
                }
            }
            String monthRaw = request.getParameter("month");
            String yearRaw = request.getParameter("year");
            String yearOnlyRaw = request.getParameter("yearOnly");
            Double monthlyResult = null;
            Double yearlyResult = null;
            if (monthRaw != null && yearRaw != null) {
                int month = Integer.parseInt(monthRaw) - 1;
                int year = Integer.parseInt(yearRaw);
                double total = 0;
                int count = 0;
                for (Order o : allOrders) {
                    if ("Đã giao".equals(o.getStatus()) && "Đã thanh toán".equals(o.getPaymentStatus())) {

                        java.util.Calendar cal = java.util.Calendar.getInstance();
                        cal.setTime(o.getCreateAt());

                        int m = cal.get(java.util.Calendar.MONTH);
                        int y = cal.get(java.util.Calendar.YEAR);

                        if (m == month && y == year) {
                            total += o.getTotalOrder();
                            count++;
                        }
                    }
                }
                monthlyResult = total;
                monthlyOrderCount = count;
            }
            if (yearOnlyRaw != null) {
                int year = Integer.parseInt(yearOnlyRaw);

                double total = 0;
                int count = 0;
                for (Order o : allOrders) {
                    if ("Đã giao".equals(o.getStatus()) && "Đã thanh toán".equals(o.getPaymentStatus())) {
                        java.util.Calendar cal = java.util.Calendar.getInstance();
                        cal.setTime(o.getCreateAt());

                        int y = cal.get(java.util.Calendar.YEAR);

                        if (y == year) {
                            total += o.getTotalOrder();
                            count++;
                        }
                    }
                }
                yearlyResult = total;
                yearlyOrderCount = count;
            }
            request.setAttribute("monthlyOrderCount", monthlyOrderCount);
            request.setAttribute("yearlyOrderCount", yearlyOrderCount);
            request.setAttribute("monthlyResult", monthlyResult);
            request.setAttribute("yearlyResult", yearlyResult);
            request.setAttribute("monthlyTotal", monthlyTotal);
            request.setAttribute("yearlyTotal", yearlyTotal);
            request.setAttribute("listO", list);
            request.setAttribute("countOrder", countOrder);
            request.setAttribute("totalSpent", totalSpent);
            request.setAttribute("allOrders", allOrders);

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
        doGet(request, response);
    }
}