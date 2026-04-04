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
    FlashSaleDAO dao = new FlashSaleDAO();

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
        if ("checkOverlapUpdate".equals(action)) {
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");
            int id = Integer.parseInt(request.getParameter("id"));

            boolean isOverlap = dao.isTimeOverlapExcludeId(start, end, id);

            response.setContentType("application/json");
            response.getWriter().write("{\"overlap\": " + isOverlap + "}");
            return;
        }


        request.getRequestDispatcher("admin_create_flashsale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("toggleStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));

            FlashSale fs = dao.getFlashSaleById(id);

            if (status == 1 && dao.isTimeOverlap(fs.getStartDate().toString(), fs.getEndDate().toString())) {
                response.setContentType("application/json");
                response.getWriter().write("{\"error\":\"TIME_OVERLAP\"}");
                return;
            }

            dao.updateStatus(id, status);

            response.setContentType("application/json");
            response.getWriter().write("{\"success\":true}");
            return;
        }
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("campaignName");
            String note = request.getParameter("note");
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");

            if (dao.isTimeOverlapExcludeId(start, end, id)) {
                response.setContentType("application/json");
                response.getWriter().write("{\"error\": \"TIME_OVERLAP\"}");
                return;
            }

            boolean success = dao.updateFlashSale(id, name, note, start, end);

            response.setContentType("application/json");
            if (success) {
                response.getWriter().write("{\"success\": true}");
            } else {
                response.getWriter().write("{\"error\": \"UPDATE_FAILED\"}");
            }
            return;
        }
        if("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = dao.deleteFlashSale(id);
            if(success) {
                response.getWriter().write("OK");
            } else {
                response.getWriter().write("ERROR");
            }
            return;
        }
        if ("checkOverlap".equals(action)) {
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");

            boolean isOverlap = dao.isTimeOverlap(start, end);

            response.setContentType("application/json");
            response.getWriter().write("{\"overlap\": " + isOverlap + "}");
            return;
        }
        if ("checkOverlapUpdate".equals(action)) {
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");
            int id = Integer.parseInt(request.getParameter("id"));

            boolean isOverlap = dao.isTimeOverlapExcludeId(start, end, id);

            response.setContentType("application/json");
            response.getWriter().write("{\"overlap\": " + isOverlap + "}");
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
        if (dao.isTimeOverlap(start, end)) {
            response.setContentType("application/json");
            response.getWriter().write("{\"error\": \"TIME_OVERLAP\"}");
            return;
        }
        boolean success = dao.insertFlashSale(campaignName, note, start, end,
                variantIds, percents, flashPrices, stocks);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (success) {
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"error\": \"INSERT_FAILED\"}");
        }
    }
}