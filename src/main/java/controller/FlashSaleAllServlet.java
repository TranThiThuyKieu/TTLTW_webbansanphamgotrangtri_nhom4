package controller;

import dao.FlashSaleDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.FlashSale;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FlashSaleAllServlet", value = "/FlashSaleAllServlet")
public class FlashSaleAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FlashSaleDAO dao = new FlashSaleDAO();
        List<FlashSale> list = dao.getAllFlashSalesUser();

        request.setAttribute("saleList", list);
        request.getRequestDispatcher("flashsale_all_user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}