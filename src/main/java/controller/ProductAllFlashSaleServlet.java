package controller;

import dao.CategoryDao;
import dao.FlashSaleDAO;
import dao.ProductDao;
import dao.SourceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.FlashSale;
import model.FlashSaleDetail;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductAllFlashSaleServlet", value = "/ProductAllFlashSaleServlet")
public class ProductAllFlashSaleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();
        CategoryDao cDao = new CategoryDao();
        SourceDao sDao = new SourceDao();
        FlashSaleDAO fsDao = new FlashSaleDAO();

        String idRaw = request.getParameter("id");
        int flashSaleId;

        try {
            flashSaleId = Integer.parseInt(idRaw);
        } catch (Exception e) {
            response.sendRedirect("home");
            return;
        }

        String sort = request.getParameter("sort");

        FlashSale flashSale = fsDao.getFlashSaleById(flashSaleId);
        if (flashSale == null) {
            response.sendRedirect("home");
            return;
        }

        String[] types = request.getParameterValues("type");
        String[] prices = request.getParameterValues("price");
        String[] ratings = request.getParameterValues("rating");
        String color = request.getParameter("color");
        String source = request.getParameter("source");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");

        String cidRaw = request.getParameter("cid");
        Integer categoryId = null;

        if (cidRaw != null && !cidRaw.isEmpty()) {
            categoryId = Integer.parseInt(cidRaw);
        }

        List<FlashSaleDetail> listP = fsDao.filterFlashSaleProducts(
                flashSaleId,
                categoryId,
                types,
                prices,
                ratings,
                color,
                source,
                minPrice,
                maxPrice,
                sort
        );



        request.setAttribute("flashSale", flashSale);
        request.setAttribute("listP", listP);

        request.setAttribute("listSource", sDao.getAllSources());
        request.setAttribute("listCC", cDao.getAllCategory());
        request.setAttribute("listType", dao.getAllProductTypes());
        request.setAttribute("listColor", dao.getAllColors());

        request.getRequestDispatcher("product_all_flashsale.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}