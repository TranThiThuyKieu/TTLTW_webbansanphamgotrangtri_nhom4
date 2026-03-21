package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.ProductTypeDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;
import model.ProductType;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txtSearch");
        if (txtSearch == null) {
            txtSearch = "";
        }
        String categoryIdStr = request.getParameter("categoryId");
        String typeIdStr = request.getParameter("typeId");
        String categoryId = (categoryIdStr == null || categoryIdStr.isEmpty())
                ? "" : categoryIdStr;

        String typeId = (typeIdStr == null || typeIdStr.isEmpty())
                ? "" : typeIdStr;
        ProductDao dao = new ProductDao();
        CategoryDao cDao = new CategoryDao();
        ProductTypeDao tDao = new ProductTypeDao();
        List<Category> listCategory = cDao.getAllCategory();
        List<ProductType> listType = tDao.getAll();
        List<Product> list = dao.searchProducts(txtSearch, typeId, categoryId);
        request.setAttribute("listCC", listCategory);
        request.setAttribute("listP", list);
        request.setAttribute("txtS", txtSearch);
        request.setAttribute("selectedCategory", categoryId);
        request.setAttribute("selectedType", typeId);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}