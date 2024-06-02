package com.khac.swp.fuj.collection;

public class CollectionDTO {

    private int collectionID;
    private String collectionName;
    private String collectionImage;
    private String collectionDescription;

    public CollectionDTO() {
    }

    public CollectionDTO(int collectionID, String collectionName, String collectionImage, String collectionDescription) {
        this.collectionID = collectionID;
        this.collectionName = collectionName;
        this.collectionImage = collectionImage;
        this.collectionDescription = collectionDescription;
    }

    public int getCollectionID() {
        return collectionID;
    }

    public void setCollectionID(int collectionID) {
        this.collectionID = collectionID;
    }

    public String getCollectionName() {
        return collectionName;
    }

    public void setCollectionName(String collectionName) {
        this.collectionName = collectionName;
    }

    public String getCollectionImage() {
        return collectionImage;
    }

    public void setCollectionImage(String collectionImage) {
        this.collectionImage = collectionImage;
    }

    public String getCollectionDescription() {
        return collectionDescription;
    }

    public void setCollectionDescription(String collectionDescription) {
        this.collectionDescription = collectionDescription;
    }

    @Override
    public String toString() {
        return "CollectionDTO{" + "collectionID=" + collectionID + ", collectionName=" + collectionName + ", collectionImage=" + collectionImage + ", collectionDescription=" + collectionDescription + '}';
    }

}
