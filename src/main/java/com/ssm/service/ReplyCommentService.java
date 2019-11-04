package com.ssm.service;

import com.ssm.model.ReplyComment;

import java.util.List;

public interface ReplyCommentService {

    void insert(ReplyComment replyComment);

    List<ReplyComment> select(int[] commentId);

}
