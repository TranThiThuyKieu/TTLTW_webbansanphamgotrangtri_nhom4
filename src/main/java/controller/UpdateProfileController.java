package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import dao.UserDao;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import model.User;

@WebServlet(name = "UpdateProfileController", value = "/UpdateProfileController")
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("LOGGED_USER");
        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        UserDao userDao = new UserDao();
        try {
            String fullName = request.getParameter("fullName");
            String displayName = request.getParameter("displayName");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String birthDateStr = request.getParameter("birthDate");
            String avatarUrlRaw = request.getParameter("avatar_id");
            if (fullName == null || fullName.trim().isEmpty()) {
                request.setAttribute("error", "Tên không được để trống!");
                request.setAttribute("activeTab", "ho-so");
                request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                return;
            }
            if (!fullName.matches("^[\\p{L} ]{2,50}$")) {
                request.setAttribute("error", "Tên chỉ được chứa chữ cái và không có ký tự đặc biệt!");
                request.setAttribute("activeTab", "ho-so");
                request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                return;
            }
            if (phone == null || phone.trim().isEmpty()) {
                request.setAttribute("error", "Số điện thoại không được để trống!");
                request.setAttribute("activeTab", "ho-so");
                request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                return;
            }
            phone = phone.trim();
            if (!phone.matches("^0[0-9]{9}$")) {
                request.setAttribute("error", "Số điện thoại phải có 10 số và bắt đầu bằng 0!");
                request.setAttribute("activeTab", "ho-so");
                request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                return;
            }
            if (!phone.equals(loggedUser.getPhone()) && userDao.isPhoneExists(phone)) {
                request.setAttribute("error", "Số điện thoại đã tồn tại!");
                request.setAttribute("activeTab", "ho-so");
                request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                return;
            }
            String relativeAvatarUrl = null;
            if (avatarUrlRaw != null && !avatarUrlRaw.trim().isEmpty()) {
                relativeAvatarUrl = avatarUrlRaw.trim();
                String contextPath = request.getContextPath();
                if (relativeAvatarUrl.startsWith(contextPath)) {
                    relativeAvatarUrl = relativeAvatarUrl.substring(contextPath.length());
                }
            }

            User userToUpdate = new User();
            userToUpdate.setId(loggedUser.getId());
            userToUpdate.setUsername(fullName);
            userToUpdate.setDisplayName(displayName);
            userToUpdate.setPhone(phone);
            userToUpdate.setGender(gender);

            if (birthDateStr != null && !birthDateStr.trim().isEmpty()) {
                LocalDate birthDate = LocalDate.parse(birthDateStr);
                LocalDate today = LocalDate.now();
                if (birthDate.isAfter(today)) {
                    request.setAttribute("error", "Ngày sinh không được ở tương lai!");
                    request.setAttribute("activeTab", "ho-so");
                    request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                    return;
                }
                int age = Period.between(birthDate, today).getYears();
                if (age < 13) {
                    request.setAttribute("error", "Bạn phải đủ 13 tuổi!");
                    request.setAttribute("activeTab", "ho-so");
                    request.getRequestDispatcher("mypage_user.jsp").forward(request, response);
                    return;
                }
                userToUpdate.setBirthDate(java.sql.Date.valueOf(birthDateStr));
            }

            if (relativeAvatarUrl != null) {
                int realImageId = userDao.getImageIdByUrl(relativeAvatarUrl);
                userToUpdate.setAvatarId(realImageId);
                userToUpdate.setAvatarUrl(relativeAvatarUrl);
            } else {
                userToUpdate.setAvatarId(loggedUser.getAvatarId());
                userToUpdate.setAvatarUrl(loggedUser.getAvatarUrl());
            }

            userDao.updateUserProfile(userToUpdate);

            User updatedUser = userDao.getUserById(loggedUser.getId());
            session.setAttribute("LOGGED_USER", updatedUser);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("MyPageServlet?tab=ho-so");
    }
}