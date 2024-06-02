package com.khac.swp.fuj.warranty;

public class WarrantyDTO {
    public int id;
    public String name;
    public String image;
    public int month;
    public String description;
    public String type;
    public String startdate;
    public String enddate;
    public String termsandconditions;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getTermsandconditions() {
        return termsandconditions;
    }

    public void setTermsandconditions(String termsandconditions) {
        this.termsandconditions = termsandconditions;
    }

    @Override
    public String toString() {
        return "WarrantyDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", month=" + month + ", description=" + description + ", type=" + type + ", startdate=" + startdate + ", enddate=" + enddate + ", termsandconditions=" + termsandconditions + '}';
    }


    
}
