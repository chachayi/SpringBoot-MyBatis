package com.ssm.service.impl;

import com.ssm.dao.ReplyCommentDao;
import com.ssm.model.ReplyComment;
import com.ssm.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
    public class ReplyCommentServiceImpl implements ReplyCommentService {

    @Autowired
    ReplyCommentDao replyCommentDao;

   public void insert(ReplyComment replycomment){
       replyCommentDao.insert(replycomment);
   }

   public List<ReplyComment> select(int[] commentId){
       return replyCommentDao.select(commentId);
   }

}
