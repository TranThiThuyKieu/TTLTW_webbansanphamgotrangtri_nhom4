package model;

import java.time.LocalDateTime;

public class RankConfig {
    private int id;
    private String rankName;
    private int minOrders;
    private double minSpending;
    private int cycleMonths;
    private LocalDateTime updatedAt;
    private String description;

    public RankConfig() {}
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getRankName() { return rankName; }
    public void setRankName(String rankName) { this.rankName = rankName; }
    public int getMinOrders() { return minOrders; }
    public void setMinOrders(int minOrders) { this.minOrders = minOrders; }
    public double getMinSpending() { return minSpending; }
    public void setMinSpending(double minSpending) { this.minSpending = minSpending; }
    public int getCycleMonths() { return cycleMonths; }
    public void setCycleMonths(int cycleMonths) { this.cycleMonths = cycleMonths; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}