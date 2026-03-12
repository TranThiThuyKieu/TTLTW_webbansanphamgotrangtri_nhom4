package controller;

import dao.SourceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Source;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SourceServlet",
        urlPatterns = {"/source-manager", "/add-source", "/delete-source", "/edit-source"})
public class SourceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        SourceDao dao = new SourceDao();

        if (action.equals("/delete-source")) {

            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteSource(id);

            response.sendRedirect(request.getContextPath() + "/AdminCountProductSourceServlet");
            return;
        }

        String keyword = request.getParameter("keyword");

        List<Source> listS = dao.getAllSourcesWithTotalInventory(keyword);

        request.setAttribute("listS", listS);
        request.setAttribute("activePage", "source");
        request.setAttribute("keyword", keyword != null ? keyword : "");

        request.getRequestDispatcher("/admin_source.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getServletPath();
        String name = request.getParameter("sourceName");

        SourceDao dao = new SourceDao();

        if (action.equals("/add-source")) {

            dao.insertSource(name);

        } else if (action.equals("/edit-source")) {

            int id = Integer.parseInt(request.getParameter("id"));
            dao.updateSource(id, name);
        }

        response.sendRedirect(request.getContextPath() + "/AdminCountProductSourceServlet");
    }
}