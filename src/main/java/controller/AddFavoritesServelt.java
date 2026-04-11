package controller;

import dao.FavoritesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddFavoritesServelt", value = "/AddFavoritesServelt")
public class AddFavoritesServelt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");
        if (user == null) {
            out.print("{\"status\":\"login_required\"}");
            return;
        }
        int userId = user.getId();

        int productId = Integer.parseInt(request.getParameter("productId"));

        FavoritesDao dao = new FavoritesDao();

        boolean isExist = dao.isFavorite(userId, productId);

        if (isExist) {
            dao.removeFavorite(userId, productId);
            out.print("{\"status\":\"removed\"}");
        } else {
            dao.addFavorite(userId, productId);
            out.print("{\"status\":\"added\"}");
        }
    }
}