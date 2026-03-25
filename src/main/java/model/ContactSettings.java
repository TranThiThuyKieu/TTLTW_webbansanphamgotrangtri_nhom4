package model;

public class ContactSettings {
    private int id = 1;
    private String phone;
    private String email;
    private String province;
    private String district;
    private String ward;
    private int province_id;
    private int district_id;
    private String ward_code;
    private String detail;
    private String facebookUrl;
    private String instagramUrl;
    private String twitterUrl;
    private String googleUrl;
    private String fullAddress;

    public ContactSettings() {}

    public ContactSettings(int id, String phone, String email, String detail, String ward_code, int district_id, int province_id,
                           String facebookUrl, String instagramUrl, String twitterUrl, String googleUrl) {
        this.id = id;
        this.phone = phone;
        this.email = email;
        this.detail = detail;
        this.ward_code = ward_code;
        this.district_id = district_id;
        this.province_id = province_id;
        this.facebookUrl = facebookUrl;
        this.instagramUrl = instagramUrl;
        this.twitterUrl = twitterUrl;
        this.googleUrl = googleUrl;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getInstagramUrl() {
        return instagramUrl;
    }

    public void setInstagramUrl(String instagramUrl) {
        this.instagramUrl = instagramUrl;
    }

    public String getTwitterUrl() {
        return twitterUrl;
    }

    public void setTwitterUrl(String twitterUrl) {
        this.twitterUrl = twitterUrl;
    }

    public String getGoogleUrl() {
        return googleUrl;
    }

    public void setGoogleUrl(String googleUrl) {
        this.googleUrl = googleUrl;
    }

    public String getFullAddress() {
        if (detail == null || detail.isEmpty()) return "Chưa cập nhật";
        return detail + ", " + ward + ", " + district + ", " + province;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public int getProvince_id() {
        return province_id;
    }

    public void setProvince_id(int province_id) {
        this.province_id = province_id;
    }

    public int getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(int district_id) {
        this.district_id = district_id;
    }

    public String getWard_code() {
        return ward_code;
    }

    public void setWard_code(String ward_code) {
        this.ward_code = ward_code;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "ContactSettings{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", detail='" + detail + '\'' +
                ", ward='" + ward + '\'' +
                ", district='" + district + '\'' +
                ", province='" + province + '\'' +
                ", facebookUrl='" + facebookUrl + '\'' +
                ", instagramUrl='" + instagramUrl + '\'' +
                ", twitterUrl='" + twitterUrl + '\'' +
                ", googleUrl='" + googleUrl + '\'' +
                '}';
    }
}