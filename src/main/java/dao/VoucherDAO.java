package dao;

import model.Voucher;
import dao.DBContext;
import java.sql.*;
import java.util.ArrayList;
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
    public List<Voucher> getAllVouchers() {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT * FROM vouchers ORDER BY created_at DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setId(rs.getInt("id"));
                v.setVoucherCode(rs.getString("voucher_code"));
                v.setVoucherName(rs.getString("voucher_name"));
                v.setPromoType(rs.getString("promo_type"));
                v.setPromoValue(rs.getDouble("promo_value"));
                v.setStartDate(rs.getTimestamp("start_date").toLocalDateTime());
                v.setEndDate(rs.getTimestamp("end_date").toLocalDateTime());
                v.setStatus(rs.getInt("status"));
                v.setRewardStyle(rs.getString("reward_style"));
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Voucher getVoucherById(int id) {
        String sql = "SELECT * FROM vouchers WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             ResultSet rs = ps.executeQuery();
             if (rs.next()) {
                Voucher v = new Voucher();
                v.setId(rs.getInt("id"));
                v.setVoucherCode(rs.getString("voucher_code"));
                v.setVoucherName(rs.getString("voucher_name"));
                v.setDescription(rs.getString("description"));
                v.setPromoType(rs.getString("promo_type"));
                v.setPromoValue(rs.getDouble("promo_value"));
                v.setMinOrderValue(rs.getDouble("min_order_value"));
                v.setTotalRelease(rs.getInt("total_release"));
                v.setMaxPerUser(rs.getInt("max_per_user"));
                v.setStartDate(rs.getTimestamp("start_date").toLocalDateTime());
                v.setEndDate(rs.getTimestamp("end_date").toLocalDateTime());
                return v;
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void updateVoucher(Voucher v) {
        String sql = "UPDATE vouchers SET voucher_code=?, voucher_name=?, description=?, promo_type=?, promo_value=?, min_order_value=?, total_release=?, max_per_user=?, start_date=?, end_date=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, v.getVoucherCode());
             ps.setString(2, v.getVoucherName());
             ps.setString(3, v.getDescription());
             ps.setString(4, v.getPromoType());
             ps.setDouble(5, v.getPromoValue());
             ps.setDouble(6, v.getMinOrderValue());
             ps.setInt(7, v.getTotalRelease());
             ps.setInt(8, v.getMaxPerUser());
             ps.setObject(9, v.getStartDate());
             ps.setObject(10, v.getEndDate());
             ps.setInt(11, v.getId());
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateStatus(int id, int status) {
        String sql = "UPDATE vouchers SET status=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, status);
             ps.setInt(2, id);
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean deleteVoucher(int id) {
        String sqlDeleteRanks = "DELETE FROM voucher_applicable_ranks WHERE voucher_id=?";
        String sqlDeleteVoucher = "DELETE FROM vouchers WHERE id=?";
        try (Connection conn = new DBContext().getConnection()) {
            try (PreparedStatement ps1 = conn.prepareStatement(sqlDeleteRanks)) {
                ps1.setInt(1, id);
                ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(sqlDeleteVoucher)) {
                ps2.setInt(1, id);
                int affected = ps2.executeUpdate();
                if (affected == 0) {
                    return false;
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}