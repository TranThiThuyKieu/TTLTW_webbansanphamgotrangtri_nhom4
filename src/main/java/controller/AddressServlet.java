package controller;

import dao.AddressDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Address;
import model.User;

import java.io.IOException;

@WebServlet(name = "AddressServlet", value = "/AddressServlet")
public class AddressServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LOGGED_USER");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = user.getId();
        String action = request.getParameter("action");
        AddressDao dao = new AddressDao();
        if ("add".equals(action)) {
            Address a = new Address();
            a.setUserId(userId);

            a.setName(request.getParameter("name"));
            a.setPhone(request.getParameter("phone"));
            a.setDetail(request.getParameter("detail"));

            a.setProvince_id(Integer.parseInt( request.getParameter("province_id")));
            a.setDistrict_id(Integer.parseInt( request.getParameter("district_id")));
            a.setWard_code(request.getParameter("ward_code"));
            a.setProvince(request.getParameter("province"));
            a.setDistrict(request.getParameter("district"));
            a.setWard(request.getParameter("ward"));

            a.setIsDefault(0);

            dao.insert(a);
        }
        if ("update".equals(action)) {
            Address a = new Address();
            a.setId(Integer.parseInt(request.getParameter("id")));
            a.setUserId(userId);

            a.setName(request.getParameter("name"));
            a.setPhone(request.getParameter("phone"));
            a.setDetail(request.getParameter("detail"));

            a.setProvince_id(Integer.parseInt( request.getParameter("province_id")));
            a.setDistrict_id(Integer.parseInt( request.getParameter("district_id")));
            a.setWard_code(request.getParameter("ward_code"));
            a.setProvince(request.getParameter("province"));
            a.setDistrict(request.getParameter("district"));
            a.setWard(request.getParameter("ward"));

            dao.update(a);
        }
        if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id, userId);
        }
        if (action.equals("default")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.setDefault(id, userId);
        }
        String redirectUrl = request.getParameter("redirectUrl");
        response.sendRedirect(redirectUrl);
    }
}