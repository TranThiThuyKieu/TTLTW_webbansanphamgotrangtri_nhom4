package controller;

import dao.FlashSaleDAO;
import dao.ProductVariantsDao;
import model.ProductVariants;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FlashSaleController", value = "/FlashSaleController")
public class FlashSaleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductVariantsDao pvDao = new ProductVariantsDao();
        List<ProductVariants> list = pvDao.getAllVariants();
        request.setAttribute("listVariants", list);
        request.getRequestDispatcher("admin_create_flashsale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String campaignName = request.getParameter("campaignName");
        String note = request.getParameter("note");
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String[] variantIds = request.getParameterValues("sku[]");
        String[] percents = request.getParameterValues("discountPercent[]");
        String[] flashPrices = request.getParameterValues("flashPrice[]");
        String[] stocks = request.getParameterValues("saleStock[]");

        FlashSaleDAO dao = new FlashSaleDAO();
        boolean success = dao.insertFlashSale(campaignName, note, start, end,
                variantIds, percents, flashPrices, stocks);

        if (success) {
            response.sendRedirect("FlashSaleController?msg=success");
        } else {
            response.sendRedirect("FlashSaleController?msg=error");
        }
    }
}