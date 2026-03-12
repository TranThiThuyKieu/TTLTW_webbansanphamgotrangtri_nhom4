package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class OrderDao {
    public int getOrderCount() {
        String sql = "SELECT COUNT(*) AS cnt FROM orders WHERE payment_status = ? AND status = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "Đã thanh toán");
            ps.setString(2, "Đã giao");

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("cnt");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    public double getTotalRevenue() {
        String sql = "SELECT SUM(totalOrder) FROM orders WHERE payment_status = ? AND status = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "Đã thanh toán");
            ps.setString(2, "Đã giao");

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }
}