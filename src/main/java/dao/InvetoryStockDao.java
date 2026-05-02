package dao;

import model.InventoryStock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class InvetoryStockDao {

    public int insertInvetoryStock(Connection conn, InventoryStock t) throws Exception {
        String sql = "INSERT INTO inventory_stock (type, source_id, created_by, note, created_at) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, t.getType());
            ps.setInt(2, t.getSource_id());
            ps.setInt(3, t.getCreated_by());
            ps.setString(4, t.getNote());
            ps.setTimestamp(5, t.getCreated_at());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return -1;
    }
}
