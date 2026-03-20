package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import utils.PasswordUtils;

import java.io.IOException;

@WebServlet(name = "ChangePasswordCustomerDetail", value = "/ChangePasswordCustomerDetail")
public class ChangePasswordCustomerDetail extends HttpServlet {
    private final UserDao userDao = new UserDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String targetUserId = request.getParameter("userId");
        String next = request.getParameter("newPassword");
        String confirm = request.getParameter("confirmPassword");
        String errorMsg = null;

        // Định nghĩa Regex tương tự JS
        String passRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d|.*[!@#$%^&*])(?=\\S+$).{8,}$";

        if (next == null || next.trim().isEmpty()) {
            errorMsg = "Vui lòng điền đầy đủ thông tin.";
        } else if (!next.matches(passRegex)) {
            errorMsg = "Mật khẩu không đủ mạnh (8+ ký tự, chữ hoa, thường, số/ký hiệu).";
        } else if (!next.equals(confirm)) {
            errorMsg = "Mật khẩu xác nhận không khớp.";
        }

        if (errorMsg != null) {
            session.setAttribute("errorMessage", errorMsg);
            response.sendRedirect("customer-detail?id=" + targetUserId);
            return;
        }

        try {
            int id = Integer.parseInt(targetUserId);
            // Lưu ý: Nhớ mã hóa mật khẩu (BCrypt/SHA) trước khi lưu vào DB!
            boolean ok = userDao.updatePassword(id, next);

            if (ok) {
                session.setAttribute("successMessage", "Đổi mật khẩu thành công.");
            } else {
                session.setAttribute("errorMessage", "Đổi mật khẩu thất bại.");
            }
            response.sendRedirect("customer-detail?id=" + targetUserId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}