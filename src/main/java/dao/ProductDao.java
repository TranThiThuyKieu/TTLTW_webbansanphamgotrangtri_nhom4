package dao;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

import model.Images;
import model.Product;
import model.Reviews;
import java.sql.*;

import model.*;

import static dao.DBContext.getConnection;

public class ProductDao {
    public List<Product> getTop8BestSellers() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.name_product, p.price, i.urlImage, " +
                "SUM(od.quantity) AS total_sold, " +
                "AVG(r.rate) AS avg_rate " +
                "FROM products p " +
                "LEFT JOIN images i ON p.primary_image_id = i.id " +
                "LEFT JOIN product_variants pv ON p.id = pv.product_id " +
                "LEFT JOIN order_details od ON pv.id = od.product_variant_id " +
                "LEFT JOIN reviews r ON p.id = r.product_id " +
                "GROUP BY p.id " +
                "ORDER BY total_sold DESC " +
                "LIMIT 8";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setNameProduct(rs.getString("name_product"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("urlImage"));
                p.setAverageRating(rs.getDouble("avg_rate"));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}