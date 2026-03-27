package controller;

import dao.FlashSaleDAO;
import dao.ProductVariantsDao;
import model.FlashSale;
import model.FlashSaleDetail;
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
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            FlashSaleDAO fsDao = new FlashSaleDAO();
            FlashSale fs = fsDao.getFlashSaleById(id);
            request.setAttribute("flashSale", fs);
            List<FlashSaleDetail> details = fsDao.getFlashSaleDetails(id);
            request.setAttribute("flashSaleDetails", details);
            request.getRequestDispatcher("admin_edit_flashsale.jsp").forward(request, response);
            return;
        }


        request.getRequestDispatcher("admin_create_flashsale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        FlashSaleDAO dao = new FlashSaleDAO();
        if ("toggleStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            dao.updateStatus(id, status);
            response.getWriter().write("OK");
            return;
        }
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("campaignName");
            String note = request.getParameter("note");
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");
            boolean success = dao.updateFlashSale(id, name, note, start, end);
            if (success) {
                response.sendRedirect("FlashSaleAdminServlet?msg=success");
            } else {
                response.sendRedirect("FlashSaleAdminServlet?msg=error");
            }
            return;
        }
        String campaignName = request.getParameter("campaignName");
        String note = request.getParameter("note");
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String[] variantIds = request.getParameterValues("sku[]");
        String[] percents = request.getParameterValues("discountPercent[]");
        String[] flashPrices = request.getParameterValues("flashPrice[]");
        String[] stocks = request.getParameterValues("saleStock[]");
        boolean success = dao.insertFlashSale(campaignName, note, start, end,
                variantIds, percents, flashPrices, stocks);

        if (success) {
            response.sendRedirect("FlashSaleController?msg=success");
        } else {
            response.sendRedirect("FlashSaleController?msg=error");
        }
    }
}