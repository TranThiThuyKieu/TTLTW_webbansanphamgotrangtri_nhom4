package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.SourceDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductAllServlet", value = "/ProductAllServlet")
public class ProductAllServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        CategoryDao cDao = new CategoryDao();
        SourceDao sDao = new SourceDao();
        String sort = request.getParameter("sort");
        List<Product> listP = dao.getAllProductsSorted(sort);
        List<Category> listCC = cDao.getAllCategory();
        request.setAttribute("listSource", sDao.getAllSources());
        request.setAttribute("listCC", listCC);
        request.setAttribute("listType", dao.getAllProductTypes());
        request.setAttribute("listColor", dao.getAllColors());
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("product_all_user.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}