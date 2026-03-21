package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        Integer failedAttempts = (Integer) session.getAttribute("failedAttempts");
        Long lockTime = (Long) session.getAttribute("lockTime");
        if (failedAttempts == null) failedAttempts = 0;
        if (lockTime != null) {
            long currentTime = System.currentTimeMillis();
            long diff = currentTime - lockTime;
            if (diff < 15 * 60 * 1000) {
                request.setAttribute("Error",
                        "Bạn đã nhập sai quá nhiều lần. Vui lòng thử lại sau 15 phút!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            } else {
                session.removeAttribute("lockTime");
                session.setAttribute("failedAttempts", 0);
                failedAttempts = 0;
            }
        }

        UserDao dao = new UserDao();
        User user = dao.checkLogin(email, password);

        if (user == null) {
            failedAttempts++;
            session.setAttribute("failedAttempts", failedAttempts);
            if (failedAttempts >= 5) {
                session.setAttribute("lockTime", System.currentTimeMillis());
                request.setAttribute("Error",
                        "Bạn đã nhập sai quá nhiều lần. Vui lòng thử lại sau 15 phút!");
            } else {
                request.setAttribute("Error", "Email hoặc mật khẩu không chính xác!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            session.removeAttribute("failedAttempts");
            session.removeAttribute("lockTime");
            if (!"Active".equals(user.getStatus())) {
                request.setAttribute("Error", "Tài khoản của bạn đã bị khóa!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
            session.setAttribute("LOGGED_USER", user);
            if ("Admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin_homepage.jsp");
        } else if ("Staff".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/AdminProfileServlet");}
            else {
                response.sendRedirect(request.getContextPath() + "/HomeServlet");
            }
        }
    }
}