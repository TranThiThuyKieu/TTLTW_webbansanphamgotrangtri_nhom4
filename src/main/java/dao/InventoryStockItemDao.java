package dao;

import model.InventoryStockItem;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class InventoryStockItemDao {

    public void insertItem(Connection conn, InventoryStockItem item) {
        String sql = "INSERT INTO inventory_stock_items(inventory_stock_id, variant_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, item.getInventory_stock_id());
            ps.setInt(2, item.getVariant_id());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
