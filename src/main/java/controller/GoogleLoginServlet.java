package controller;

import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.GooglePojo;
import model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "GoogleLoginServlet", value = "/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
    private static final String CLIENT_ID = "1089942878583-pq5ui5eubco8s2lav650ln4gn19gogfe.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/backend_war_exploded/GoogleLoginServlet";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            String accessToken = getToken(code);
            GooglePojo acc = getUserInfo(accessToken);
            UserDao userDao = new UserDao();
            if (!userDao.checkEmailExist(acc.getEmail())) {
                userDao.signup(acc.getName(), acc.getEmail(), null); 
            }
            User user = userDao.getUserByEmail(acc.getEmail());
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGGED_USER", user);
                response.sendRedirect("HomeServlet");
            } else {
                throw new Exception("");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
    public String getToken(String code) throws Exception {
        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        String params = "code=" + code
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET
                + "&redirect_uri=" + REDIRECT_URI
                + "&grant_type=authorization_code";
        try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())) {
            writer.write(params);
            writer.flush();
        }
        StringBuilder result = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
        }
        String s = result.toString();
        int start = s.indexOf("\"access_token\": \"") + 17;
        int end = s.indexOf("\"", start);
        return s.substring(start, end);
    }
    public GooglePojo getUserInfo(String accessToken) throws Exception {
        URL url = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        StringBuilder result = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
        }
        String s = result.toString();
        GooglePojo acc = new GooglePojo();
        int emailStart = s.indexOf("\"email\": \"") + 10;
        int emailEnd = s.indexOf("\"", emailStart);
        acc.setEmail(s.substring(emailStart, emailEnd));
        int nameStart = s.indexOf("\"name\": \"") + 9;
        int nameEnd = s.indexOf("\"", nameStart);
        acc.setName(s.substring(nameStart, nameEnd));
        return acc;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}