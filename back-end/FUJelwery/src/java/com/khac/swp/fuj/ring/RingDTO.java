/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ring;

/**
 *
 * @author Dell
 */
public class RingDTO {
    private int ringID;
    private String ringName;
    private String ringImage;
    private int diamondID;
    private String gender;
    private double price;
    private int quantity;
    private int categoryID;
    private int collectionID;
    private String diamondName;
    private String diamondImage;
    private String origin;
    private int caratWeight;
    private String cut;
    private String color;
    private String clarity;
    

    public RingDTO() {
    }

    public RingDTO(int ringID, String ringName, String ringImage, int diamondID, String gender, double price, int quantity, int categoryID, int collectionID, String diamondName, String diamondImage, String origin, int caratWeight, String cut, String color, String clarity) {
        this.ringID = ringID;
        this.ringName = ringName;
        this.ringImage = ringImage;
        this.diamondID = diamondID;
        this.gender = gender;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.collectionID = collectionID;
        this.diamondName = diamondName;
        this.diamondImage = diamondImage;
        this.origin = origin;
        this.caratWeight = caratWeight;
        this.cut = cut;
        this.color = color;
        this.clarity = clarity;
    }

    public int getRingID() {
        return ringID;
    }

    public void setRingID(int ringID) {
        this.ringID = ringID;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public int getCaratWeight() {
        return caratWeight;
    }

    public void setCaratWeight(int caratWeight) {
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

    @Override
    public String toString() {
        return "RingDTO{" + "ringID=" + ringID + ", ringName=" + ringName + ", ringImage=" + ringImage + ", diamondID=" + diamondID + ", gender=" + gender + ", price=" + price + ", quantity=" + quantity + ", categoryID=" + categoryID + ", collectionID=" + collectionID + ", diamondName=" + diamondName + ", diamondImage=" + diamondImage + ", origin=" + origin + ", caratWeight=" + caratWeight + ", cut=" + cut + ", color=" + color + ", clarity=" + clarity + '}';
    }

    
    
}
