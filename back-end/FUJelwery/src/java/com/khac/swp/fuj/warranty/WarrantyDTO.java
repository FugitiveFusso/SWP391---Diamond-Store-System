package com.khac.swp.fuj.warranty;

public class WarrantyDTO {

    public String orderCode;
    public int orderID;
    public int id;
    public String name;
    public String image;
    public int month;
    public String description;
    public String type;
    public String startdate;
    public String enddate;
    public String termsandconditions;
    public int ringID;
    public String ringName;
    public String status;
    public int totalWarranties;
    public int usedActiveWarranties;
    public int unusedActiveWarranties;
    public int extendedWarranties;
    public int manufacturerWarranties;
    public int limitedWarranties;
    public int lifetimeWarranties;
    public int retailerWarranties;
    public int avgWarrantyDurationMonths;
    public int activeWarranties;
    public int deletedWarranties;
    public double percentageUsedActive;
    public double percentageUnusedActive;
    public String earliestStartDate;
    public String latestStartDate;
    public String earliestEndDate;
    public String latestEndDate;
    public String percentageManufacturerWarranties;
    public String percentageExtendedWarranties;
    public String percentageLimitedWarranties;
    public String percentageLifetimeWarranties;
    public String percentageRetailerWarranties;
    public String unusedActiveWarrantyIds;

