package model;

import java.sql.Timestamp;
import java.util.List;

public class Reviews {
    private int id;
    private int userId;
    private int productId;
    private int rating;
    private String comment;
    private Timestamp createAt;
    private boolean rated;
    public boolean isRated() {
        return rated;
    }
    public void setRated(boolean rated) {
        this.rated = rated;
    }
    private String productName;
    private String productImg;
    private int orderId;
    private int response_id;
    private boolean isReplied;
    private String userName;
    private User user;
    private List<Reviews> replies;

    public Reviews() {}
    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public Timestamp getCreateAt() {
        return createAt;
    }
    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductImg() {
        return productImg;
    }
    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }
    public int getRespone_id() {
        return response_id;
    }
    public void setRespone_id(int respone_id) {
        this.response_id = respone_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isReplied() {
        return isReplied;
    }

    public void setReplied(boolean replied) {
        isReplied = replied;
    }
    public List<Reviews> getReplies() {
        return replies;
    }

    public void setReplies(List<Reviews> replies) {
        this.replies = replies;
    }
}