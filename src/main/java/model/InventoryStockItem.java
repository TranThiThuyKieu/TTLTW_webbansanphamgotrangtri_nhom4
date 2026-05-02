package model;

public class InventoryStockItem {
    int id;
    int inventory_stock_id;
    int variant_id;
    int quantity;
    double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInventory_stock_id() {
        return inventory_stock_id;
    }

    public void setInventory_stock_id(int inventory_stock_id) {
        this.inventory_stock_id = inventory_stock_id;
    }

    public int getVariant_id() {
        return variant_id;
    }

    public void setVariant_id(int variant_id) {
        this.variant_id = variant_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
