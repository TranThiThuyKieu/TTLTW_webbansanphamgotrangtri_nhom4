package dao;

import model.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static dao.DBContext.getConnection;

public class AddressDao {
    public List<Address> getByUserId(int userId) {
        List<Address> list = new ArrayList<>();
        String sql = "SELECT * FROM addresses WHERE user_id=? ORDER BY isDefault DESC";
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Address a = new Address();
                a.setId(rs.getInt("id"));
                a.setUserId(userId);
                a.setName(rs.getString("name"));
                a.setPhone(rs.getString("phone"));
                a.setDetail(rs.getString("detail"));
                a.setCommune(rs.getString("commune"));
                a.setDistrict(rs.getString("district"));
                a.setProvince(rs.getString("province"));
                a.setIsDefault(rs.getInt("isDefault"));
                list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void saveOrUpdate(Address a) {
        String checkSql = "SELECT id FROM addresses WHERE user_id = ? AND isDefault = 1";
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(checkSql)) {
            ps.setInt(1, a.getUserId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String updateSql = """
UPDATE addresses SET name=?, phone=?, detail=?, commune=?, district=?, province=?
                WHERE user_id=? AND isDefault=1 """;

                try (PreparedStatement up = con.prepareStatement(updateSql)) {
                    up.setString(1, a.getName());
                    up.setString(2, a.getPhone());
                    up.setString(3, a.getDetail());
                    up.setString(4, a.getCommune());
                    up.setString(5, a.getDistrict());
                    up.setString(6, a.getProvince());
                    up.setInt(7, a.getUserId());
                    up.executeUpdate();
                }
            } else {
                String insertSql = """
                INSERT INTO addresses
                (user_id, name, phone, detail,
                 commune, district, province, isDefault)
                VALUES (?, ?, ?, ?, ?, ?, ?, 1)
            """;
                try (PreparedStatement ins = con.prepareStatement(insertSql)) {
                    ins.setInt(1, a.getUserId());
                    ins.setString(2, a.getName());
                    ins.setString(3, a.getPhone());
                    ins.setString(4, a.getDetail());
                    ins.setString(5, a.getCommune());
                    ins.setString(6, a.getDistrict());
                    ins.setString(7, a.getProvince());
                    ins.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
