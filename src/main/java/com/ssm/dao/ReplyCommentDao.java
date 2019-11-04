package com.ssm.dao;

import com.ssm.model.ReplyComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyCommentDao {
    void insert(@Param("replyComment") ReplyComment replyComment);

    List<ReplyComment> select(int[] commentId);
}
