/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.users;

/**
 *
 * @author Dell
 */
public class UserGoogleDTO {
    private String id;
    private String email;
    private String name;
    private String givenName;
    private String familyName;
    private String picture;
    private boolean verfiedEmail;

    public UserGoogleDTO() {
    }

    public UserGoogleDTO(String id, String email, String name, String givenName, String familyName, String picture, boolean verfiedEmail) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.givenName = givenName;
        this.familyName = familyName;
        this.picture = picture;
        this.verfiedEmail = verfiedEmail;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public boolean isVerfiedEmail() {
        return verfiedEmail;
    }

    public void setVerfiedEmail(boolean verfiedEmail) {
        this.verfiedEmail = verfiedEmail;
    }

    @Override
    public String toString() {
        return "UserGoogleDTO{" + "id=" + id + ", email=" + email + ", name=" + name + ", givenName=" + givenName + ", familyName=" + familyName + ", picture=" + picture + ", verfiedEmail=" + verfiedEmail + '}';
    }
}
