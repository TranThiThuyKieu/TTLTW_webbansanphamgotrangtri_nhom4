package dao;
import model.Payment;
import java.sql.*;
import java.util.*;

public class PaymentDao {
    public List<Payment> getPaymentsByUserId(int userId) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT id, user_id, card_number, duration, type FROM payments WHERE user_id = ?";
        try (Connection conn = new dao.DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Payment(rs.getInt("id"), rs.getInt("user_id"), rs.getString("card_number"), rs.getDate("duration"), rs.getString("type")));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void addPayment(int userId, String cardNumber, String type, String duration) {
        String sql = "INSERT INTO payments (user_id, card_number, type, duration) VALUES (?, ?, ?, ?)";
        try (Connection conn = new dao.DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, cardNumber);
            ps.setString(3, type);
            ps.setString(4, duration);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}