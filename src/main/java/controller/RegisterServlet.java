package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import utils.EmailUtils;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if ("sendOtp".equals(action)) {
            String email = request.getParameter("email");
            Integer resendCount = (Integer) session.getAttribute("RESEND_COUNT");
            Long lastSendTime = (Long) session.getAttribute("LAST_SEND_TIME");
            Long lockTime = (Long) session.getAttribute("RESEND_LOCK_TIME");
            if (resendCount == null) resendCount = 0;
            long now = System.currentTimeMillis();
            response.setContentType("text/plain; charset=UTF-8");
            if (lockTime != null && (now - lockTime) < 15 * 60 * 1000) {
                response.setStatus(429);
                response.getWriter().write("Vui lòng thử lại sau 15 phút");
                return;
            }
            if (lastSendTime != null && (now - lastSendTime) < 30 * 1000) {
                response.setStatus(429);
                response.getWriter().write("Vui lòng chờ 30 giây");
                return;
            }
            if (resendCount >= 3) {
                session.setAttribute("RESEND_LOCK_TIME", now);
                response.setStatus(429);
                response.getWriter().write("Bạn đã gửi quá 3 lần. Vui lòng thử lại sau 15 phút");
                return;
            }
            String otp = String.valueOf((int) (Math.random() * 900000 + 100000));
            try {
                EmailUtils.sendOTP(email, otp);
                session.setAttribute("OTP", otp);
                session.setAttribute("OTP_TIME", System.currentTimeMillis());
                session.setAttribute("LAST_SEND_TIME", now);
                session.setAttribute("RESEND_COUNT", resendCount + 1);
                session.setAttribute("EMAIL_OTP", email);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
            return;
        }
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re_password");
        UserDao dao = new UserDao();
        if (!password.equals(rePassword)) {
            request.setAttribute("errorEmail", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        if (dao.checkEmailExist(email)) {
            request.setAttribute("errorEmail", "Email đã tồn tại!");
            request.setAttribute("oldUsername", username);
            request.setAttribute("oldEmail", email);
            request.setAttribute("hasRegisterError", true);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        String passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        if (!password.matches(passwordRegex)) {
            request.setAttribute("Error",
                    "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ in hoa, chữ thường, số và ký tự đặc biệt!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        String resendCountKey = "resendCount_" + email;
        String otpLockTimeKey = "otpLockTime_" + email;

        Long otpLockTime = (Long) session.getAttribute(otpLockTimeKey);
        if (otpLockTime != null && (System.currentTimeMillis() - otpLockTime < 15 * 60 * 1000)) {
            request.setAttribute("MESS_REGISTER", "Email này đang bị tạm khóa gửi mã. Thử lại sau 15 phút!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        session.setAttribute(resendCountKey, 1);
        session.removeAttribute(otpLockTimeKey);
        String otp = String.valueOf((int) (Math.random() * 900000 + 100000));
        try {
            EmailUtils.sendOTP(email, otp);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error", "Không gửi được OTP qua email!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        session.setAttribute("OTP", otp);
        session.setAttribute("OTP_TIME", System.currentTimeMillis());
        session.setAttribute("EMAIL_OTP", email);
        session.setAttribute("RESEND_COUNT", 1);
        session.setAttribute("LAST_SEND_TIME", System.currentTimeMillis());
        User tempUser = new User(username, password, "Active", "User", email, 0);
        session.setAttribute("REG_USER", tempUser);
        request.setAttribute("SHOW_OTP", true);
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
