package com.khac.swp.fuj.category;

public class CategoryDTO {

    private int categoryID;
    private String categoryName;
    private String image;
    private int totalCategories;
    private int activeCategories;
    private int deletedCategories;
    private String top3CategoryNames;
    private int top3CategoryRingCounts;

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

    public int getTotalCategories() {
        return totalCategories;
    }

    public void setTotalCategories(int totalCategories) {
        this.totalCategories = totalCategories;
    }

    public int getActiveCategories() {
        return activeCategories;
    }

    public void setActiveCategories(int activeCategories) {
        this.activeCategories = activeCategories;
    }

    public int getDeletedCategories() {
        return deletedCategories;
    }

    public void setDeletedCategories(int deletedCategories) {
        this.deletedCategories = deletedCategories;
    }

    public String getTop3CategoryNames() {
        return top3CategoryNames;
    }

    public void setTop3CategoryNames(String top3CategoryNames) {
        this.top3CategoryNames = top3CategoryNames;
    }

    public int getTop3CategoryRingCounts() {
        return top3CategoryRingCounts;
    }

    public void setTop3CategoryRingCounts(int top3CategoryRingCounts) {
        this.top3CategoryRingCounts = top3CategoryRingCounts;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", image=" + image + ", totalCategories=" + totalCategories + ", activeCategories=" + activeCategories + ", deletedCategories=" + deletedCategories + ", top3CategoryNames=" + top3CategoryNames + ", top3CategoryRingCounts=" + top3CategoryRingCounts + '}';
    }

}
