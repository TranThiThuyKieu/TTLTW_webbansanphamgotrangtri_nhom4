package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "VerifyOtpServlet", value = "/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {
    private static final int MAX_FAIL = 5;
    private static final long LOCK_DURATION = 60 * 60 * 1000;
    private static final long OTP_EXPIRE = 5 * 60 * 1000;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Integer failCount = (Integer) session.getAttribute("OTP_FAIL_COUNT");
        if (failCount == null) failCount = 0;
        Long lockTime = (Long) session.getAttribute("OTP_LOCK_TIME");
        if (lockTime != null) {
            long current = System.currentTimeMillis();
            if ((current - lockTime) < LOCK_DURATION) {
                request.setAttribute("SHOW_OTP", true);
                request.setAttribute("ERROR",
                        "Bạn đã nhập sai OTP quá 5 lần. OTP đã hết hiệu lực và tài khoản bị khóa trong 1 giờ!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            } else {
                session.removeAttribute("OTP_LOCK_TIME");
                session.removeAttribute("OTP_FAIL_COUNT");
                failCount = 0;
            }
        }
        String action = request.getParameter("action");
        if ("checkOnly".equals(action)) {
            String inputOtp = request.getParameter("otp");
            String sessionOtp = (String) session.getAttribute("OTP");
            response.setContentType("application/json");
            if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
                response.getWriter().write("{\"status\": \"success\"}");
            } else {
                response.getWriter().write("{\"status\": \"error\"}");
            }
            return;
        }
        String inputOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("OTP");
        Long otpTime = (Long) session.getAttribute("OTP_TIME");
        User regUser = (User) session.getAttribute("REG_USER");
        if (sessionOtp == null || otpTime == null || regUser == null) {
            request.setAttribute("ERROR_MESSAGE",
                    "Phiên đăng ký đã hết hạn. Vui lòng đăng ký lại!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        if (System.currentTimeMillis() - otpTime > OTP_EXPIRE) {
            session.removeAttribute("OTP");
            session.removeAttribute("OTP_TIME");
            session.removeAttribute("REG_USER");

            request.setAttribute("ERROR",
                    "OTP đã hết hạn sau 5 phút. Vui lòng đăng ký lại!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        if (!sessionOtp.equals(inputOtp)) {
            failCount++;
            if (failCount >= MAX_FAIL) {
                session.setAttribute("OTP_LOCK_TIME", System.currentTimeMillis());
                session.setAttribute("OTP_FAIL_COUNT", MAX_FAIL);
                session.removeAttribute("OTP");
                session.removeAttribute("OTP_TIME");

                request.setAttribute("SHOW_OTP", true);
                request.setAttribute("ERROR",
                        "Bạn đã nhập sai OTP 5 lần. OTP đã hết hiệu lực và bị khóa trong 1 giờ!");
            } else {
                session.setAttribute("OTP_FAIL_COUNT", failCount);

                request.setAttribute("SHOW_OTP", true);
                request.setAttribute("ERROR",
                        "OTP không đúng! Lần " + failCount + "/" + MAX_FAIL);
            }
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        session.removeAttribute("OTP_FAIL_COUNT");
        session.removeAttribute("OTP_LOCK_TIME");

        UserDao dao = new UserDao();
        dao.signup(
                regUser.getUsername(),
                regUser.getEmail(),
                regUser.getPassword()
        );
        session.removeAttribute("OTP");
        session.removeAttribute("OTP_TIME");
        session.removeAttribute("REG_USER");
        session.removeAttribute("RESEND_COUNT");
        session.removeAttribute("LAST_SEND_TIME");
        session.removeAttribute("RESEND_LOCK_TIME");
        session.removeAttribute("EMAIL_OTP");

        request.setAttribute("MESS_SUCCESS",
                "Đăng ký thành công! Vui lòng đăng nhập.");

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}