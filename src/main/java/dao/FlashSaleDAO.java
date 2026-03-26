package dao;

import dao.DBContext;
import model.FlashSale;

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
        String sql = "SELECT * FROM flashsale ORDER BY start_date DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                FlashSale fs = new FlashSale();
                fs.setId(rs.getInt("id"));
                fs.setStartDate(rs.getTimestamp("start_date").toLocalDateTime());
                fs.setEndDate(rs.getTimestamp("end_date").toLocalDateTime());
                fs.setStatus(rs.getString("status"));
                list.add(fs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}