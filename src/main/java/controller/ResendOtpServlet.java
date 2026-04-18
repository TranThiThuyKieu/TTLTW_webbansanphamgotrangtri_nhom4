package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import utils.EmailUtils;

import java.io.IOException;

@WebServlet(name = "ResendOtpServlet", value = "/ResendOtpServlet")
public class ResendOtpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("RESET_EMAIL");

        if (email == null) {
            response.sendRedirect("login_forgot_password.jsp");
            return;
        }

        long currentTime = System.currentTimeMillis();

        Long lockTime = (Long) session.getAttribute("LOCK_TIME_" + email);
        if (lockTime != null) {
            if (currentTime - lockTime < 15 * 60 * 1000) {
                long remainingMin = (15 * 60 * 1000 - (currentTime - lockTime)) / 60000;
                request.setAttribute("Error", "Bạn đã thử quá nhiều lần. Vui lòng thử lại sau " + (remainingMin + 1) + " phút.");
                request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
                return;
            } else {
                session.removeAttribute("LOCK_TIME_" + email);
                session.setAttribute("RESEND_COUNT_" + email, 0);
            }
        }

        Long lastSendTime = (Long) session.getAttribute("LAST_OTP_SEND");
        if (lastSendTime != null && (currentTime - lastSendTime < 30 * 1000)) {
            request.setAttribute("Error", "Vui lòng chờ 30 giây để gửi lại mã!");
            request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
            return;
        }

        Integer resendCount = (Integer) session.getAttribute("RESEND_COUNT_" + email);
        if (resendCount == null) resendCount = 0;

        if (resendCount >= 3) {
            session.setAttribute("LOCK_TIME_" + email, currentTime);
            request.setAttribute("Error", "Vượt quá 3 lần gửi. Vui lòng thử lại sau 15 phút.");
            request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
            return;
        }

        String newOtp = String.valueOf((int)(Math.random() * 900000 + 100000));
        try {
            EmailUtils.sendOTP(email, newOtp);
            resendCount++;
            session.setAttribute("OTP", newOtp);
            session.setAttribute("OTP_TIME", currentTime);
            session.setAttribute("LAST_OTP_SEND", currentTime);
            request.setAttribute("Error", "Mã OTP mới đã được gửi! (Giới hạn " + resendCount + "/3)");
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
    }
}