package controller;

import dao.OrderDao;
import dao.ReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Reviews;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        try {
            OrderDao orderDao = new OrderDao();
            ReviewDao reviewDao = new ReviewDao();
            List<Order> allOrders = orderDao.getOrdersByUserId(user.getId());
            List<String> reviewedKeys = reviewDao.getReviewedKeysByUserId(user.getId());
            List<Reviews> myReviews = reviewDao.getReviewsByUserId(user.getId());
            request.setAttribute("allOrders", allOrders);
            request.setAttribute("reviewedKeys", reviewedKeys);
            request.setAttribute("myReviews", myReviews);

            request.getRequestDispatcher("review.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/homepage_user.jsp");
        }
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

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            ReviewDao dao = new ReviewDao();
            Reviews review = new Reviews();
            review.setUserId(user.getId());
            review.setProductId(productId);
            review.setOrderId(orderId);
            review.setRating(rating);
            review.setComment(comment != null ? comment.trim() : "");
            if (dao.addReview(review)) {
                session.setAttribute("successMessage", "Đánh giá thành công!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("ReviewServlet");
    }
}