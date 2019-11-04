package com.ssm.controller;

import com.ssm.model.Article;
import com.ssm.model.Comment;
import com.ssm.model.ReplyComment;
import com.ssm.service.ArticleService;
import com.ssm.service.CommentService;
import com.ssm.service.ReplyCommentService;
import com.ssm.tool.List_To_Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ShouyeController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @Autowired
    ReplyCommentService replyCommentService;

    @RequestMapping("/myself")
    public String aboutMyself(){
        return "aboutMyself";
    }

    @RequestMapping("/resources")
    public String download(){
        return "download";
    }
    @RequestMapping("/leave_message")
    public String leaveMessage(Model model){
        List<Comment> commentList =commentService.select(20);
        model.addAttribute("leave_message_commentList",commentList);

        int[] array = getCommentId(commentList);
        if(array.length!=0) {
            List<ReplyComment> replyComments = replyCommentService.select(array);
            model.addAttribute("replyCommentList", List_To_Json.toJson(replyComments));
        }else  model.addAttribute("replyCommentList", "null");
        return "leaveMessage";
    }

    @RequestMapping("/life_notes")
    public String lifeNotes(Model model){
        List<Article> articleList = articleService.selectByCategory("Life");
        model.addAttribute("articleList",articleList);
        return "life-notes";
    }

    @RequestMapping("/shouye")
    public String shouye(Model model){
        List<Article> articleList1 = articleService.selectAll(0);
        model.addAttribute("articleList1",articleList1);

        List<Article> articleList2 = articleService.selectAllByCount(0);
        model.addAttribute("articleList2",articleList2);
        return "shouye";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/jieshao")
    public String jieshao(){
        return "jieshao";
    }

    //根据commentId查出ReplyCommentId
    public int[] getCommentId(List<Comment> commentList){
        int[] commentIdArray = new int[commentList.size()];
        for (int i = 0;i<commentList.size();i++){
            commentIdArray[i] = commentList.get(i).getCommentsId();
        }
        return commentIdArray;
    }
}
