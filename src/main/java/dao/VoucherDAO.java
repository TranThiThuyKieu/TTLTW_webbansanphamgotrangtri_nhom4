package dao;

import model.Voucher;
import dao.DBContext;
import java.sql.*;
import java.util.List;

public class VoucherDAO {

    public boolean insertVoucher(Voucher v) {
        String sqlVoucher = "INSERT INTO vouchers (voucher_code, voucher_name, description, promo_type, promo_value, min_order_value, " +
                "reward_style, total_release, max_per_user, start_date, end_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
        String sqlRank = "INSERT INTO voucher_applicable_ranks (voucher_id, rank_name) VALUES (?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps1 = conn.prepareStatement(sqlVoucher, Statement.RETURN_GENERATED_KEYS)) {
            ps1.setString(1, v.getVoucherCode());
            ps1.setString(2, v.getVoucherName());
            ps1.setString(3, v.getDescription());
            ps1.setString(4, v.getPromoType());
            ps1.setDouble(5, v.getPromoValue());
            ps1.setDouble(6, v.getMinOrderValue());
            ps1.setString(7, v.getRewardStyle());
            ps1.setInt(8, v.getTotalRelease());
            ps1.setInt(9, v.getMaxPerUser());
            ps1.setTimestamp(10, Timestamp.valueOf(v.getStartDate()));
            ps1.setTimestamp(11, Timestamp.valueOf(v.getEndDate()));
            int rowAffected = ps1.executeUpdate();
            if (rowAffected > 0) {
                try (ResultSet rs = ps1.getGeneratedKeys()) {
                    if (rs.next()) {
                        int idMoi = rs.getInt(1);
                        if ("SPECIAL".equals(v.getRewardStyle()) && v.getApplicableRanks() != null) {
                            try (PreparedStatement ps2 = conn.prepareStatement(sqlRank)) {
                                for (String rankName : v.getApplicableRanks()) {
                                    ps2.setInt(1, idMoi);
                                    ps2.setString(2, rankName);
                                    ps2.executeUpdate();
                                }
                            }
                        }
                    }
                }
                return true;
            }
        } catch (Exception e) {
            System.out.println("Lỗii rồi !" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}