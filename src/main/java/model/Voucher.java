package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Voucher {
    private int id;
    private String voucherCode;
    private String voucherName;
    private String description;
    private String promoType;
    private double promoValue;
    private double minOrderValue;
    private String rewardStyle;
    private int totalRelease;
    private int maxPerUser;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private int status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private List<String> applicableRanks;

    public Voucher() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getVoucherCode() { return voucherCode; }
    public void setVoucherCode(String voucherCode) { this.voucherCode = voucherCode; }
    public String getVoucherName() { return voucherName; }
    public void setVoucherName(String voucherName) { this.voucherName = voucherName; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getPromoType() { return promoType; }
    public void setPromoType(String promoType) { this.promoType = promoType; }
    public double getPromoValue() { return promoValue; }
    public void setPromoValue(double promoValue) { this.promoValue = promoValue; }
    public double getMinOrderValue() { return minOrderValue; }
    public void setMinOrderValue(double minOrderValue) { this.minOrderValue = minOrderValue; }
    public String getRewardStyle() { return rewardStyle; }
    public void setRewardStyle(String rewardStyle) { this.rewardStyle = rewardStyle; }
    public int getTotalRelease() { return totalRelease; }
    public void setTotalRelease(int totalRelease) { this.totalRelease = totalRelease; }
    public int getMaxPerUser() { return maxPerUser; }
    public void setMaxPerUser(int maxPerUser) { this.maxPerUser = maxPerUser; }
    public LocalDateTime getStartDate() { return startDate; }
    public void setStartDate(LocalDateTime startDate) { this.startDate = startDate; }
    public LocalDateTime getEndDate() { return endDate; }
    public void setEndDate(LocalDateTime endDate) { this.endDate = endDate; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public List<String> getApplicableRanks() { return applicableRanks; }
    public void setApplicableRanks(List<String> applicableRanks) { this.applicableRanks = applicableRanks; }
    public String getEndDateTimeFormat() {
        if (endDate == null) return "";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");
        return endDate.format(formatter);
    }
}