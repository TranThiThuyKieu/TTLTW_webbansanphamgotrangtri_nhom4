package controller;

import dao.CategoryDao;
import dao.ProductDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;
import model.Product;
import model.ProductType;

import java.io.IOException;
import java.util.List;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cid = request.getParameter("cid");
        if (cid == null) {
            response.sendRedirect("ProductAllServlet");
            return;
        }

        int categoryId = Integer.parseInt(cid);

        ProductDao pD = new ProductDao();
        CategoryDao cD = new CategoryDao();

        List<Product> listP = pD.getProductsByCategory(categoryId);
        List<ProductType> listT = pD.getAllProductTypes();
        List<model.ProductColor> listColor = pD.getAllColors();
        List<Category> listCC = cD.getAllCategory();

        String categoryName = "BỘ SƯU TẬP";
        String banner = "https://i.pinimg.com/1200x/4d/16/07/4d16076bd71f77a7b5f69963e875cac6.jpg";

        for (Category c : listCC) {
            if (c.getId() == categoryId) {
                categoryName = c.getCategoryName();
                break;
            }
        }

        request.setAttribute("listP", listP);
        request.setAttribute("listType", listT);
        request.setAttribute("listColor", listColor);
        request.setAttribute("listCC", listCC);
        request.setAttribute("categoryName", categoryName);
        request.setAttribute("categoryBanner", banner);

        request.getRequestDispatcher("product_category.jsp").forward(request, response);
    }
}