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
        INSERT INTO reviews(user_id, product_id, rate, comment)
        VALUES (?, ?, ?, ?)
    """;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getComment());

            int rows = ps.executeUpdate();
            System.out.println("Insert review rows = " + rows);

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public int getReviewCount(int productId) {
        String query = "SELECT COUNT(*) FROM reviews WHERE product_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi lấy số review: " + e.getMessage());
        }
        return 0;
    }

}
