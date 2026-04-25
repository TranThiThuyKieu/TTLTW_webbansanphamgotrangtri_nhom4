package controller;

import dao.ProductDao;
import dao.ProductTypeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductType;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminProductTypeServlet", value = "/AdminProductTypeServlet")
public class AdminProductTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ProductDao productDao = new ProductDao();
        ProductTypeDao productTypeDao = new ProductTypeDao();
        String keyword = request.getParameter("keyword");
        List<ProductType> listPT;
        if (keyword != null && !keyword.isEmpty()) {
            listPT = productTypeDao.searchProductTypes(keyword);
        } else {
            listPT = productDao.getAllProductTypes();
        }
        String typeIdParam = request.getParameter("typeId");
        if (typeIdParam != null && !typeIdParam.isEmpty()) {
            try {
                int typeId = Integer.parseInt(typeIdParam);
                List<model.Product> productList = productDao.getProductsByTypeId(typeId);
                request.setAttribute("productList", productList);
                String selectedTypeName = "";
                for(ProductType pt : listPT) {
                    if(pt.getId() == typeId) {
                        selectedTypeName = pt.getProductTypeName();
                        break;
                    }
                }
                request.setAttribute("selectedTypeName", selectedTypeName);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        request.setAttribute("viewMode", "products");
    } else {
        request.setAttribute("viewMode", "categories");
    }
        Map<Integer, Integer> productCountMap = productDao.countProductByType();
        request.setAttribute("listPT", listPT);
        request.setAttribute("productCountMap", productCountMap);
        request.setAttribute("keyword", keyword);
        request.setAttribute("activePage", "productType");
        request.getRequestDispatcher("admin_products_type.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}