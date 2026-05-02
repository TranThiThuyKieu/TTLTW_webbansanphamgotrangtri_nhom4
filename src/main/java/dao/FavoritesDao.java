package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class FavoritesDao {
    public boolean isFavorite(int userId, int productId) {
        String sql = "SELECT 1 FROM favorites WHERE user_id = ? AND product_id = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addFavorite(int userId, int productId) {
        String sql = "INSERT INTO favorites (user_id, product_id) VALUES (?, ?)";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFavorite(int userId, int productId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND product_id = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public Set<Integer> getFavoriteProductIds(int userId) {
        Set<Integer> set = new HashSet<>();
        String sql = "SELECT product_id FROM favorites WHERE user_id = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                set.add(rs.getInt("product_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    public List<Product> getFavoriteByUser(int userId) {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT p.id, p.name_product, p.price, i.urlImage
            FROM favorites f
            JOIN products p ON f.product_id = p.id
            LEFT JOIN images i ON p.primary_image_id = i.id
            WHERE f.user_id = ?
            ORDER BY f.created_at DESC
        """;
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, userId);
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setNameProduct(rs.getString("name_product"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("urlImage"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Product> getFavoriteByUserSorted(int userId, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = """
        SELECT p.id, p.name_product, p.price, i.urlImage
        FROM favorites f
        JOIN products p ON f.product_id = p.id
        LEFT JOIN images i ON p.primary_image_id = i.id
        WHERE f.user_id = ?
    """;
        if ("newest".equals(sort)) {
            sql += " ORDER BY f.created_at DESC";
        } else if ("oldest".equals(sort)) {
            sql += " ORDER BY f.created_at ASC";
        }
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setNameProduct(rs.getString("name_product"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("urlImage"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
