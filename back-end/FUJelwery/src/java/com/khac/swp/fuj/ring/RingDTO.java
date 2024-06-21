package com.khac.swp.fuj.ring;

public class RingDTO {

    private int ringID;
    private int rpID;
    private String ringName;
    private String ringImage;
    private int diamondID;
    private String price;
    private int categoryID;
    private int collectionID;
    private String ringPlacementName;
    private String material;
    private String ringColor;
    private String rpPrice;
    private String diamondName;
    private String diamondImage;
    private String origin;
    private int certificateID;
    private double diamondSize;
    private double caratWeight;
    private String cut;
    private String color;
    private String clarity;
    private String diamondPrice;
    private String totalPrice;

    public int getRingID() {
        return ringID;
    }

    public void setRingID(int ringID) {
        this.ringID = ringID;
    }

    public int getRpID() {
        return rpID;
    }

    public void setRpID(int rpID) {
        this.rpID = rpID;
    }

    public String getRingName() {
        return ringName;
    }

    public void setRingName(String ringName) {
        this.ringName = ringName;
    }

    public String getRingImage() {
        return ringImage;
    }

    public void setRingImage(String ringImage) {
        this.ringImage = ringImage;
    }

    public int getDiamondID() {
        return diamondID;
    }

    public void setDiamondID(int diamondID) {
        this.diamondID = diamondID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getCollectionID() {
        return collectionID;
    }

    public void setCollectionID(int collectionID) {
        this.collectionID = collectionID;
    }

    public String getRingPlacementName() {
        return ringPlacementName;
    }

    public void setRingPlacementName(String ringPlacementName) {
        this.ringPlacementName = ringPlacementName;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getRingColor() {
        return ringColor;
    }

    public void setRingColor(String ringColor) {
        this.ringColor = ringColor;
    }

    public String getDiamondName() {
        return diamondName;
    }

    public void setDiamondName(String diamondName) {
        this.diamondName = diamondName;
    }

    public String getDiamondImage() {
        return diamondImage;
    }

    public void setDiamondImage(String diamondImage) {
        this.diamondImage = diamondImage;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public double getDiamondSize() {
        return diamondSize;
    }

    public void setDiamondSize(double diamondSize) {
        this.diamondSize = diamondSize;
    }

    public double getCaratWeight() {
        return caratWeight;
    }

    public void setCaratWeight(double caratWeight) {
        this.caratWeight = caratWeight;
    }

    public String getCut() {
        return cut;
    }

    public void setCut(String cut) {
        this.cut = cut;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getRpPrice() {
        return rpPrice;
    }

    public void setRpPrice(String rpPrice) {
        this.rpPrice = rpPrice;
    }

    public String getDiamondPrice() {
        return diamondPrice;
    }

    public void setDiamondPrice(String diamondPrice) {
        this.diamondPrice = diamondPrice;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "RingDTO{" + "ringID=" + ringID + ", rpID=" + rpID + ", ringName=" + ringName + ", ringImage=" + ringImage + ", diamondID=" + diamondID + ", price=" + price + ", categoryID=" + categoryID + ", collectionID=" + collectionID + ", ringPlacementName=" + ringPlacementName + ", material=" + material + ", ringColor=" + ringColor + ", rpPrice=" + rpPrice + ", diamondName=" + diamondName + ", diamondImage=" + diamondImage + ", origin=" + origin + ", certificateID=" + certificateID + ", diamondSize=" + diamondSize + ", caratWeight=" + caratWeight + ", cut=" + cut + ", color=" + color + ", clarity=" + clarity + ", diamondPrice=" + diamondPrice + ", totalPrice=" + totalPrice + '}';
    }

}
