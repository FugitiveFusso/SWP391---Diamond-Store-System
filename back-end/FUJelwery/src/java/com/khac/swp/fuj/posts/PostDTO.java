package com.khac.swp.fuj.posts;

public class PostDTO {

    private int id;
    private String name;
    private String image;
    private String description;
    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "PostDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", description=" + description + ", text=" + text + '}';
    }
   
}
