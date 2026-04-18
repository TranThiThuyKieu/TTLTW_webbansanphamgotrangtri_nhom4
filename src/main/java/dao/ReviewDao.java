package dao;

import model.Reviews;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ReviewDao {
    public static Map<Integer, Reviews> reviews = new ConcurrentHashMap<>();

    public boolean hasUserReviewed(int userId, int productId) {

        String sql = """
                    SELECT COUNT(*) 
                    FROM reviews 
                """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean addReview(Reviews review) {
        String sql = """
                    INSERT INTO reviews(user_id, product_id, order_id, rate, comment, createAt)
                    VALUES (?, ?, ?, ?, ?, NOW())
                """;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setInt(3, review.getOrderId());
            ps.setInt(4, review.getRating());
            ps.setString(5, review.getComment());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Reviews> getReviewsByUserId(int userId) {
        List<Reviews> list = new ArrayList<>();
        String sql = """
                    SELECT r.*, p.name_product, i.urlImage 
                    FROM reviews r
                    JOIN products p ON r.product_id = p.id
                    LEFT JOIN images i ON p.primary_image_id = p.id
                    WHERE r.user_id = ? 
                    ORDER BY r.createAt DESC
                """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reviews r = new Reviews();
                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setProductId(rs.getInt("product_id"));
                    r.setOrderId(rs.getInt("order_id"));
                    r.setRating(rs.getInt("rate"));
                    r.setComment(rs.getString("comment"));
                    r.setCreateAt(rs.getTimestamp("createAt"));
                    r.setProductName(rs.getString("name_product"));
                    r.setProductImg(rs.getString("urlImage"));

                    list.add(r);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getReviewedKeysByUserId(int userId) {
        List<String> keys = new ArrayList<>();
        String sql = "SELECT order_id, product_id FROM reviews WHERE user_id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                keys.add(rs.getInt("order_id") + "_" + rs.getInt("product_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return keys;
    }

    public int getReviewCount(int productId) {
        String query = "SELECT COUNT(*) FROM reviews WHERE product_id = ? AND response_id = 0";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM reviews WHERE id = ? OR response_id = ?";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                ps.setInt(2, id);
                if (ps.executeUpdate() > 0) {
                    reviews.remove(id);
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Reviews findById(int id) {
        String sql = """
            SELECT 
                r.*, 
                u.full_name AS user_full_name,
                p.name_product AS product_name
            FROM reviews r
            LEFT JOIN users u ON r.user_id = u.id
            LEFT JOIN products p ON r.product_id = p.id
            WHERE r.id = ?
            """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Reviews r = new Reviews();

                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setProductId(rs.getInt("product_id"));
                    r.setOrderId(rs.getInt("order_id"));
                    r.setRating(rs.getInt("rate"));
                    r.setComment(rs.getString("comment"));
                    r.setCreateAt(rs.getTimestamp("createAt"));

                    r.setProductName(rs.getString("product_name"));
                    r.setUserName(rs.getString("user_full_name"));

                    return r;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Reviews> findAll() {
        List<Reviews> list = new ArrayList<>();
        String sql = "SELECT r.*, u.full_name AS user_name, p.name_product AS product_name, " +
                "(SELECT EXISTS(SELECT 1 FROM reviews rp WHERE rp.response_id = r.id)) AS is_replied " +
                "FROM reviews r " +
                "LEFT JOIN user u ON r.user_id = u.id " +
                "LEFT JOIN products p ON r.product_id = p.id " +
                "WHERE r.response_id = 0";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reviews r = new Reviews();

                    r.setId(rs.getInt("id"));
                    r.setProductId(rs.getInt("product_id"));
                    r.setRating(rs.getInt("rate"));
                    r.setComment(rs.getString("comment"));
                    r.setCreateAt(rs.getTimestamp("createAt"));
                    r.setProductName(rs.getString("name_product"));
                    r.setReplied(rs.getBoolean("is_replied"));

                    String userName = rs.getString("user_name");

                    if (userName != null) {
                        User user = new User();
                        user.setId(rs.getInt("user_id"));
                        user.setUsername(userName);

                        r.setUser(user);
                    }

                    list.add(r);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Reviews> applyFilterAndSearch(String rate, String type, String keyword) {
        List<Reviews> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT r.*, u.full_name AS user_name, p.name_product AS product_name, " +
                "(SELECT EXISTS(SELECT 1 FROM reviews rp WHERE rp.response_id = r.id)) AS is_replied " +
                "FROM reviews r " +
                "LEFT JOIN users u ON r.user_id = u.id " +
                "LEFT JOIN products p ON r.product_id = p.id " +
                "WHERE r.response_id = 0");
        List<Object> params = new ArrayList<>();

        if (rate != null && !rate.trim().isEmpty()) {
            try {
                int ratingValue = Integer.parseInt(rate.trim());
                sql.append(" AND r.rate = ?");
                params.add(ratingValue);
            } catch (NumberFormatException ignored) {
            }
        }

        if ("no-reply".equals(type)) {
            sql.append(" AND NOT EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id)");
        } else if ("replied".equals(type)) {
            sql.append(" AND EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id)");
        }

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND r.comment LIKE ?");
            params.add("%" + keyword.trim() + "%");
        }

        sql.append(" ORDER BY createAt DESC");

        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
                for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Reviews r = new Reviews();

                        r.setId(rs.getInt("id"));
                        r.setUserId(rs.getInt("user_id"));
                        r.setProductId(rs.getInt("product_id"));
                        r.setOrderId(rs.getInt("order_id"));
                        r.setRating(rs.getInt("rate"));
                        r.setComment(rs.getString("comment"));
                        r.setCreateAt(rs.getTimestamp("createAt"));
                        r.setProductName(rs.getString("product_name"));
                        r.setReplied(rs.getBoolean("is_replied"));

                        String userName = rs.getString("user_name");

                        if (userName != null) {
                            User user = new User();
                            user.setId(rs.getInt("user_id"));
                            user.setUsername(userName);

                            r.setUser(user);
                        }

                        list.add(r);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Reviews> getChatHistoryByUserId(int userId) {
        List<Reviews> list = new ArrayList<>();
        String sql = "SELECT r.*, u.full_name AS user_name, p.name_product AS product_name FROM reviews r " +
                "LEFT JOIN users u ON r.user_id = u.id " +
                "LEFT JOIN products p ON r.product_id = p.id " +
                "WHERE r.id = ? OR r.response_id = ? " +
                "ORDER BY r.createAt ASC";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);
                ps.setInt(2, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Reviews r = new Reviews();

                        r.setId(rs.getInt("id"));
                        r.setRespone_id(rs.getInt("response_id"));
                        r.setUserId(rs.getInt("user_id"));
                        r.setProductId(rs.getInt("product_id"));
                        r.setOrderId(rs.getInt("order_id"));
                        r.setRating(rs.getInt("rate"));
                        r.setComment(rs.getString("comment"));
                        r.setCreateAt(rs.getTimestamp("createAt"));
                        r.setProductName(rs.getString("product_name"));
                        String userName = rs.getString("user_name");

                        if (userName != null) {
                            User user = new User();
                            user.setId(rs.getInt("user_id"));
                            user.setUsername(userName);

                            r.setUser(user);
                        }

                        list.add(r);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertReply(int parentId, int adminId, String comment) {
        String sql = "INSERT INTO reviews (response_id, user_id, product_id, rate, comment, createAt) " +
                "VALUES (?, ?, (SELECT product_id FROM (SELECT product_id FROM reviews WHERE id = ?) AS tmp), 0, ?, NOW())";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, parentId);
                ps.setInt(2, adminId);
                ps.setInt(3, parentId);
                ps.setString(4, comment);
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Reviews> searchAndFilter(String keyword, String rate, String type, int page, int pageSize) {
        List<Reviews> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT r.*, u.full_name AS user_name, p.name_product AS product_name, " +
                        "(SELECT EXISTS(SELECT 1 FROM reviews rp WHERE rp.response_id = r.id)) AS is_replied " +
                        "FROM reviews r " +
                        "LEFT JOIN users u ON r.user_id = u.id " +
                        "LEFT JOIN products p ON r.product_id = p.id " +
                        "WHERE r.response_id = 0 "
        );

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND r.comment LIKE ? ");
            params.add("%" + keyword.trim() + "%");
        }

        if (rate != null && !rate.isEmpty()) {
            sql.append(" AND r.rate= ? ");
            params.add(Integer.parseInt(rate));
        }

        if ("no-reply".equals(type)) {
            sql.append(" AND NOT EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id) ");
        } else if ("replied".equals(type)) {
            sql.append(" AND EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id) ");
        }

        sql.append(" ORDER BY r.createAt DESC LIMIT ? OFFSET ? ");

        params.add(pageSize);
        params.add((page - 1) * pageSize);

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reviews r = new Reviews();

                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setProductId(rs.getInt("product_id"));
                    r.setOrderId(rs.getInt("order_id"));
                    r.setRating(rs.getInt("rate"));
                    r.setComment(rs.getString("comment"));
                    r.setCreateAt(rs.getTimestamp("createAt"));
                    r.setProductName(rs.getString("product_name"));
                    r.setReplied(rs.getBoolean("is_replied"));

                    String userName = rs.getString("user_name");

                    if (userName != null) {
                        User user = new User();
                        user.setId(rs.getInt("user_id"));
                        user.setUsername(userName);

                        r.setUser(user);
                    }

                    list.add(r);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public int countFilteredReviews(String keyword, String rate, String type) {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(*) FROM reviews r WHERE r.response_id = 0 "
        );

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND r.comment LIKE ? ");
            params.add("%" + keyword.trim() + "%");
        }

        if (rate != null && !rate.isEmpty()) {
            sql.append(" AND r.rate = ? ");
            params.add(Integer.parseInt(rate));
        }

        if ("no-reply".equals(type)) {
            sql.append(" AND NOT EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id) ");
        } else if ("replied".equals(type)) {
            sql.append(" AND EXISTS (SELECT 1 FROM reviews rp WHERE rp.response_id = r.id) ");
        }

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    public List<Reviews> getAllReviewsWithReplies(int productId) {
        List<Reviews> list = new ArrayList<>();

        String sql = """
        SELECT r.*, u.full_name AS user_name
        FROM reviews r
        LEFT JOIN users u ON r.user_id = u.id
        WHERE r.product_id = ?
        ORDER BY r.createAt ASC
    """;

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reviews r = new Reviews();

                r.setId(rs.getInt("id"));
                r.setRespone_id(rs.getInt("response_id"));
                r.setUserId(rs.getInt("user_id"));
                r.setRating(rs.getInt("rate"));
                r.setComment(rs.getString("comment"));
                r.setCreateAt(rs.getTimestamp("createAt"));

                String userName = rs.getString("user_name");
                if (userName != null) {
                    User user = new User();
                    user.setId(r.getUserId());
                    user.setUsername(userName);
                    r.setUser(user);
                }

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
