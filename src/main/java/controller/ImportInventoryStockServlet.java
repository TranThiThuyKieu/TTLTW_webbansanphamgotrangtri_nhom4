package controller;

import dao.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.InventoryStock;
import model.InventoryStockItem;
import model.ProductVariants;
import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "ImportInventoryStockServlet", value = "/ImportInventoryStockServlet")
public class ImportInventoryStockServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("getVariants".equals(action)) {
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            ProductVariantsDao variantDao = new ProductVariantsDao();
            List<ProductVariants> variants = variantDao.getVariantsBySource(supplierId);

            String json = new com.google.gson.Gson().toJson(variants);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return; 
        }

        SourceDao sourceDao = new SourceDao();
        request.setAttribute("sources", sourceDao.getAllSources());

        String success = request.getParameter("success");
        if (success != null) {
            request.setAttribute("message", "Tạo phiếu nhập kho thành công!");
        }
        String error = request.getParameter("error");
        if (error != null) {
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi nhập kho!");
        }

        request.getRequestDispatcher("admin_import_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Integer userId = user.getId();


        Connection conn = null;

        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);

            String creatorName = request.getParameter("billCode");
            String importDateStr = request.getParameter("importDate");
            Timestamp importDate = Timestamp.valueOf(importDateStr + " 00:00:00");
            int sourceId = userId;

            String[] variantIds = request.getParameterValues("vId[]");
            String[] quantities = request.getParameterValues("qty[]");
            String[] prices = request.getParameterValues("prc[]");


            InventoryStock t = new InventoryStock();
            t.setType("IMPORT");
            t.setSource_id(sourceId);
            t.setCreated_by(userId);
            t.setCreated_at(importDate);
            t.setNote("Nhập kho( được tạo bởi: " + creatorName + ")");

            InvetoryStockDao stockDao = new InvetoryStockDao();
            int transactionId = stockDao.insertInvetoryStock(conn, t);

            if (transactionId <= 0) {
                throw new Exception("Insert inventory_stock failed");
            }

            InventoryStockItemDao itemDao = new InventoryStockItemDao();
            ProductVariantsDao variantDao = new ProductVariantsDao();

            for (int i = 0; i < variantIds.length; i++) {

                if (variantIds[i] == null || variantIds[i].isEmpty()) continue;

                int variantId = Integer.parseInt(variantIds[i]);
                int qty = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);

                InventoryStockItem item = new InventoryStockItem();
                item.setInventory_stock_id(transactionId);
                item.setVariant_id(variantId);
                item.setQuantity(qty);
                item.setPrice(price);

                itemDao.insertItem(conn, item);

                variantDao.updateStock(conn, variantId, qty);
            }

            conn.commit();

            response.sendRedirect("ImportInventoryStockServlet?success=1");

        } catch (Exception e) {
            e.printStackTrace();

            try {
                if (conn != null) conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            response.sendRedirect("ImportInventoryStockServlet?error=1");
        }
    }
}