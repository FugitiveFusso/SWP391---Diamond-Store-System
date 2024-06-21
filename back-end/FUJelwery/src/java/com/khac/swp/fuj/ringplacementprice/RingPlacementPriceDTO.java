package com.khac.swp.fuj.ringplacementprice;

public class RingPlacementPriceDTO {

    public int id;
    public String name;
    public String material;
    public String color;
    public String price;

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

    @Override
    public String toString() {
        return "RingPlacementPriceDTO{" + "id=" + id + ", name=" + name + ", material=" + material + ", color=" + color + ", price=" + price + '}';
    }

}
