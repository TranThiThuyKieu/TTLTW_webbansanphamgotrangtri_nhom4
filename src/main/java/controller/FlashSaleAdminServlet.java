package controller;

import dao.FlashSaleDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.FlashSale;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FlashSaleAdminServlet", value = "/FlashSaleAdminServlet")
public class FlashSaleAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FlashSaleDAO dao = new FlashSaleDAO();
        List<FlashSale> listFS = dao.getAllFlashSales();
        request.setAttribute("listFlashSale", listFS);
        request.setAttribute("activeTab", "flashsale");
        request.getRequestDispatcher("admin_giamgia_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}