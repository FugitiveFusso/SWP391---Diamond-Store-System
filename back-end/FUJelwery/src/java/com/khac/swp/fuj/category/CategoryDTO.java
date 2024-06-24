package com.khac.swp.fuj.category;

public class CategoryDTO {

    private int categoryID;
    private String categoryName;
    private String image;



    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", image=" + image + '}';
    }

    

}
