package com.ssm.service;

import com.ssm.model.Comment;

import java.util.List;

public interface CommentService {

    void insert(Comment comment);

    Comment selectByCommentsId(int commentsId);

    List<Comment> select(int articleId);
}
