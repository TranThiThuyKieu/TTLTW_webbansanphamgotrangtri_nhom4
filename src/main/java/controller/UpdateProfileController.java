package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import dao.UserDao;
import java.io.IOException;
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