package controller;

import dao.ProductDao;
import dao.SourceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Source;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminCountProductSourceServlet", value = "/AdminCountProductSourceServlet")
public class AdminCountProductSourceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SourceDao sourceDao = new SourceDao();

        List<Source> listS = sourceDao.getAllSourcesWithProductCount("");

        request.setAttribute("listS", listS);
        request.setAttribute("activePage", "source");

        request.getRequestDispatcher("admin_source.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}