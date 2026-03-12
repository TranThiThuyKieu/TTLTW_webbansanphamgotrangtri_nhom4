package dao;

import model.ContactSettings;
import java.sql.*;

public class ContactSettingsDao {
    public boolean updateSettings(ContactSettings settings) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(
                    "UPDATE contact_settings SET " +
                            "phone = ?, email = ?, address = ?, " +
                            "facebook_url = ?, instagram_url = ?, twitter_url = ?, google_url = ? " +
                            "WHERE id = 1"
            );
            ps.setString(1, settings.getPhone());
            ps.setString(2, settings.getEmail());
            ps.setString(3, settings.getAddress());
            ps.setString(4, settings.getFacebookUrl());
            ps.setString(5, settings.getInstagramUrl());
            ps.setString(6, settings.getTwitterUrl());
            ps.setString(7, settings.getGoogleUrl());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;

        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}