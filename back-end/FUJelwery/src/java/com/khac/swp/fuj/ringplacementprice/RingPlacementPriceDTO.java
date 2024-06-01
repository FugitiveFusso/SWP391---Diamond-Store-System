/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ringplacementprice;

/**
 *
 * @author phucu
 */
public class RingPlacementPriceDTO {
    public int id;
    public String name;
    public String material;
    public String color;
    public int price;

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

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "RingPlacementPriceDTO{" + "id=" + id + ", name=" + name + ", material=" + material + ", color=" + color + ", price=" + price + '}';
    }
    
    
    
}
