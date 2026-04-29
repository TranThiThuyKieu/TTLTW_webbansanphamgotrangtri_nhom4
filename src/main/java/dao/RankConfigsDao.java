package dao;

import model.RankConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RankConfigsDao {
    public List<RankConfig> getAllRanks() {
        List<RankConfig> list = new ArrayList<>();
        String sql = "SELECT * FROM rank_configs ORDER BY min_spending ASC";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                RankConfig r = new RankConfig();
                r.setId(rs.getInt("id"));
                r.setRankName(rs.getString("rank_name"));
                r.setMinOrders(rs.getInt("min_orders"));
                r.setMinSpending(rs.getDouble("min_spending"));
                r.setCycleMonths(rs.getInt("cycle_months"));
                r.setDescription(rs.getString("description"));
                r.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
