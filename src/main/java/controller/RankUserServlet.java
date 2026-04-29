package controller;

import dao.OrderDao;
import dao.RankConfigsDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.RankConfig;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RankUserServlet", value = "/RankUserServlet")
public class RankUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        RankConfigsDao dao = new RankConfigsDao();
        List<RankConfig> ranks = dao.getAllRanks();

        OrderDao orderDao = new OrderDao();


        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        int totalOrders = orderDao.countUserOrders(userId);
        double totalSpending = orderDao.sumUserSpending(userId);

        RankConfig current = null;
        RankConfig next = null;

        for (RankConfig r : ranks) {
            if (totalOrders >= r.getMinOrders() && totalSpending >= r.getMinSpending()) {
                current = r;
            }
        }

        if (current == null) {
            if (!ranks.isEmpty()) {
                next = ranks.get(0);
            }
        } else {
            for (RankConfig r : ranks) {
                if (r.getMinSpending() > current.getMinSpending()) {
                    next = r;
                    break;
                }
            }
        }

        double progress = 0;

        if (current != null && next != null) {
            double range = next.getMinSpending() - current.getMinSpending();
            if (range > 0) {
                progress = (totalSpending - current.getMinSpending()) / range * 100;
            }
        } else if (current != null && next == null) {
            progress = 100;
        }

        progress = Math.max(0, Math.min(progress, 100));
        double remainSpending = 0;
        int remainOrders = 0;

        if (next != null) {
            remainSpending = next.getMinSpending() - totalSpending;
            remainOrders = next.getMinOrders() - totalOrders;

            if (remainSpending < 0) remainSpending = 0;
            if (remainOrders < 0) remainOrders = 0;
        }

        request.setAttribute("remainSpending", remainSpending);
        request.setAttribute("remainOrders", remainOrders);

        request.setAttribute("ranks", ranks);
        request.setAttribute("currentRank", current);
        request.setAttribute("nextRank", next);
        request.setAttribute("progress", progress);
        request.setAttribute("orders", totalOrders);
        request.setAttribute("spending", totalSpending);

        request.getRequestDispatcher("hang_nguoi_dung.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}