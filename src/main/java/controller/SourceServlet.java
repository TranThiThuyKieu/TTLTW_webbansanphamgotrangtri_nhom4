package controller;

import dao.SourceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Source;
import model.User;

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

        List<Source> listS = dao.getAllSourcesWithProductCount(keyword);

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (action.equals("/add-source") || action.equals("/edit-source")) {
            if (dao.isSourceNameExist(name)) {
                request.setAttribute("msg", "Lỗi: Tên nguồn hàng '" + name + "' đã tồn tại!");
                request.setAttribute("msgType", "error");

                request.setAttribute("keepModalOpen", true);
                request.setAttribute("currentName", name);
                if (action.equals("/edit-source")) {
                    request.setAttribute("currentId", request.getParameter("id"));
                }

                List<Source> listS = dao.getAllSourcesWithProductCount("");
                request.setAttribute("listS", listS);
                request.setAttribute("activePage", "source");

                request.getRequestDispatcher("/admin_source.jsp").forward(request, response);
                return;
            }

            else {
                if (action.equals("/add-source")) {
                    if (dao.insertSource(name)) {
                        session.setAttribute("msg", "Thêm nguồn hàng thành công!");
                        session.setAttribute("msgType", "success");
                    }
                } else if (action.equals("/edit-source")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    if (dao.updateSource(id, name)) {
                        session.setAttribute("msg", "Cập nhật nguồn hàng thành công!");
                        session.setAttribute("msgType", "success");
                    }
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/AdminCountProductSourceServlet");
    }
}