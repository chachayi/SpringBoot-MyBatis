package com.ssm.model;

import java.io.Serializable;
import java.sql.Date;

public class ReplyComment implements Serializable {
    private int commentsId;
    private int replyCommentsId;
    private int commentsType;
    private String commentsContent;
    private String commentsNickname;
    private String commentsEmail;
    private Date commentsTime;

    public Date getCommentsTime() {
        return commentsTime;
    }

    public void setCommentsTime(Date commentsTime) {
        this.commentsTime = commentsTime;
    }

    public String getCommentsNickname() {
        return commentsNickname;
    }

    public void setCommentsNickname(String commentsNickname) {
        this.commentsNickname = commentsNickname;
    }

    public String getCommentsEmail() {
        return commentsEmail;
    }

    public void setCommentsEmail(String commentsEmail) {
        this.commentsEmail = commentsEmail;
    }

    public int getCommentsId() {
        return commentsId;
    }

    public void setCommentsId(int commentsId) {
        this.commentsId = commentsId;
    }

    public String getCommentsContent() {
        return commentsContent;
    }

    public void setCommentsContent(String commentsContent) {
        this.commentsContent = commentsContent;
    }

    public int getReplyCommentsId() {
        return replyCommentsId;
    }

    public void setReplyCommentsId(int replyCommentsId) {
        this.replyCommentsId = replyCommentsId;
    }

    public int getCommentsType() {
        return commentsType;
    }

    public void setCommentsType(int commentsType) {
        this.commentsType = commentsType;
    }

}
