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

        UserDao dao = new UserDao();
        User user = dao.checkLogin(email, password);

        if (user == null) {
            request.setAttribute("Error", "Email hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            if (!"Active".equals(user.getStatus())) {
                request.setAttribute("Error", "Tài khoản của bạn đã bị khóa!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
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