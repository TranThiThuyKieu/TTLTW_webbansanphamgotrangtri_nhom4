package controller;

import dao.ProductDao;
import dao.ReviewDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductDetailServlet", value = "/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("homepage_user.jsp");
            return;
        }
        int productId;
        try {
            productId = Integer.parseInt(id);
        } catch (Exception e) {
            response.sendRedirect("homepage_user.jsp");
            return;
        }
        ProductDao dao = new ProductDao();
        ReviewDao reviewDao = new ReviewDao();
        Product p = dao.getProductById(productId);
        if (p == null) {
            response.sendRedirect("homepage_user.jsp");
            return;
        }
        List<Product> relatedProducts = dao.getRelatedProducts(p.getCategoryId(), productId, 4);
        request.setAttribute("relatedProducts", relatedProducts);
        int totalStock = dao.getTotalStockByProductId(productId);
        p.setTotalQuantity(totalStock);
        p.setSubImages(dao.getProductImages(productId));
        p.setVariants(dao.getProductVariants(productId));
        List<Reviews> reviewList = dao.getProductReviews(productId);
        p.setReviewList(reviewList);
        double avg = dao.getAverageRating(productId);
        p.setAverageRating(avg);
        p.setTotalReviews(reviewDao.getReviewCount(productId));
        Map<Integer, String> userNames = new HashMap<>();
        if (reviewList != null) {
            for (Reviews r : reviewList) {
                String name = dao.getUsernameById(r.getUserId());
                userNames.put(r.getUserId(), name);
            }
        }
        List<Reviews> all = reviewDao.getAllReviewsWithReplies(productId);

        Map<Integer, Reviews> parentMap = new HashMap<>();
        List<Reviews> rootReviews = new ArrayList<>();

        for (Reviews r : all) {
            if (r.getRespone_id() == 0) {
                r.setReplies(new ArrayList<>());
                parentMap.put(r.getId(), r);
                rootReviews.add(r);
            }
        }

        for (Reviews r : all) {
            if (r.getRespone_id() != 0) {
                Reviews parent = parentMap.get(r.getRespone_id());
                if (parent != null) {
                    parent.getReplies().add(r);
                }
            }
        }

        request.setAttribute("reviewList", rootReviews);
        request.setAttribute("p", p);
        request.setAttribute("userNames", userNames);
        request.getRequestDispatcher("product_details_user.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("addReview")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGGED_USER");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String comment = request.getParameter("comment");

                Reviews review = new Reviews();
                review.setUserId(user.getId());
                review.setProductId(productId);
                review.setRating(rating);
                if (comment != null) {
                    review.setComment(comment);
                } else {
                    review.setComment("");
                }

                ProductDao dao = new ProductDao();
                boolean result = dao.addReview(review);

                if (result) {
                    session.setAttribute("successMessage", "Cảm ơn bạn đã đánh giá!");
                } else {
                    session.setAttribute("errorMessage", "Không thể thêm đánh giá!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("ProductDetailServlet?id=" + request.getParameter("productId"));
        }
    }
}