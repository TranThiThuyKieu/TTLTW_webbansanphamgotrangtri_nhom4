package model;

public class FlashSaleDetail {
    int id;
    int variantId;
    int discountPercent;
    double flashPrice;
    int saleStock;
    String sku;
    double originalPrice;
    int inventory;
    int productId;
    String nameProduct;
    String imageUrl;
    int sold;
    private double averageRating;

    public FlashSaleDetail(int variantId, int id, int discountPercent, double flashPrice, int saleStock, String sku, double originalPrice, int inventory) {
        this.variantId = variantId;
        this.id = id;
        this.discountPercent = discountPercent;
        this.flashPrice = flashPrice;
        this.saleStock = saleStock;
        this.sku = sku;
        this.originalPrice = originalPrice;
        this.inventory = inventory;
    }

    public FlashSaleDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public double getFlashPrice() {
        return flashPrice;
    }

    public void setFlashPrice(double flashPrice) {
        this.flashPrice = flashPrice;
    }

    public int getSaleStock() {
        return saleStock;
    }

    public void setSaleStock(int saleStock) {
        this.saleStock = saleStock;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }
    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }
}
