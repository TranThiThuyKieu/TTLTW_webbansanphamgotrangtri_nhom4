package controller;

import dao.ColorDao;
import dao.SizeDao;
import model.Color;
import model.Size;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/admin-attribute")
public class AdminAttributeServlet extends HttpServlet {
    private ColorDao colorDao;
    private SizeDao sizeDao;
    @Override
    public void init() {
        colorDao = new ColorDao();
        sizeDao = new SizeDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("delete");
        if (action != null) {
            int id = Integer.parseInt(req.getParameter("id"));
            if (action.equals("color")) {
                colorDao.delete(id);
            } else if (action.equals("size")) {
                sizeDao.delete(id);
            }
            resp.sendRedirect("admin-attribute");
            return;
        }
        req.setAttribute("listColors", colorDao.getAll());
        req.setAttribute("listSizes", sizeDao.getAll());

        req.getRequestDispatcher("admin_attribute.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String type = req.getParameter("type");
        String idStr = req.getParameter("id");
        int id = 0;
        if (idStr != null && !idStr.isEmpty()) {
            id = Integer.parseInt(idStr);
        }
        if ("color".equals(type)) {
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            Color color = new Color(id, name, code);
            colorDao.save(color);
        } else if ("size".equals(type)) {
            String name = req.getParameter("name");
            Size size = new Size(id, name);
            sizeDao.save(size);
        }
        resp.sendRedirect("admin-attribute");
    }

}