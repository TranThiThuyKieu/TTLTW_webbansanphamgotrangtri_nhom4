package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.FacebookPojo;
import model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

@WebServlet(name = "FacebookLoginServlet", value = "/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    private static final String APP_ID = "1298685025550866";
    private static final String APP_SECRET = "fb5dbd7fb473f2ba676e90d696272a5f";
    private static final String REDIRECT_URI = "http://localhost:8080/backend_war_exploded/FacebookLoginServlet";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");

        if (code == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String accessToken = getAccessToken(code);
            FacebookPojo fbUser = getUserInfo(accessToken);

            UserDao userDao = new UserDao();

            if (!userDao.checkEmailExist(fbUser.getEmail())) {
                userDao.signup(fbUser.getName(), fbUser.getEmail(), null);
            }
            if (fbUser.getEmail() == null || fbUser.getEmail().isEmpty()) {
                request.setAttribute("Error", "Facebook không cung cấp email!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            User user = userDao.getUserByEmail(fbUser.getEmail());

            HttpSession session = request.getSession();
            session.setAttribute("LOGGED_USER", user);

            if ("Admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/AdminOverviewOrderServlet");
            } else if ("Staff".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/AdminProfileServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/HomeServlet");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public String getAccessToken(String code) throws Exception {
        String url = "https://graph.facebook.com/v18.0/oauth/access_token?"
                + "client_id=" + APP_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&client_secret=" + APP_SECRET
                + "&code=" + code;

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("GET");

        BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream()));

        StringBuilder result = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            result.append(line);
        }

        String response = result.toString();

        int start = response.indexOf("\"access_token\":\"") + 16;
        int end = response.indexOf("\"", start);

        return response.substring(start, end);
    }
    public FacebookPojo getUserInfo(String accessToken) throws Exception {

        String url = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("GET");

        BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8"));

        StringBuilder result = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            result.append(line);
        }

        JSONObject json = new JSONObject(result.toString());

        FacebookPojo fb = new FacebookPojo();
        fb.setId(json.optString("id"));
        fb.setName(json.optString("name"));
        fb.setEmail(json.optString("email"));

        return fb;
    }
}