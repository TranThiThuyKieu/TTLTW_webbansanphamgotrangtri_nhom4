package dao;

import dao.DBContext;
import model.ProductVariants;
import model.ProductColor;
import model.ProductSize;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductVariantsDao {

    public List<ProductVariants> getAllVariants() {
        List<ProductVariants> list = new ArrayList<>();
        String sql = "SELECT pv.*, p.name_product, c.id AS c_id, c.colorname, c.color_code, s.id AS s_id, s.size_name " +
                "FROM product_variants pv " +
                "JOIN products p ON pv.product_id = p.id " +
                "LEFT JOIN colors c ON pv.color_id = c.id " +
                "LEFT JOIN sizes s ON pv.size_id = s.id";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductVariants v = new ProductVariants();
                v.setId(rs.getInt("id"));
                v.setSku(rs.getString("sku"));
                v.setVariant_price(rs.getBigDecimal("variant_price"));
                v.setInventory_quantity(rs.getInt("inventory_quantity"));
                String fullDisplayName = rs.getString("name_product") + " - " +
                        rs.getString("colorname") + " - " +
                        rs.getString("size_name") + " [" + v.getSku() + "]";
                v.setSku(fullDisplayName);
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void updateStock(Connection conn, int variantId, int qty) {
        String sql = "UPDATE product_variants SET inventory_quantity = inventory_quantity + ? WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, qty);
            ps.setInt(2, variantId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<ProductVariants> getVariantsBySource(int sourceId) {
        List<ProductVariants> list = new ArrayList<>();
        String sql = "SELECT pv.*, p.name_product, c.colorname, s.size_name " +
                "FROM product_variants pv " +
                "JOIN products p ON pv.product_id = p.id " +
                "LEFT JOIN colors c ON pv.color_id = c.id " +
                "LEFT JOIN sizes s ON pv.size_id = s.id " +
                "WHERE p.source_id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sourceId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductVariants v = new ProductVariants();
                    v.setId(rs.getInt("id"));
                    String fullDisplayName = rs.getString("name_product") + " - " +
                            rs.getString("colorname") + " - " +
                            rs.getString("size_name") + " [" + rs.getString("sku") + "]";
                    v.setSku(fullDisplayName);
                    list.add(v);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}