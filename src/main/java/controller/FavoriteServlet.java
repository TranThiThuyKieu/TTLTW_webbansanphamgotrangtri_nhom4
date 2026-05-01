package controller;

import dao.FavoritesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FavoriteServlet", value = "/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    private FavoritesDao favoriteDao = new FavoritesDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("LOGGED_USER");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        List<Product> list = favoriteDao.getFavoriteByUser(user.getId());
        request.setAttribute("listFav", list);
        request.getRequestDispatcher("yeuthich.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}