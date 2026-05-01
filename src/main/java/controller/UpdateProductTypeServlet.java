package controller;

import dao.ProductTypeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateProductTypeServlet", value = "/update-product-type")
public class UpdateProductTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manage-product-types");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductTypeDao dao = new ProductTypeDao();
        try {
            String idRaw = request.getParameter("id");
            String name = request.getParameter("productTypeName");
            if (idRaw != null && name != null) {
                int id = Integer.parseInt(idRaw);
                name = name.trim();
                if (dao.isExistNameForUpdate(name, id)) {
                    request.getSession().setAttribute("msg", "Tên '" + name + "' đã tồn tại ở loại sản phẩm khác!");
                    request.getSession().setAttribute("msgType", "error");
                } else {
                    if (dao.updateProductType(id, name)) {
                        request.getSession().setAttribute("msg", "Cập nhật thành công!");
                        request.getSession().setAttribute("msgType", "success");
                    } else {
                        request.getSession().setAttribute("msg", "Cập nhật thất bại!");
                        request.getSession().setAttribute("msgType", "error");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("AdminProductTypeServlet");
    }
}