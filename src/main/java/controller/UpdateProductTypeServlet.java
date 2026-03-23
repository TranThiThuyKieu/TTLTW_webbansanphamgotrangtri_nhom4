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

        try {
            String idRaw = request.getParameter("id");
            String name = request.getParameter("productTypeName");

            if (idRaw != null && name != null) {
                int id = Integer.parseInt(idRaw);

                ProductTypeDao dao = new ProductTypeDao();
                dao.updateProductType(id, name);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("AdminProductTypeServlet");
    }
}