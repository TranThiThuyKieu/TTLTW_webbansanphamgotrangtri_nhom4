package dao;

import model.User;
import utils.PasswordUtils;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;

import static dao.DBContext.getConnection;

public class UserDao {
    public User checkLogin(String email, String password) {
        String sql = """
    SELECT u.id, u.full_name, u.display_name, u.birth_date,
           u.email, u.password, u.phone, u.gender, u.avatar_id,
           u.role, u.status, u.createAt, i.urlImage
    FROM users u
    LEFT JOIN images i ON u.avatar_id = i.id
    WHERE u.email = ?
    """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String hashedPasswordFromDB = rs.getString("password");

                    if (PasswordUtils.checkPassword(password, hashedPasswordFromDB)) {
                        User u = new User();
                        u.setId(rs.getInt("id"));
                        u.setUsername(rs.getString("full_name"));
                        u.setDisplayName(rs.getString("display_name"));
                        u.setBirthDate(rs.getDate("birth_date"));
                        u.setEmail(rs.getString("email"));
                        u.setPhone(rs.getString("phone"));
                        u.setGender(rs.getString("gender"));

                        u.setAvatarId(rs.getObject("avatar_id", Integer.class));

                        u.setAvatarUrl(rs.getString("urlImage"));

                        u.setRole(rs.getString("role"));
                        u.setStatus(rs.getString("status"));
                        u.setCreateAt(rs.getDate("createAt"));
                        return u;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int countNewUsersLast30Days() {
        String sql = "SELECT COUNT(*) FROM users WHERE (role = 'User') and (createAt IS NULL OR createAt >= ?)";
        LocalDateTime since = LocalDateTime.now(ZoneId.systemDefault()).minusDays(30);
        Timestamp sinceTs = Timestamp.valueOf(since);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setTimestamp(1, sinceTs);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

}

