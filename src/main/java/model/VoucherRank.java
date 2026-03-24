package model;

public class VoucherRank {
    private int id;
    private int voucherId;
    private String rankName;

    public VoucherRank() {}
    public VoucherRank(int voucherId, String rankName) {
        this.voucherId = voucherId;
        this.rankName = rankName;
    }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getVoucherId() { return voucherId; }
    public void setVoucherId(int voucherId) { this.voucherId = voucherId; }
    public String getRankName() { return rankName; }
    public void setRankName(String rankName) { this.rankName = rankName; }
}