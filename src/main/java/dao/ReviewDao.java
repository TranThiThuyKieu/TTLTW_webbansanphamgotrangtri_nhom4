package dao;

import model.Reviews;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
    public boolean hasUserReviewed(int userId, int productId) {

        String sql = """
        SELECT COUNT(*) 
        FROM reviews 
        WHERE user_id = ? AND product_id = ?
    """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public boolean addReview(Reviews review) {
        String sql = """
            INSERT INTO reviews(user_id, product_id, order_id, rate, comment, createAt)
            VALUES (?, ?, ?, ?, ?, NOW())
        """;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setInt(3, review.getOrderId());
            ps.setInt(4, review.getRating());
            ps.setString(5, review.getComment());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Reviews> getReviewsByUserId(int userId) {
        List<Reviews> list = new ArrayList<>();
        String sql = """
        SELECT r.*, p.name_product, i.urlImage 
        FROM reviews r
        JOIN products p ON r.product_id = p.id
        LEFT JOIN images i ON p.primary_image_id = i.id
        WHERE r.user_id = ? 
        ORDER BY r.createAt DESC
    """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reviews r = new Reviews();
                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setProductId(rs.getInt("product_id"));
                    r.setOrderId(rs.getInt("order_id"));
                    r.setRating(rs.getInt("rate"));
                    r.setComment(rs.getString("comment"));
                    r.setCreateAt(rs.getTimestamp("createAt"));
                    r.setProductName(rs.getString("name_product"));
                    r.setProductImg(rs.getString("urlImage"));

                    list.add(r);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getReviewedKeysByUserId(int userId) {
        List<String> keys = new ArrayList<>();
        String sql = "SELECT order_id, product_id FROM reviews WHERE user_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                keys.add(rs.getInt("order_id") + "_" + rs.getInt("product_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return keys;
    }
    public int getReviewCount(int productId) {
        String query = "SELECT COUNT(*) FROM reviews WHERE product_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

}
