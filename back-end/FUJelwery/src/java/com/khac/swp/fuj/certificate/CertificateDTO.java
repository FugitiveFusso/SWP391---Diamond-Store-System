package com.khac.swp.fuj.certificate;

public class CertificateDTO {

    private String diamondName;
    private int certificateID;
    private String certificateImage;
    private String certificateDescription;
    private int diamondID;
    private String status;
    private int totalCertificates;
    private int activeCertificates;
    private int deletedCertificates;
    private int usedCertificates;
    private int unusedCertificates;
    private double usedPercentage;
    private double unusedPercentage;

    public String getDiamondName() {
        return diamondName;
    }

    public void setDiamondName(String diamondName) {
        this.diamondName = diamondName;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public String getCertificateImage() {
        return certificateImage;
    }

    public void setCertificateImage(String certificateImage) {
        this.certificateImage = certificateImage;
    }

    public String getCertificateDescription() {
        return certificateDescription;
    }

    public void setCertificateDescription(String certificateDescription) {
        this.certificateDescription = certificateDescription;
    }

    public int getTotalCertificates() {
        return totalCertificates;
    }

    public void setTotalCertificates(int totalCertificates) {
        this.totalCertificates = totalCertificates;
    }

    public int getActiveCertificates() {
        return activeCertificates;
    }

    public void setActiveCertificates(int activeCertificates) {
        this.activeCertificates = activeCertificates;
    }

    public int getDeletedCertificates() {
        return deletedCertificates;
    }

    public void setDeletedCertificates(int deletedCertificates) {
        this.deletedCertificates = deletedCertificates;
    }

    public int getUsedCertificates() {
        return usedCertificates;
    }

    public void setUsedCertificates(int usedCertificates) {
        this.usedCertificates = usedCertificates;
    }

    public int getUnusedCertificates() {
        return unusedCertificates;
    }

    public void setUnusedCertificates(int unusedCertificates) {
        this.unusedCertificates = unusedCertificates;
    }

    public double getUsedPercentage() {
        return usedPercentage;
    }

    public void setUsedPercentage(double usedPercentage) {
        this.usedPercentage = usedPercentage;
    }

    public double getUnusedPercentage() {
        return unusedPercentage;
    }

    public void setUnusedPercentage(double unusedPercentage) {
        this.unusedPercentage = unusedPercentage;
    }

    public int getDiamondID() {
        return diamondID;
    }

    public void setDiamondID(int diamondID) {
        this.diamondID = diamondID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CertificateDTO{" + "diamondName=" + diamondName + ", certificateID=" + certificateID + ", certificateImage=" + certificateImage + ", certificateDescription=" + certificateDescription + ", diamondID=" + diamondID + ", status=" + status + ", totalCertificates=" + totalCertificates + ", activeCertificates=" + activeCertificates + ", deletedCertificates=" + deletedCertificates + ", usedCertificates=" + usedCertificates + ", unusedCertificates=" + unusedCertificates + ", usedPercentage=" + usedPercentage + ", unusedPercentage=" + unusedPercentage + '}';
    }

}
