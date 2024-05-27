/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.diamond;

/**
 *
 * @author Dell
 */
public class DiamondDTO {
    private int diamondID;
    private String diamondName;
    private String diamondImage;
    private String origin;
    private int caratWeight;
    private String cut;
    private String color;
    private String clarity;

    public DiamondDTO() {
    }

    public DiamondDTO(int diamondID, String diamondName, String diamondImage, String origin, int caratWeight, String cut, String color, String clarity) {
        this.diamondID = diamondID;
        this.diamondName = diamondName;
        this.diamondImage = diamondImage;
        this.origin = origin;
        this.caratWeight = caratWeight;
        this.cut = cut;
        this.color = color;
        this.clarity = clarity;
    }

    public int getDiamondID() {
        return diamondID;
    }

    public void setDiamondID(int diamondID) {
        this.diamondID = diamondID;
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
        return "DiamondDTO{" + "diamondID=" + diamondID + ", diamondName=" + diamondName + ", diamondImage=" + diamondImage + ", origin=" + origin + ", caratWeight=" + caratWeight + ", cut=" + cut + ", color=" + color + ", clarity=" + clarity + '}';
    }
    
}
