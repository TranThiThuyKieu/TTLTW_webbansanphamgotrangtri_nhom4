package controller;

import dao.ReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "ReplyReviewServlet", value = "/ReplyReview")
public class ReplyReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int parentId = Integer.parseInt(request.getParameter("parentId"));
        String comment = request.getParameter("comment");

        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("LOGGED_USER");
        int adminId = admin.getId();

        ReviewDao dao = new ReviewDao();
        boolean success = dao.insertReply(parentId, adminId, comment);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\":" + success + "}");
    }
}