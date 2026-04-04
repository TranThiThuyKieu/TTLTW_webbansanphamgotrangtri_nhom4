package controller;

import dao.VoucherDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;

import java.io.IOException;

@WebServlet(name = "VoucherDetailServlet", value = "/VoucherDetailServlet")
public class VoucherDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        if (idRaw == null) {
            response.sendRedirect("HomeServlet");
            return;
        }
        int id = Integer.parseInt(idRaw);

        VoucherDAO dao = new VoucherDAO();
        Voucher v = dao.getVoucherById(id);
        request.setAttribute("startDate", java.sql.Timestamp.valueOf(v.getStartDate()));
        request.setAttribute("endDate", java.sql.Timestamp.valueOf(v.getEndDate()));
        request.setAttribute("voucher", v);
        request.getRequestDispatcher("voucher_detail_user.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}