/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.order;

/**
 *
 * @author Dell
 */
public class OrderDTO {
    private int orderID;
    private int userID;
    private String userName;
    private String address;
    private String orderDate;
    private int ringID;
    private String ringName;
    private int voucherID;
    private String voucherName;
    private int warrantyID;
    private String warrantyName;
    private int certificateID;
    private String certificateName;
    private int ringSize;
    private int totalPrice;
    private String purchaseMethod;
    private String status;
    private String delivered;

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
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

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public String getVoucherName() {
        return voucherName;
    }

    public void setVoucherName(String voucherName) {
        this.voucherName = voucherName;
    }

    public int getWarrantyID() {
        return warrantyID;
    }

    public void setWarrantyID(int warrantyID) {
        this.warrantyID = warrantyID;
    }

    public String getWarrantyName() {
        return warrantyName;
    }

    public void setWarrantyName(String warrantyName) {
        this.warrantyName = warrantyName;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public String getCertificateName() {
        return certificateName;
    }

    public void setCertificateName(String certificateName) {
        this.certificateName = certificateName;
    }
    
    public int getRingSize() {
        return ringSize;
    }

    public void setRingSize(int ringSize) {
        this.ringSize = ringSize;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPurchaseMethod() {
        return purchaseMethod;
    }

    public void setPurchaseMethod(String purchaseMethod) {
        this.purchaseMethod = purchaseMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelivered() {
        return delivered;
    }

    public void setDelivered(String delivered) {
        this.delivered = delivered;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderID=" + orderID + ", userID=" + userID + ", userName=" + userName + ", orderDate=" + orderDate + ", ringID=" + ringID + ", ringName=" + ringName + ", voucherID=" + voucherID + ", voucherName=" + voucherName + ", ringSize=" + ringSize + ", totalPrice=" + totalPrice + ", status=" + status + ", delivered=" + delivered + '}';
    }

    
}
