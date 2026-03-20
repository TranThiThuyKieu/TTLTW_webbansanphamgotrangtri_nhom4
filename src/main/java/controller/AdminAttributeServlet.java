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
            String targetTab = "color";
            if (action.equals("color")) {
                colorDao.delete(id);
                targetTab = "color";
            } else if (action.equals("size")) {
                sizeDao.delete(id);
                targetTab = "size";
            }
            resp.sendRedirect("admin-attribute?tab=" + targetTab);
            return;
        }

        req.setAttribute("listColors", colorDao.getAll());
        req.setAttribute("listSizes", sizeDao.getAll());
        req.getRequestDispatcher("admin_attribute.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        String idStr = req.getParameter("id");
        int id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;

        String targetTab = "color";
        if ("color".equals(type)) {
            colorDao.save(new Color(id, req.getParameter("name"), req.getParameter("code")));
            targetTab = "color";
        } else if ("size".equals(type)) {
            sizeDao.save(new Size(id, req.getParameter("name")));
            targetTab = "size";
        }
        resp.sendRedirect("admin-attribute?tab=" + targetTab);
    }

}