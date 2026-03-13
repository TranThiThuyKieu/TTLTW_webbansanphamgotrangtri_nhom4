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
                address.setCommune(rs.getString("commune"));
                address.setDistrict(rs.getString("district"));
                address.setProvince(rs.getString("province"));
                address.setIsDefault(rs.getInt("isDefault"));
                String full = address.getDetail() + ", " + address.getCommune() + ", " +
                        address.getDistrict() + ", " + address.getProvince();
                address.setFullAddress(full);
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
