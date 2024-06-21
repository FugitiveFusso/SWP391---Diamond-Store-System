package com.khac.swp.fuj.diamondprice;

public class DiamondPriceDTO {

    public int id;
    public double size;
    public double caratWeight;
    public String color;
    public String clarity;
    public String cut;
    public String price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public double getCaratWeight() {
        return caratWeight;
    }

    public void setCaratWeight(double caratWeight) {
        this.caratWeight = caratWeight;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getClarity() {
        return clarity;
    }

    public void setClarity(String clarity) {
        this.clarity = clarity;
    }

    public String getCut() {
        return cut;
    }

    public void setCut(String cut) {
        this.cut = cut;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }



    @Override
    public String toString() {
        return "DiamondPriceDTO{" + "id=" + id + ", size=" + size + ", caratWeight=" + caratWeight + ", color=" + color + ", clarity=" + clarity + ", cut=" + cut + ", price=" + price + '}';
    }

}
