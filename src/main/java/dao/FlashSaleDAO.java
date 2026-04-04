package dao;

import dao.DBContext;
import model.FlashSale;
import model.FlashSaleDetail;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
                int id = rs.getInt("id"); 
                fs.setId(id);
                fs.setCampaignName(rs.getString("campaignName"));
                fs.setNote(rs.getString("note"));
                fs.setStartDate(rs.getTimestamp("startDate").toLocalDateTime());
                fs.setEndDate(rs.getTimestamp("endDate").toLocalDateTime());
                fs.setStatus(rs.getInt("status"));
                fs.setDetails(getFlashSaleDetails(id));
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
    public FlashSale getActiveFlashSale() {
        String sql = "SELECT * FROM flashsales " +
                "WHERE status = 1 AND startDate <= NOW() AND endDate >= NOW() " +
                "ORDER BY startDate DESC LIMIT 1";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                FlashSale fs = new FlashSale();
                int id = rs.getInt("id");

                fs.setId(id);
                fs.setCampaignName(rs.getString("campaignName"));
                fs.setNote(rs.getString("note"));
                fs.setStartDate(rs.getTimestamp("startDate").toLocalDateTime());
                fs.setEndDate(rs.getTimestamp("endDate").toLocalDateTime());
                fs.setStatus(rs.getInt("status"));

                fs.setDetails(getFlashSaleDetails(id));

                return fs;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<FlashSaleDetail> getTop3BestSellingInFlashSale(int flashSaleId) {
        List<FlashSaleDetail> list = new ArrayList<>();

        String sql = "SELECT " +
                "fsd.id, fsd.product_variant_id, fsd.discountPercent, pv.price_sale, fsd.saleStock, " +
                "pv.sku, pv.variant_price, pv.inventory_quantity, " +
                "p.id AS productId, p.name_product, p.price, img.urlImage, " +
                "AVG(r.rate) AS avg_rate, " +
                "COALESCE(SUM(CASE WHEN o.status = 'Đã giao' THEN od.quantity ELSE 0 END), 0) AS totalSold " +
                "FROM FlashSaleDetails fsd " +
                "JOIN product_variants pv ON fsd.product_variant_id = pv.id " +
                "JOIN products p ON pv.product_id = p.id " +
                "LEFT JOIN reviews r ON p.id = r.product_id " +
                "LEFT JOIN images img ON p.primary_image_id = img.id " +
                "LEFT JOIN order_details od ON od.product_variant_id = pv.id " +
                "LEFT JOIN orders o ON o.id = od.order_id " +
                "WHERE fsd.flashSaleId = ? AND p.isActive = 1 " +
                "GROUP BY fsd.id, p.id, pv.id, img.id " +
                "ORDER BY totalSold DESC " +
                "LIMIT 3";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, flashSaleId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FlashSaleDetail d = new FlashSaleDetail();

                d.setId(rs.getInt("id"));
                d.setVariantId(rs.getInt("product_variant_id"));
                d.setDiscountPercent(rs.getInt("discountPercent"));
                d.setFlashPrice(rs.getDouble("price_sale"));
                d.setSaleStock(rs.getInt("saleStock"));

                d.setSku(rs.getString("sku"));
                d.setOriginalPrice(rs.getDouble("variant_price"));
                d.setAverageRating(rs.getDouble("avg_rate"));
                d.setInventory(rs.getInt("inventory_quantity"));

                d.setProductId(rs.getInt("productId"));
                d.setNameProduct(rs.getString("name_product"));
                d.setImageUrl(rs.getString("urlImage"));
                d.setSold(rs.getInt("totalSold"));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<FlashSaleDetail> filterFlashSaleProducts(
            int flashSaleId,
            Integer categoryId,
            String[] types,
            String[] prices,
            String[] ratings,
            String colorId,
            String sourceId,
            String minPrice,
            String maxPrice,
            String sort
    ) {
        List<FlashSaleDetail> list = new ArrayList<>();
        List<Object> params = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT fsd.id, fsd.discountPercent, pv.price_sale, " +
                        "pv.variant_price, pv.inventory_quantity, " +
                        "p.id AS productId, p.name_product, img.urlImage, " +
                        "AVG(r.rate) AS avg_rate, " +
                        "COALESCE(SUM(CASE WHEN o.status = 'Đã giao' THEN od.quantity ELSE 0 END), 0) AS totalSold " +
                        "FROM FlashSaleDetails fsd " +
                        "JOIN product_variants pv ON fsd.product_variant_id = pv.id " +
                        "JOIN products p ON pv.product_id = p.id " +
                        "LEFT JOIN images img ON p.primary_image_id = img.id " +
                        "LEFT JOIN reviews r ON p.id = r.product_id " +
                        "LEFT JOIN order_details od ON od.product_variant_id = pv.id " +
                        "LEFT JOIN orders o ON o.id = od.order_id " +
                        "WHERE fsd.flashSaleId = ? AND p.isActive = 1"
        );

        params.add(flashSaleId);

        if (categoryId != null) {
            sql.append(" AND p.category_id = ? ");
            params.add(categoryId);
        }

        if (types != null && types.length > 0) {
            sql.append(" AND p.product_type_id IN (");
            sql.append(String.join(",", Collections.nCopies(types.length, "?")));
            sql.append(")");
            for (String t : types) params.add(Integer.parseInt(t));
        }

        if (colorId != null && !colorId.isEmpty()) {
            sql.append(" AND pv.color_id = ? ");
            params.add(Integer.parseInt(colorId));
        }

        if (sourceId != null && !sourceId.isEmpty()) {
            sql.append(" AND p.source_id = ? ");
            params.add(Integer.parseInt(sourceId));
        }

        if (minPrice != null && !minPrice.isEmpty()) {
            sql.append(" AND pv.price_sale >= ? ");
            params.add(Double.parseDouble(minPrice));
        }
        if (maxPrice != null && !maxPrice.isEmpty()) {
            sql.append(" AND pv.price_sale <= ? ");
            params.add(Double.parseDouble(maxPrice));
        }

        if (prices != null && prices.length > 0) {
            List<String> conds = new ArrayList<>();

            for (String p : prices) {
                switch (p) {
                    case "1": conds.add("pv.price_sale < 1000000"); break;
                    case "2": conds.add("pv.price_sale BETWEEN 1000000 AND 3000000"); break;
                    case "3": conds.add("pv.price_sale BETWEEN 3000000 AND 5000000"); break;
                    case "4": conds.add("pv.price_sale BETWEEN 5000000 AND 10000000"); break;
                    case "5": conds.add("pv.price_sale > 10000000"); break;
                }
            }

            if (!conds.isEmpty()) {
                sql.append(" AND (").append(String.join(" OR ", conds)).append(") ");
            }
        }

        sql.append(" GROUP BY fsd.id ");

        if (ratings != null && ratings.length > 0) {
            int min = Arrays.stream(ratings).mapToInt(Integer::parseInt).min().orElse(0);
            sql.append(" HAVING avg_rate >= ? ");
            params.add(min);
        }

        if ("price_asc".equals(sort)) {
            sql.append(" ORDER BY pv.price_sale ASC ");
        } else if ("price_desc".equals(sort)) {
            sql.append(" ORDER BY pv.price_sale DESC ");
        }

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FlashSaleDetail d = new FlashSaleDetail();

                d.setId(rs.getInt("id"));
                d.setDiscountPercent(rs.getInt("discountPercent"));
                d.setFlashPrice(rs.getDouble("price_sale"));
                d.setOriginalPrice(rs.getDouble("variant_price"));
                d.setAverageRating(rs.getDouble("avg_rate"));
                d.setProductId(rs.getInt("productId"));
                d.setNameProduct(rs.getString("name_product"));
                d.setImageUrl(rs.getString("urlImage"));
                d.setSold(rs.getInt("totalSold"));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}