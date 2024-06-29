package com.khac.swp.fuj.diamondprice;

public class DiamondPriceDTO {

    public int id;
    public double size;
    public double caratWeight;
    public String color;
    public String clarity;
    public String cut;
    public String price;
    public int totalDiamondsPrice;
    public String averagePrice;
    public String highestPrice;
    public String lowestPrice;
    public int activeDiamondsPrice;
    public int deletedDiamondsPrice;
    public String allDiamondSizes;
    public String allCaratWeights;
    public String allColors;
    public String allClarities;

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

    public int getTotalDiamondsPrice() {
        return totalDiamondsPrice;
    }

    public void setTotalDiamondsPrice(int totalDiamondsPrice) {
        this.totalDiamondsPrice = totalDiamondsPrice;
    }

    public String getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(String averagePrice) {
        this.averagePrice = averagePrice;
    }

    public String getHighestPrice() {
        return highestPrice;
    }

    public void setHighestPrice(String highestPrice) {
        this.highestPrice = highestPrice;
    }

    public String getLowestPrice() {
        return lowestPrice;
    }

    public void setLowestPrice(String lowestPrice) {
        this.lowestPrice = lowestPrice;
    }

    public int getActiveDiamondsPrice() {
        return activeDiamondsPrice;
    }

    public void setActiveDiamondsPrice(int activeDiamondsPrice) {
        this.activeDiamondsPrice = activeDiamondsPrice;
    }

    public int getDeletedDiamondsPrice() {
        return deletedDiamondsPrice;
    }

    public void setDeletedDiamondsPrice(int deletedDiamondsPrice) {
        this.deletedDiamondsPrice = deletedDiamondsPrice;
    }

    public String getAllDiamondSizes() {
        return allDiamondSizes;
    }

    public void setAllDiamondSizes(String allDiamondSizes) {
        this.allDiamondSizes = allDiamondSizes;
    }

    public String getAllCaratWeights() {
        return allCaratWeights;
    }

    public void setAllCaratWeights(String allCaratWeights) {
        this.allCaratWeights = allCaratWeights;
    }

    public String getAllColors() {
        return allColors;
    }

    public void setAllColors(String allColors) {
        this.allColors = allColors;
    }

    public String getAllClarities() {
        return allClarities;
    }

    public void setAllClarities(String allClarities) {
        this.allClarities = allClarities;
    }

    @Override
    public String toString() {
        return "DiamondPriceDTO{" + "id=" + id + ", size=" + size + ", caratWeight=" + caratWeight + ", color=" + color + ", clarity=" + clarity + ", cut=" + cut + ", price=" + price + ", totalDiamondsPrice=" + totalDiamondsPrice + ", averagePrice=" + averagePrice + ", highestPrice=" + highestPrice + ", lowestPrice=" + lowestPrice + ", activeDiamondsPrice=" + activeDiamondsPrice + ", deletedDiamondsPrice=" + deletedDiamondsPrice + ", allDiamondSizes=" + allDiamondSizes + ", allCaratWeights=" + allCaratWeights + ", allColors=" + allColors + ", allClarities=" + allClarities + '}';
    }

}
