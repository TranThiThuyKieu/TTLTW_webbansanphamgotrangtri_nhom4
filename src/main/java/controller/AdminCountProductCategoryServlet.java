package controller;

import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminCountProductCategoryServlet", value = "/AdminCountProductCategoryServlet")
public class AdminCountProductCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao productDao = new ProductDao();

        String categoryIdRaw = request.getParameter("categoryId");

        if (categoryIdRaw != null) {
            int categoryId = Integer.parseInt(categoryIdRaw);

            List<Product> productList = productDao.getProductsByCategoryId(categoryId);

            List<Category> listC = productDao.getAllCategory();
            String categoryName = "";
            for (Category c : listC) {
                if (c.getId() == categoryId) {
                    categoryName = c.getCategoryName();
                    break;
                }
            }

            request.setAttribute("productList", productList);
            request.setAttribute("selectedCategoryName", categoryName);

        } else {
            List<Category> listC = productDao.getAllCategory();
            Map<Integer, Integer> productCountMap = productDao.countProductByCategory();

            request.setAttribute("listC", listC);
            request.setAttribute("productCountMap", productCountMap);
        }

        request.setAttribute("activePage", "category");
        request.getRequestDispatcher("admin_category.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}