package controller;

import dao.ProductDao;
import dao.SourceDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductFilterServlet", value = "/ProductFilterServlet")
public class ProductFilterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        SourceDao sDao = new SourceDao();
        request.setAttribute("listType", dao.getAllProductTypes());
        request.setAttribute("listColor", dao.getAllColors());
        request.setAttribute("listSource", sDao.getAllSources());
        String[] types = request.getParameterValues("type");
        String[] prices = request.getParameterValues("price");
        String[] ratings = request.getParameterValues("rating");
        String colorParam = request.getParameter("color");
        String sourceParam = request.getParameter("source");
        String cidStr = request.getParameter("cid");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        Integer categoryId = (cidStr != null && !cidStr.isEmpty())
                ? Integer.parseInt(cidStr)
                : null;
        List<Product> listP = dao.filterProductsWithColor(
                types, prices, ratings, categoryId, colorParam,sourceParam,minPrice,maxPrice
        );
        request.setAttribute("listP", listP);
        request.setAttribute("activeCategoryId", categoryId);
        String returnPage = request.getParameter("returnPage");
        if (returnPage == null || returnPage.isEmpty()) {
            returnPage = "product_all_user.jsp";
        }
        request.getRequestDispatcher(returnPage)
                .forward(request, response);
    }
}