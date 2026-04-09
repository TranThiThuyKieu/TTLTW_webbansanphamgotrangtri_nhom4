package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet(name = "VerifyOtpResetServlet", value = "/VerifyOtpResetServlet")
public class VerifyOtpResetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String inputOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("OTP");
        Long otpTime = (Long) session.getAttribute("OTP_TIME");
        Integer failCount = (Integer) session.getAttribute("OTP_FAIL_COUNT");
        Long lockTime = (Long) session.getAttribute("OTP_LOCK_TIME");
        if (failCount == null) {
            failCount = 0;
        }
        if (lockTime != null) {
            long now = System.currentTimeMillis();
            if (now - lockTime < 15 * 60 * 1000) {
                request.setAttribute("Error", "Vui lòng thử lại sau 15 phút!");
                request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
                return;
            } else {
                session.removeAttribute("OTP_LOCK_TIME");
                session.setAttribute("OTP_FAIL_COUNT", 0);
                failCount = 0;
            }
        }
        if (sessionOtp == null || otpTime == null) {
            request.setAttribute("Error", "OTP hết hạn!");
            request.getRequestDispatcher("/login_forgot_password.jsp").forward(request, response);
            return;
        }
        if (System.currentTimeMillis() - otpTime > 5 * 60 * 1000) {
            request.setAttribute("Error", "OTP đã hết hạn!");
            request.getRequestDispatcher("/login_forgot_password.jsp").forward(request, response);
            return;
        }
        if (!sessionOtp.equals(inputOtp)) {
            failCount++;
            session.setAttribute("OTP_FAIL_COUNT", failCount);
            if (failCount >= 5) {
                session.setAttribute("OTP_LOCK_TIME", System.currentTimeMillis());
                request.setAttribute("Error", "Bạn đã nhập sai quá 5 lần! Vui lòng thử lại sau 15 phút.");
            } else {
                request.setAttribute("Error", "OTP không đúng! (" + failCount + "/5)");
            }
            request.getRequestDispatcher("/login_otp_pass.jsp").forward(request, response);
            return;
        }
        session.removeAttribute("OTP_FAIL_COUNT");
        session.removeAttribute("OTP_LOCK_TIME");
        request.getRequestDispatcher("/login_pass_new.jsp").forward(request, response);
    }
}