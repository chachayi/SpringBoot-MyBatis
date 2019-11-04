package com.ssm.model;


import java.io.Serializable;
import java.sql.Date;

public class Article implements Serializable {
    private String articleContent;
    private String articleTitle;
    private int articleId;
    private String articleCategory;
    private int articleCount;
    private Date articleTime;
    private int articleNumber;

    public int getArticleNumber() {
        return articleNumber;
    }

    public void setArticleNumber(int articleNumber) {
        this.articleNumber = articleNumber;
    }

    public int getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(int articleCount) {
        this.articleCount = articleCount;
    }

    public Date getArticleTime() {
        return articleTime;
    }

    public void setArticleTime(Date articleTime) {
        this.articleTime = articleTime;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getArticleCategory() {
        return articleCategory;
    }

    public void setArticleCategory(String articleCategory) {
        this.articleCategory = articleCategory;
    }
}
