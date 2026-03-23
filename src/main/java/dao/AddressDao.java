package dao;


import model.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddressDao {
   public List<Address> getAddressesByUserId(int userId) {
        List<Address> list = new ArrayList<>();
        String sql = "SELECT * FROM addresses WHERE user_id = ? ORDER BY isDefault DESC";
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             ps.setInt(1, userId);
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                Address address = new Address();
                address.setId(rs.getInt("id"));
                address.setUserId(userId);
                address.setName(rs.getString("name"));
                address.setPhone(rs.getString("phone"));
                address.setDetail(rs.getString("detail"));
                address.setWard_code(rs.getString("ward_code"));
                address.setDistrict_id(rs.getInt("district_id"));
                address.setProvince_id(rs.getInt("province_id"));
                address.setWard(rs.getString("ward"));
                address.setDistrict(rs.getString("district"));
                address.setProvince(rs.getString("province"));
                address.setIsDefault(rs.getInt("isDefault"));
                String full = address.getDetail() + ", " + address.getWard() + ", " +
                        address.getDistrict() + ", " + address.getProvince();
                address.setFullAddress(full);
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
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
                a.setWard_code(rs.getString("ward_code"));
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
        UPDATE addresses SET name=?, phone=?, detail=?, ward_code=?, district=?, province=?
                WHERE user_id=? AND isDefault=1 """;

                try (PreparedStatement up = con.prepareStatement(updateSql)) {
                    up.setString(1, a.getName());
                    up.setString(2, a.getPhone());
                    up.setString(3, a.getDetail());
                    up.setString(4, a.getWard_code());
                    up.setString(5, a.getDistrict());
                    up.setString(6, a.getProvince());
                    up.setInt(7, a.getUserId());
                    up.executeUpdate();
                }
            } else {
                String insertSql = """
                INSERT INTO addresses
                (user_id, name, phone, detail,
                 ward_code, district, province, isDefault)
                VALUES (?, ?, ?, ?, ?, ?, ?, 1)
            """;
                try (PreparedStatement ins = con.prepareStatement(insertSql)) {
                    ins.setInt(1, a.getUserId());
                    ins.setString(2, a.getName());
                    ins.setString(3, a.getPhone());
                    ins.setString(4, a.getDetail());
                    ins.setString(5, a.getWard_code());
                    ins.setString(6, a.getDistrict());
                    ins.setString(7, a.getProvince());
                    ins.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void insert(Address a) {
        String sql = """
            INSERT INTO addresses
            (user_id, name, phone, detail, ward_code, ward, district_id, district, province_id, province, isDefault)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             ps.setInt(1, a.getUserId());
             ps.setString(2, a.getName());
             ps.setString(3, a.getPhone());
             ps.setString(4, a.getDetail());
             ps.setString(5, a.getWard_code());
             ps.setString(6, a.getWard());
             ps.setInt(7, a.getDistrict_id());
             ps.setString(8, a.getDistrict());
             ps.setInt(9, a.getProvince_id());
             ps.setString(10, a.getProvince());
             ps.setInt(11, a.getIsDefault());
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void update(Address a) {
        String sql = """
            UPDATE addresses
            SET name=?, phone=?, detail=?, ward_code=?, ward=?, district_id=?, district=?, province_id=?, province=?
            WHERE id=? AND user_id=?
        """;

        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

             ps.setString(1, a.getName());
             ps.setString(2, a.getPhone());
             ps.setString(3, a.getDetail());
             ps.setString(4, a.getWard_code());
             ps.setString(5, a.getWard());
             ps.setInt(6, a.getDistrict_id());
             ps.setString(7, a.getDistrict());
             ps.setInt(8, a.getProvince_id());
             ps.setString(9, a.getProvince());
             ps.setInt(10, a.getId());
             ps.setInt(11, a.getUserId());
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(int id, int userId) {
        String sql = "DELETE FROM addresses WHERE id=? AND user_id=?";
        try (Connection con = DBContext.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             ps.setInt(1, id);
             ps.setInt(2, userId);
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void setDefault(int addressId, int userId) {
        try (Connection con = DBContext.getConnection()) {
            String reset = "UPDATE addresses SET isDefault=0 WHERE user_id=?";
            try (PreparedStatement ps = con.prepareStatement(reset)) {
                ps.setInt(1, userId);
                ps.executeUpdate();
            }
            String set = "UPDATE addresses SET isDefault=1 WHERE id=? AND user_id=?";
            try (PreparedStatement ps = con.prepareStatement(set)) {
                ps.setInt(1, addressId);
                ps.setInt(2, userId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
