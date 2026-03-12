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
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = """
        SELECT o.*, 
               CONCAT(a.detail, ', ', a.commune, ', ', a.district, ', ', a.province) AS full_address
        FROM orders o
        LEFT JOIN addresses a ON o.address_id = a.id
        ORDER BY o.createAt DESC
    """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setFullName(rs.getString("fullName"));
                order.setPhone(rs.getString("phone"));
                order.setSubTotal(rs.getDouble("subTotal"));
                order.setTaxAmount(rs.getDouble("taxAmount"));
                order.setShippingFee(rs.getDouble("shippingFee"));
                String addr = rs.getString("full_address");
                if (addr == null || addr.trim().isEmpty() || addr.equals(", , , ")) {
                    order.setAddress(rs.getString("address"));
                } else {
                    order.setAddress(addr);
                }

                order.setCreateAt(rs.getTimestamp("createAt"));
                order.setPaymentStatus(rs.getString("payment_status"));
                order.setTotalOrder(rs.getDouble("totalOrder"));
                order.setStatus(rs.getString("status"));
                order.setNote(rs.getString("note"));

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<OrderDetail> getDetailsByOrderId(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = """
        SELECT od.*, p.name_product, p.primary_image_id, pv.product_id
        FROM order_details od 
        JOIN product_variants pv ON od.product_variant_id = pv.id 
        JOIN products p ON pv.product_id = p.id 
        WHERE od.order_id = ?
    """;
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail d = new OrderDetail();
                d.setId(rs.getInt("id"));
                d.setOrderId(rs.getInt("order_id"));
                d.setProductVariantId(rs.getInt("product_variant_id"));
                d.setProductId(rs.getInt("product_id"));
                d.setProductName(rs.getString("name_product"));
                d.setProductImg(rs.getString("primary_image_id"));
                d.setQuantity(rs.getInt("quantity"));
                d.setTotal(rs.getDouble("total"));
                details.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }
    public boolean updateOrderStatus(int orderId, String status, String paymentStatus) {
        String sql = "UPDATE orders SET status = ?, payment_status = ? WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, paymentStatus);
            ps.setInt(3, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}