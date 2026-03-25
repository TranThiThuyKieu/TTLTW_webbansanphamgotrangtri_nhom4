package controller;

import dao.ContactSettingsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ContactSettings;

import java.io.IOException;
@WebServlet("/update-contact-settings")
public class UpdateContactSettingsServlet extends HttpServlet {

    private final ContactSettingsDao settingsDao = new ContactSettingsDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            ContactSettings settings = new ContactSettings();
            settings.setPhone(req.getParameter("phone"));
            settings.setEmail(req.getParameter("email"));
            settings.setDetail(req.getParameter("detail"));
            settings.setProvince_id(Integer.parseInt(req.getParameter("province_id")));
            settings.setProvince(req.getParameter("province"));
            settings.setDistrict_id(Integer.parseInt(req.getParameter("district_id")));
            settings.setDistrict(req.getParameter("district"));
            settings.setWard_code(req.getParameter("ward_code"));
            settings.setWard(req.getParameter("ward"));
            settings.setFacebookUrl(req.getParameter("facebook_url"));
            settings.setInstagramUrl(req.getParameter("instagram_url"));
            settings.setTwitterUrl(req.getParameter("twitter_url"));
            settings.setGoogleUrl(req.getParameter("google_url"));

            boolean success = settingsDao.updateSettings(settings);

            String redirectUrl = req.getContextPath() + "/admin-contact-settings";

            if (success) {
                resp.sendRedirect(redirectUrl + "?success=true");
            } else {
                resp.sendRedirect(redirectUrl + "?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    req.getContextPath() + "/admin-contact-settings?error=system"
            );
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/admin-contact-settings");
    }

}