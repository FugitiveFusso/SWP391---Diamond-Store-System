package com.khac.swp.fuj.voucher;

public class VoucherDTO {

    private int id;
    private String name;
    private String image;
    private String createddate;
    private String createdby;
    private String description;
    private String coupon;
    private int percentage;
    private int totalOrdersUsingVoucher;
    private int totalActiveVouchers;

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

    public String getCreateddate() {
        return createddate;
    }

    public void setCreateddate(String createddate) {
        this.createddate = createddate;
    }

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCoupon() {
        return coupon;
    }

    public void setCoupon(String coupon) {
        this.coupon = coupon;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }

    public int getTotalOrdersUsingVoucher() {
        return totalOrdersUsingVoucher;
    }

    public void setTotalOrdersUsingVoucher(int totalOrdersUsingVoucher) {
        this.totalOrdersUsingVoucher = totalOrdersUsingVoucher;
    }

    public int getTotalActiveVouchers() {
        return totalActiveVouchers;
    }

    public void setTotalActiveVouchers(int totalActiveVouchers) {
        this.totalActiveVouchers = totalActiveVouchers;
    }

    @Override
    public String toString() {
        return "VoucherDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", createddate=" + createddate + ", createdby=" + createdby + ", description=" + description + ", coupon=" + coupon + ", percentage=" + percentage + ", totalOrdersUsingVoucher=" + totalOrdersUsingVoucher + ", totalActiveVouchers=" + totalActiveVouchers + '}';
    }

}
