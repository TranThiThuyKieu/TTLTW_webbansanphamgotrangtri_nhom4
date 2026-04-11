// roi
package controller;

import dao.*;
import dao.FlashSaleDAO;
import dao.ProductDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet(name = "HomeServlet", value = "/HomeServlet")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null)
                ? (User) session.getAttribute("LOGGED_USER")
                : null;

        FavoritesDao favDao = new FavoritesDao();

        if (user != null) {
            Set<Integer> favoriteIds = favDao.getFavoriteProductIds(user.getId());
            request.setAttribute("favoriteIds", favoriteIds);
        }

        ProductDao dao = new ProductDao();
        dao.CategoryDao cDao = new CategoryDao();
        List<Category> listCC = cDao.getAllCategory();
        List<Product> newArrivals = dao.getLatestProducts(4);
        List<Product> bestSellers = dao.getTop8BestSellers();
        List<Product> products = dao.getProductsByPage(1, 8);

        List<Product> top3Products = dao.getTop3FeaturedProducts();

        VoucherDAO voucherdao = new VoucherDAO();
        List<Voucher> vouchers = voucherdao.getTop3AvailableVoucher();

        FlashSaleDAO fsDao = new FlashSaleDAO();
        FlashSale activeFlashSale = fsDao.getActiveFlashSale();

        if (activeFlashSale != null) {
            List<FlashSaleDetail> topFlashProducts =
                    fsDao.getTop3BestSellingInFlashSale(activeFlashSale.getId());

            request.setAttribute("flashSale", activeFlashSale);
            request.setAttribute("topFlashProducts", topFlashProducts);
        }

        request.setAttribute("newArrivals", newArrivals);
        request.setAttribute("products", products);
        request.setAttribute("bestSeller", bestSellers);
        request.setAttribute("top3Products", top3Products);
        request.setAttribute("listCC", listCC);
        request.setAttribute("vouchers", vouchers);


        request.getRequestDispatcher("/homepage_user.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}