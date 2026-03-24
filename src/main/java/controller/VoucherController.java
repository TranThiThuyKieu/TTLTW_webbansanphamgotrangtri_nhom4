package controller;

import dao.VoucherDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;

@WebServlet(name = "VoucherController ", value = "/VoucherController")
public class VoucherController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String code = request.getParameter("voucherCode");
            String name = request.getParameter("voucherName");
            String desc = request.getParameter("description");
            String type = request.getParameter("promoType");
            double val = Double.parseDouble(request.getParameter("promoValue"));
            double minVal = Double.parseDouble(request.getParameter("minOrderValue"));
            String style = request.getParameter("rewardStyle");
            int total = Integer.parseInt(request.getParameter("totalRelease"));
            int maxUser = Integer.parseInt(request.getParameter("maxPerUser"));
            LocalDateTime start = LocalDateTime.parse(request.getParameter("startDate"));
            LocalDateTime end = LocalDateTime.parse(request.getParameter("endDate"));

            Voucher v = new Voucher();
            v.setVoucherCode(code.toUpperCase());
            v.setVoucherName(name);
            v.setDescription(desc);
            v.setPromoType(type);
            v.setPromoValue(val);
            v.setMinOrderValue(minVal);
            v.setRewardStyle(style);
            v.setTotalRelease(total);
            v.setMaxPerUser(maxUser);
            v.setStartDate(start);
            v.setEndDate(end);
            if ("SPECIAL".equals(style)) {
                String[] listRank = request.getParameterValues("memberRank");
                if (listRank != null) {
                    v.setApplicableRanks(Arrays.asList(listRank));
                }
            }
            VoucherDAO dao = new VoucherDAO();
            if (dao.insertVoucher(v)) {
                response.sendRedirect("admin_giamgia_product.jsp?msg=ok");
            } else {
                response.sendRedirect("admin_giamgia_product.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_giamgia_product.jsp?msg=error");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin_create_voucher.jsp");
    }
}