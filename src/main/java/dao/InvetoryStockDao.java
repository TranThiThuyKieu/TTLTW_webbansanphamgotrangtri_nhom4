package dao;

import model.InventoryStock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    public List<InventoryStock> getAllImportStocks() {
        List<InventoryStock> list = new ArrayList<>();


        String sql = """
        SELECT i.*, s.sourceName, u.full_name, 
               SUM(it.quantity * it.price) AS total_amount
        FROM inventory_stock i
        LEFT JOIN inventory_stock_items it ON i.id = it.inventory_stock_id
            LEFT JOIN sources s ON i.source_id = s.id
        LEFT JOIN users u ON u.id = i.created_by  
        WHERE i.type = 'IMPORT'
        GROUP BY i.id
        ORDER BY i.created_at DESC
    """;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                InventoryStock i = new InventoryStock();

                i.setId(rs.getInt("id"));
                i.setSource_id(rs.getInt("source_id"));
                i.setCreated_by(rs.getInt("created_by"));
                i.setCreated_at(rs.getTimestamp("created_at"));
                i.setNote(rs.getString("note"));

                i.setSourceName(rs.getString("sourceName"));
                i.setFullName(rs.getString("full_name"));
                i.setTotalAmount(rs.getDouble("total_amount"));

                list.add(i);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
