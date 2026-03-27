package dao;

import dao.DBContext;
import model.FlashSale;
import model.FlashSaleDetail;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlashSaleDAO {

    public boolean insertFlashSale(String name, String note, String start, String end,
                                   String[] variantIds, String[] percents, String[] flashPrices, String[] stocks) {

        String sqlMain = "INSERT INTO FlashSales (campaignName, note, startDate, endDate, status) VALUES (?, ?, ?, ?, 1)";
        String sqlDetail = "INSERT INTO FlashSaleDetails (flashSaleId, product_variant_id, discountPercent, flashPrice, saleStock) VALUES (?, ?, ?, ?, ?)";
        String sqlGetStock = "SELECT inventory_quantity FROM product_variants WHERE id = ?";
        try (Connection conn = new DBContext().getConnection()) {
            conn.setAutoCommit(false);

            int flashSaleId = 0;
            try (PreparedStatement psMain = conn.prepareStatement(sqlMain, Statement.RETURN_GENERATED_KEYS)) {
                psMain.setString(1, name);
                psMain.setString(2, note);
                psMain.setString(3, start);
                psMain.setString(4, end);
                psMain.executeUpdate();
                ResultSet rs = psMain.getGeneratedKeys();
                if (rs.next()) flashSaleId = rs.getInt(1);
            }
            if (variantIds != null) {
                try (PreparedStatement psDetail = conn.prepareStatement(sqlDetail);
                     PreparedStatement psStock = conn.prepareStatement(sqlGetStock)) {
                    for (int i = 0; i < variantIds.length; i++) {
                        if (variantIds[i] == null || variantIds[i].equals("0")) continue;
                        int vId = Integer.parseInt(variantIds[i]);
                        int realStock = 0;
                        psStock.setInt(1, vId);
                        try (ResultSet rsStock = psStock.executeQuery()) {
                            if (rsStock.next()) realStock = rsStock.getInt("inventory_quantity");
                        }
                        int p = Math.max(0, Math.min(100, (percents[i] == null || percents[i].isEmpty()) ? 0 : Integer.parseInt(percents[i])));
                        double f = Math.max(0.0, (flashPrices[i] == null || flashPrices[i].isEmpty()) ? 0.0 : Double.parseDouble(flashPrices[i]));
                        int s = (stocks[i] == null || stocks[i].isEmpty()) ? 0 : Integer.parseInt(stocks[i]);
                        if (s <= 0 || s > realStock) s = realStock;
                        psDetail.setInt(1, flashSaleId);
                        psDetail.setInt(2, vId);
                        psDetail.setInt(3, p);
                        psDetail.setDouble(4, f);
                        psDetail.setInt(5, s);
                        psDetail.addBatch();
                    }
                    psDetail.executeBatch();
                }
            }
            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<FlashSale> getAllFlashSales() {
        List<FlashSale> list = new ArrayList<>();
        String sql = "SELECT * FROM flashsales ORDER BY startDate DESC";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FlashSale fs = new FlashSale();
                fs.setId(rs.getInt("id"));
                fs.setCampaignName(rs.getString("campaignName"));
                fs.setNote(rs.getString("note"));
                fs.setStartDate(rs.getTimestamp("startDate").toLocalDateTime());
                fs.setEndDate(rs.getTimestamp("endDate").toLocalDateTime());
                fs.setStatus(rs.getInt("status"));
                list.add(fs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public FlashSale getFlashSaleById(int id) {
        FlashSale fs = null;
        String sql = "SELECT * FROM flashsales WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, id);
             try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    fs = new FlashSale();
                    fs.setId(rs.getInt("id"));
                    fs.setCampaignName(rs.getString("campaignName"));
                    fs.setNote(rs.getString("note"));
                    fs.setStartDate(rs.getTimestamp("startDate").toLocalDateTime());
                    fs.setEndDate(rs.getTimestamp("endDate").toLocalDateTime());
                    fs.setStatus(rs.getInt("status"));
                    fs.setDetails(getFlashSaleDetails(id));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fs;
    }
    public boolean updateFlashSale(int id, String name, String note, String start, String end) {
        String sql = "UPDATE flashsales SET campaignName=?, note=?, startDate=?, endDate=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setString(1, name);
             ps.setString(2, note);
             ps.setString(3, start);
             ps.setString(4, end);
             ps.setInt(5, id);
             ps.executeUpdate();
             return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public void updateStatus(int id, int status) {
        String sql = "UPDATE flashsales SET status=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, status);
             ps.setInt(2, id);
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<FlashSaleDetail> getFlashSaleDetails(int flashSaleId) {
        List<FlashSaleDetail> list = new ArrayList<>();
        String sql = "SELECT fsd.*, pv.sku, pv.variant_price, pv.inventory_quantity " +
                "FROM FlashSaleDetails fsd " +
                "JOIN product_variants pv ON fsd.product_variant_id = pv.id " +
                "WHERE fsd.flashSaleId = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, flashSaleId);
             try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FlashSaleDetail detail = new FlashSaleDetail();
                    detail.setId(rs.getInt("id"));
                    detail.setVariantId(rs.getInt("product_variant_id"));
                    detail.setDiscountPercent(rs.getInt("discountPercent"));
                    detail.setFlashPrice(rs.getDouble("flashPrice"));
                    detail.setSaleStock(rs.getInt("saleStock"));
                    detail.setSku(rs.getString("sku"));
                    detail.setOriginalPrice(rs.getDouble("variant_price"));
                    detail.setInventory(rs.getInt("inventory_quantity"));
                    list.add(detail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteFlashSale(int id) {
        String sqlDetails = "DELETE FROM flashsaledetails WHERE flashSaleId = ?";
        String sqlFlashSale = "DELETE FROM flashsales WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps1 = conn.prepareStatement(sqlDetails);
             PreparedStatement ps2 = conn.prepareStatement(sqlFlashSale)) {
             ps1.setInt(1, id);
             ps1.executeUpdate();
             ps2.setInt(1, id);
             ps2.executeUpdate();
             return true;
        } catch (Exception e) {
             e.printStackTrace();
             return false;
        }

    }
}