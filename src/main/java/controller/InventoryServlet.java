package controller;

import dao.InvetoryStockDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.InventoryStock;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "InventoryServlet", value = "/InventoryServlet")
public class InventoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InvetoryStockDao dao = new InvetoryStockDao();

        List<InventoryStock> importList = dao.getAllImportStocks();

        request.setAttribute("importList", importList);

        request.getRequestDispatcher("admin_inventory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}