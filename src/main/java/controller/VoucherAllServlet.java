package controller;

import dao.VoucherDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VoucherAllServlet", value = "/voucher-all")
public class VoucherAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        List<Voucher> list = dao.getAllValidVouchers();
        request.setAttribute("voucherList", list);
        request.getRequestDispatcher("voucher_all_user.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}