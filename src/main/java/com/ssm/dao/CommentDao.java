package com.ssm.dao;

import com.ssm.model.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    void insert(@Param("comment") Comment comment);

    Comment selectByCommentsId(int commentsId);

    List<Comment> select(int articleId);
}
