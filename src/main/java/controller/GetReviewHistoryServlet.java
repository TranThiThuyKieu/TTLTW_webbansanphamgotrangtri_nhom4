package controller;

import dao.ReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Reviews;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetReviewHistoryServlet", value = "/GetReviewHistory")
public class GetReviewHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int parentId = Integer.parseInt(request.getParameter("parentId"));
        ReviewDao dao = new ReviewDao();
        List<Reviews> history = dao.getChatHistoryByUserId(parentId);

        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < history.size(); i++) {
            Reviews r = history.get(i);
            json.append("{");
            json.append("\"id\":").append(r.getId()).append(",");
            json.append("\"response_id\":").append(r.getRespone_id()).append(",");
            json.append("\"comment\":\"").append(escapeJson(r.getComment())).append("\",");
            json.append("\"createAt\":\"").append(r.getCreateAt()).append("\"");
            json.append("}");
            if (i < history.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }

}