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
        Long lastSendTime = (Long) session.getAttribute("LAST_OTP_SEND");
        if (lastSendTime != null) {
            long diff = System.currentTimeMillis() - lastSendTime;
            if (diff < 60 * 1000) {
                request.setAttribute("Error", "Vui lòng chờ 60 giây để gửi lại mã!");
                request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
                return;
            }
        }        String newOtp = String.valueOf((int)(Math.random() * 900000 + 100000));
        try {
            EmailUtils.sendOTP(email, newOtp);
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("OTP", newOtp);
        session.setAttribute("OTP_TIME", System.currentTimeMillis());
        session.setAttribute("LAST_OTP_SEND", System.currentTimeMillis());
        request.setAttribute("Error", "Mã OTP mới đã được gửi!");
        request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
    }
}