package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FlashSale {
    int id;
    String campaignName;
    String note;
    LocalDateTime startDate;
    LocalDateTime endDate;
    int status;
    LocalDateTime createdDate;
    List<FlashSaleDetail> details;

    public FlashSale(int id,String campaignName,  String note, LocalDateTime endDate, LocalDateTime startDate, LocalDateTime createdDate, int status) {
        this.campaignName = campaignName;
        this.id = id;
        this.note = note;
        this.endDate = endDate;
        this.startDate = startDate;
        this.createdDate = createdDate;
        this.status = status;
        details= new ArrayList<>();
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<FlashSaleDetail> getDetails() {
        return details;
    }

    public void setDetails(List<FlashSaleDetail> details) {
        this.details = details;
    }
    public String getStartDateString() {
        if (startDate == null) return "";
        return startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
    }

    public String getEndDateString() {
        if (endDate == null) return "";
        return endDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
    }
}
