package com.khac.swp.fuj.ringplacementprice;

public class RingPlacementPriceDTO {

    public int id;
    public String name;
    public String material;
    public String color;
    public String price;
    public int totalRp;
    public String averagePrice;
    public int ringPlacementsByMaterial;
    public String totalMaterialPrice;
    public int ringPlacementsByColor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getTotalRp() {
        return totalRp;
    }

    public void setTotalRp(int totalRp) {
        this.totalRp = totalRp;
    }

    public String getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(String averagePrice) {
        this.averagePrice = averagePrice;
    }

    public int getRingPlacementsByMaterial() {
        return ringPlacementsByMaterial;
    }

    public void setRingPlacementsByMaterial(int ringPlacementsByMaterial) {
        this.ringPlacementsByMaterial = ringPlacementsByMaterial;
    }

    public String getTotalMaterialPrice() {
        return totalMaterialPrice;
    }

    public void setTotalMaterialPrice(String totalMaterialPrice) {
        this.totalMaterialPrice = totalMaterialPrice;
    }

    public int getRingPlacementsByColor() {
        return ringPlacementsByColor;
    }

    public void setRingPlacementsByColor(int ringPlacementsByColor) {
        this.ringPlacementsByColor = ringPlacementsByColor;
    }

    @Override
    public String toString() {
        return "RingPlacementPriceDTO{" + "id=" + id + ", name=" + name + ", material=" + material + ", color=" + color + ", price=" + price + ", totalRp=" + totalRp + ", averagePrice=" + averagePrice + ", ringPlacementsByMaterial=" + ringPlacementsByMaterial + ", totalMaterialPrice=" + totalMaterialPrice + ", ringPlacementsByColor=" + ringPlacementsByColor + '}';
    }

}
