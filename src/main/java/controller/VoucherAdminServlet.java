package controller;

import dao.VoucherDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VoucherAdminServlet", value = "/VoucherAdminServlet")
public class VoucherAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        List<Voucher> listV = dao.getAllVouchers();
        request.setAttribute("listVoucher", listV);
        request.getRequestDispatcher("admin_giamgia_product.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}