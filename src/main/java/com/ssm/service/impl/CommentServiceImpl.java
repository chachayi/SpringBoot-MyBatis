package com.ssm.service.impl;

import com.ssm.dao.CommentDao;
import com.ssm.model.Comment;
import com.ssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;

    public Comment selectByCommentsId(int commentsId) {
        return commentDao.selectByCommentsId(commentsId);
    }

    public void insert(Comment comment){
           commentDao.insert(comment);
   }

    public List<Comment> select(int articleId){
      return commentDao.select(articleId);
    }
}
