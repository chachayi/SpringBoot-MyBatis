package com.ssm.controller;

import com.ssm.model.Comment;
import com.ssm.model.ReplyComment;
import com.ssm.service.CommentService;
import com.ssm.service.ReplyCommentService;
import com.ssm.tool.CurrentTime;
import com.ssm.tool.SensitiveWordsFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    ReplyCommentService replyCommentService;

    //存入评论且实现异步更新
    @RequestMapping(value="/comment_data", produces = "application/json")
    @ResponseBody
    public Comment insertComment(@RequestBody Comment comment, Model model, HttpServletRequest request){
        comment.setCommentsTime(CurrentTime.getCurrentTime());
        comment.setCommentsContent(SensitiveWordsFilter.replace(comment.getCommentsContent()));
        comment.setCommentsNickname(SensitiveWordsFilter.replace(comment.getCommentsNickname()));
        addSession(request,comment);
        commentService.insert(comment);
        return comment;
        // return "redirect:/article/details/"+comment.getArticleId();
    }

    //存入回复评论
    @RequestMapping(value="/reply_comment_data", produces = "application/json")
    @ResponseBody
    public ReplyComment insertReplyComment(@RequestBody ReplyComment replycomment, HttpServletRequest request) {
        replycomment.setCommentsTime(CurrentTime.getCurrentTime());
        replycomment.setCommentsContent(SensitiveWordsFilter.replace(replycomment.getCommentsContent()));
        replycomment.setCommentsNickname(SensitiveWordsFilter.replace(replycomment.getCommentsNickname()));
        HttpSession session = request.getSession();
        session.setAttribute("userName",replycomment.getCommentsNickname());
        session.setAttribute("userEmail",replycomment.getCommentsEmail());
        replyCommentService.insert(replycomment);
        return replycomment;
    }


    public void addSession(HttpServletRequest request, Comment comment){
    HttpSession session = request.getSession();
    session.setAttribute("userName",comment.getCommentsNickname());
    session.setAttribute("userEmail",comment.getCommentsEmail());
    }
}
