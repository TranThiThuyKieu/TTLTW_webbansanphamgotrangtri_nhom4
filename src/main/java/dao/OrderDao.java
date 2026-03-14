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
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT id, user_id, fullName, phone, status, payment_status, " +
                "totalOrder, subTotal, taxAmount, shippingFee, createAt " +
                "FROM orders WHERE user_id = ? ORDER BY createAt DESC";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setFullName(rs.getString("fullName"));
                o.setStatus(rs.getString("status"));
                o.setPaymentStatus(rs.getString("payment_status"));
                o.setCreateAt(rs.getTimestamp("createAt"));
                o.setSubTotal(rs.getDouble("subTotal"));
                o.setTaxAmount(rs.getDouble("taxAmount"));
                o.setShippingFee(rs.getDouble("shippingFee"));
                o.setTotalOrder(rs.getDouble("totalOrder"));
                list.add(o);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    public int checkout(int userId,
                        String fullName,
                        String phone,
                        int addressId,
                        String note,
                        String paymentMethod,
                        List<CartItem> cart) throws Exception {

        try (Connection conn = DBContext.getConnection()) {

            conn.setAutoCommit(false);

            BigDecimal subTotal = BigDecimal.ZERO;

            for (CartItem item : cart) {
                BigDecimal itemTotal = item.getVariant().getVariant_price()
                        .multiply(BigDecimal.valueOf(item.getQuantity()));

                subTotal = subTotal.add(itemTotal);
            }

            BigDecimal tax = subTotal.multiply(BigDecimal.valueOf(0.08));
            BigDecimal shipping = calculateShipping(subTotal);
            BigDecimal total = subTotal.add(tax).add(shipping);

            String sqlOrder = """
                    INSERT INTO orders 
                    (user_id, fullName, phone, address_id, note, createAt, status,
                     payment_status, totalOrder, subTotal, taxAmount, shippingFee)
                    VALUES (?, ?, ?, ?, ?, NOW(), 'Chờ xác nhận', ?, ?, ?, ?, ?)
                    """;

            String paymentStatus = paymentMethod.equals("COD")
                    ? "Chưa thanh toán"
                    : "Đã thanh toán";

            int orderId;

            try (PreparedStatement ps = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS)) {

                ps.setInt(1, userId);
                ps.setString(2, fullName);
                ps.setString(3, phone);
                ps.setInt(4, addressId);
                ps.setString(5, note);
                ps.setString(6, paymentStatus);

                ps.setBigDecimal(7, total);
                ps.setBigDecimal(8, subTotal);
                ps.setBigDecimal(9, tax);
                ps.setBigDecimal(10, shipping);

                ps.executeUpdate();

                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                orderId = rs.getInt(1);
            }

            insertOrderDetails(conn, orderId, cart);
            updateStock(conn, cart);

            conn.commit();

            return orderId;
        }
    }
    private void insertOrderDetails(Connection conn, int orderId, List<CartItem> cart) throws SQLException {

        String sql = """
                INSERT INTO order_details
                (order_id, product_variant_id, quantity, total)
                VALUES (?, ?, ?, ?)
                """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            for (CartItem item : cart) {

                BigDecimal itemTotal = item.getVariant().getVariant_price()
                        .multiply(BigDecimal.valueOf(item.getQuantity()));

                ps.setInt(1, orderId);
                ps.setInt(2, item.getVariant().getId());
                ps.setInt(3, item.getQuantity());
                ps.setBigDecimal(4, itemTotal);

                ps.addBatch();
            }

            ps.executeBatch();
        }
    }

    private void updateStock(Connection conn, List<CartItem> cart) throws SQLException {

        String sql = """
                UPDATE product_variants
                SET inventory_quantity = inventory_quantity - ?
                WHERE id = ? AND inventory_quantity >= ?
                """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            for (CartItem item : cart) {

                int qty = item.getQuantity();

                ps.setInt(1, qty);
                ps.setInt(2, item.getVariant().getId());
                ps.setInt(3, qty);

                int rows = ps.executeUpdate();

                if (rows == 0) {
                    throw new SQLException("Không đủ tồn kho");
                }
            }
        }
    }
    private BigDecimal calculateShipping(BigDecimal subTotal) {

        if (subTotal.compareTo(BigDecimal.valueOf(1_000_000)) < 0)
            return BigDecimal.valueOf(50_000);

        if (subTotal.compareTo(BigDecimal.valueOf(3_000_000)) < 0)
            return BigDecimal.valueOf(100_000);

        return BigDecimal.valueOf(200_000);
    }
}