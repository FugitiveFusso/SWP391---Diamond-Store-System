package com.khac.swp.fuj.diamond;

public class DiamondDTO {

    private int diamondID;
    private String diamondName;
    private String diamondImage;
    private String origin;
    private int dpID;
    private int certificateID;
    private double diamondSize;
    private double caratWeight;
    private String color;
    private String clarity;
    private String cut;
    private String diamondPrice;
    private int totalDiamonds;
    private int activeDiamonds;
    private int deletedDiamonds;
    private int diamondsUsedInRing;
    private int diamondsNotUsedInRing;
    private double percentageDiamondsUsed;
    private double percentageDiamondsNotUsed;
    private String diamondsNotUsedListByID;
    private String diamondsUsedListbyID;
    private String topOrigins;

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

    public int getDpID() {
        return dpID;
    }

    public void setDpID(int dpID) {
        this.dpID = dpID;
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

    public String getDiamondPrice() {
        return diamondPrice;
    }

    public void setDiamondPrice(String diamondPrice) {
        this.diamondPrice = diamondPrice;
    }

    public int getTotalDiamonds() {
        return totalDiamonds;
    }

    public void setTotalDiamonds(int totalDiamonds) {
        this.totalDiamonds = totalDiamonds;
    }

    public int getActiveDiamonds() {
        return activeDiamonds;
    }

    public void setActiveDiamonds(int activeDiamonds) {
        this.activeDiamonds = activeDiamonds;
    }

    public int getDeletedDiamonds() {
        return deletedDiamonds;
    }

    public void setDeletedDiamonds(int deletedDiamonds) {
        this.deletedDiamonds = deletedDiamonds;
    }

    public int getDiamondsUsedInRing() {
        return diamondsUsedInRing;
    }

    public void setDiamondsUsedInRing(int diamondsUsedInRing) {
        this.diamondsUsedInRing = diamondsUsedInRing;
    }

    public int getDiamondsNotUsedInRing() {
        return diamondsNotUsedInRing;
    }

    public void setDiamondsNotUsedInRing(int diamondsNotUsedInRing) {
        this.diamondsNotUsedInRing = diamondsNotUsedInRing;
    }

    public double getPercentageDiamondsUsed() {
        return percentageDiamondsUsed;
    }

    public void setPercentageDiamondsUsed(double percentageDiamondsUsed) {
        this.percentageDiamondsUsed = percentageDiamondsUsed;
    }

    public double getPercentageDiamondsNotUsed() {
        return percentageDiamondsNotUsed;
    }

    public void setPercentageDiamondsNotUsed(double percentageDiamondsNotUsed) {
        this.percentageDiamondsNotUsed = percentageDiamondsNotUsed;
    }

    public String getDiamondsNotUsedListByID() {
        return diamondsNotUsedListByID;
    }

    public void setDiamondsNotUsedListByID(String diamondsNotUsedListByID) {
        this.diamondsNotUsedListByID = diamondsNotUsedListByID;
    }

    public String getDiamondsUsedListbyID() {
        return diamondsUsedListbyID;
    }

    public void setDiamondsUsedListbyID(String diamondsUsedListbyID) {
        this.diamondsUsedListbyID = diamondsUsedListbyID;
    }

    public String getTopOrigins() {
        return topOrigins;
    }

    public void setTopOrigins(String topOrigins) {
        this.topOrigins = topOrigins;
    }

    @Override
    public String toString() {
        return "DiamondDTO{" + "diamondID=" + diamondID + ", diamondName=" + diamondName + ", diamondImage=" + diamondImage + ", origin=" + origin + ", dpID=" + dpID + ", certificateID=" + certificateID + ", diamondSize=" + diamondSize + ", caratWeight=" + caratWeight + ", color=" + color + ", clarity=" + clarity + ", cut=" + cut + ", diamondPrice=" + diamondPrice + ", totalDiamonds=" + totalDiamonds + ", activeDiamonds=" + activeDiamonds + ", deletedDiamonds=" + deletedDiamonds + ", diamondsUsedInRing=" + diamondsUsedInRing + ", diamondsNotUsedInRing=" + diamondsNotUsedInRing + ", percentageDiamondsUsed=" + percentageDiamondsUsed + ", percentageDiamondsNotUsed=" + percentageDiamondsNotUsed + ", diamondsNotUsedListByID=" + diamondsNotUsedListByID + ", diamondsUsedListbyID=" + diamondsUsedListbyID + ", topOrigins=" + topOrigins + '}';
    }
    
}
