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

}