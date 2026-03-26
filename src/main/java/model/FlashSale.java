package model;

import java.time.LocalDateTime;
import java.util.Date;

public class FlashSale {
    int id;
    String campaignName;
    String note;
    LocalDateTime startDate;
    LocalDateTime endDate;
    String status;
    LocalDateTime createdDate;

    public FlashSale(int id,String campaignName,  String note, LocalDateTime endDate, LocalDateTime startDate, LocalDateTime createdDate, String status) {
        this.campaignName = campaignName;
        this.id = id;
        this.note = note;
        this.endDate = endDate;
        this.startDate = startDate;
        this.createdDate = createdDate;
        this.status = status;
    }

    public FlashSale() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