    public int getOrderID() {
        return orderID;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getRingName() {
        return ringName;
    }

    public void setRingName(String ringName) {
        this.ringName = ringName;
    }
    
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

    public int getTotalWarranties() {
        return totalWarranties;
    }

    public void setTotalWarranties(int totalWarranties) {
        this.totalWarranties = totalWarranties;
    }

    public int getUsedActiveWarranties() {
        return usedActiveWarranties;
    }

    public void setUsedActiveWarranties(int usedActiveWarranties) {
        this.usedActiveWarranties = usedActiveWarranties;
    }

    public int getUnusedActiveWarranties() {
        return unusedActiveWarranties;
    }

    public void setUnusedActiveWarranties(int unusedActiveWarranties) {
        this.unusedActiveWarranties = unusedActiveWarranties;
    }

    public int getExtendedWarranties() {
        return extendedWarranties;
    }

    public void setExtendedWarranties(int extendedWarranties) {
        this.extendedWarranties = extendedWarranties;
    }

    public int getManufacturerWarranties() {
        return manufacturerWarranties;
    }

    public void setManufacturerWarranties(int manufacturerWarranties) {
        this.manufacturerWarranties = manufacturerWarranties;
    }

    public int getLimitedWarranties() {
        return limitedWarranties;
    }

    public void setLimitedWarranties(int limitedWarranties) {
        this.limitedWarranties = limitedWarranties;
    }

    public int getLifetimeWarranties() {
        return lifetimeWarranties;
    }

    public void setLifetimeWarranties(int lifetimeWarranties) {
        this.lifetimeWarranties = lifetimeWarranties;
    }

    public int getRetailerWarranties() {
        return retailerWarranties;
    }

    public void setRetailerWarranties(int retailerWarranties) {
        this.retailerWarranties = retailerWarranties;
    }

    public int getAvgWarrantyDurationMonths() {
        return avgWarrantyDurationMonths;
    }

    public void setAvgWarrantyDurationMonths(int avgWarrantyDurationMonths) {
        this.avgWarrantyDurationMonths = avgWarrantyDurationMonths;
    }

    public int getActiveWarranties() {
        return activeWarranties;
    }

    public void setActiveWarranties(int activeWarranties) {
        this.activeWarranties = activeWarranties;
    }

    public int getDeletedWarranties() {
        return deletedWarranties;
    }

    public void setDeletedWarranties(int deletedWarranties) {
        this.deletedWarranties = deletedWarranties;
    }

    public double getPercentageUsedActive() {
        return percentageUsedActive;
    }

    public void setPercentageUsedActive(double percentageUsedActive) {
        this.percentageUsedActive = percentageUsedActive;
    }

    public double getPercentageUnusedActive() {
        return percentageUnusedActive;
    }

    public void setPercentageUnusedActive(double percentageUnusedActive) {
        this.percentageUnusedActive = percentageUnusedActive;
    }

    public String getEarliestStartDate() {
        return earliestStartDate;
    }

    public void setEarliestStartDate(String earliestStartDate) {
        this.earliestStartDate = earliestStartDate;
    }

    public String getLatestStartDate() {
        return latestStartDate;
    }

    public void setLatestStartDate(String latestStartDate) {
        this.latestStartDate = latestStartDate;
    }

    public String getEarliestEndDate() {
        return earliestEndDate;
    }

    public void setEarliestEndDate(String earliestEndDate) {
        this.earliestEndDate = earliestEndDate;
    }

    public String getLatestEndDate() {
        return latestEndDate;
    }

    public void setLatestEndDate(String latestEndDate) {
        this.latestEndDate = latestEndDate;
    }

    public String getPercentageManufacturerWarranties() {
        return percentageManufacturerWarranties;
    }

    public void setPercentageManufacturerWarranties(String percentageManufacturerWarranties) {
        this.percentageManufacturerWarranties = percentageManufacturerWarranties;
    }

    public String getPercentageExtendedWarranties() {
        return percentageExtendedWarranties;
    }

    public void setPercentageExtendedWarranties(String percentageExtendedWarranties) {
        this.percentageExtendedWarranties = percentageExtendedWarranties;
    }

    public String getPercentageLimitedWarranties() {
        return percentageLimitedWarranties;
    }

    public void setPercentageLimitedWarranties(String percentageLimitedWarranties) {
        this.percentageLimitedWarranties = percentageLimitedWarranties;
    }

    public String getPercentageLifetimeWarranties() {
        return percentageLifetimeWarranties;
    }

    public void setPercentageLifetimeWarranties(String percentageLifetimeWarranties) {
        this.percentageLifetimeWarranties = percentageLifetimeWarranties;
    }

    public String getPercentageRetailerWarranties() {
        return percentageRetailerWarranties;
    }

    public void setPercentageRetailerWarranties(String percentageRetailerWarranties) {
        this.percentageRetailerWarranties = percentageRetailerWarranties;
    }

    public String getUnusedActiveWarrantyIds() {
        return unusedActiveWarrantyIds;
    }

    public void setUnusedActiveWarrantyIds(String unusedActiveWarrantyIds) {
        this.unusedActiveWarrantyIds = unusedActiveWarrantyIds;
    }

    public int getRingID() {
        return ringID;
    }

    public void setRingID(int ringID) {
        this.ringID = ringID;
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "WarrantyDTO{" + "orderCode=" + orderCode + ", orderID=" + orderID + ", id=" + id + ", name=" + name + ", image=" + image + ", month=" + month + ", description=" + description + ", type=" + type + ", startdate=" + startdate + ", enddate=" + enddate + ", termsandconditions=" + termsandconditions + ", ringID=" + ringID + ", ringName=" + ringName + ", status=" + status + ", totalWarranties=" + totalWarranties + ", usedActiveWarranties=" + usedActiveWarranties + ", unusedActiveWarranties=" + unusedActiveWarranties + ", extendedWarranties=" + extendedWarranties + ", manufacturerWarranties=" + manufacturerWarranties + ", limitedWarranties=" + limitedWarranties + ", lifetimeWarranties=" + lifetimeWarranties + ", retailerWarranties=" + retailerWarranties + ", avgWarrantyDurationMonths=" + avgWarrantyDurationMonths + ", activeWarranties=" + activeWarranties + ", deletedWarranties=" + deletedWarranties + ", percentageUsedActive=" + percentageUsedActive + ", percentageUnusedActive=" + percentageUnusedActive + ", earliestStartDate=" + earliestStartDate + ", latestStartDate=" + latestStartDate + ", earliestEndDate=" + earliestEndDate + ", latestEndDate=" + latestEndDate + ", percentageManufacturerWarranties=" + percentageManufacturerWarranties + ", percentageExtendedWarranties=" + percentageExtendedWarranties + ", percentageLimitedWarranties=" + percentageLimitedWarranties + ", percentageLifetimeWarranties=" + percentageLifetimeWarranties + ", percentageRetailerWarranties=" + percentageRetailerWarranties + ", unusedActiveWarrantyIds=" + unusedActiveWarrantyIds + '}';
    }


}
