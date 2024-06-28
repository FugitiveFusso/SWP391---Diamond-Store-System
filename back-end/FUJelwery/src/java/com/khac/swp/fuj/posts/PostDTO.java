package com.khac.swp.fuj.posts;

public class PostDTO {

    private int id;
    private String name;
    private String image;
    private String date;
    private String author;
    private String description;
    private String text;
    private int totalNumberOfActivePosts;
    private int totalNumberOfAuthors;
    private int totalNumberOfPostDays;
    private String earliestPostDate;
    private String latestPostDate;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    
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

    public int getTotalNumberOfActivePosts() {
        return totalNumberOfActivePosts;
    }

    public void setTotalNumberOfActivePosts(int totalNumberOfActivePosts) {
        this.totalNumberOfActivePosts = totalNumberOfActivePosts;
    }

    public int getTotalNumberOfAuthors() {
        return totalNumberOfAuthors;
    }

    public void setTotalNumberOfAuthors(int totalNumberOfAuthors) {
        this.totalNumberOfAuthors = totalNumberOfAuthors;
    }

    public int getTotalNumberOfPostDays() {
        return totalNumberOfPostDays;
    }

    public void setTotalNumberOfPostDays(int totalNumberOfPostDays) {
        this.totalNumberOfPostDays = totalNumberOfPostDays;
    }

    public String getEarliestPostDate() {
        return earliestPostDate;
    }

    public void setEarliestPostDate(String earliestPostDate) {
        this.earliestPostDate = earliestPostDate;
    }

    public String getLatestPostDate() {
        return latestPostDate;
    }

    public void setLatestPostDate(String latestPostDate) {
        this.latestPostDate = latestPostDate;
    }

    @Override
    public String toString() {
        return "PostDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", date=" + date + ", author=" + author + ", description=" + description + ", text=" + text + ", totalNumberOfActivePosts=" + totalNumberOfActivePosts + ", totalNumberOfAuthors=" + totalNumberOfAuthors + ", totalNumberOfPostDays=" + totalNumberOfPostDays + ", earliestPostDate=" + earliestPostDate + ", latestPostDate=" + latestPostDate + '}';
    }

    
   
}
