package com.ssm.controller;

import com.ssm.model.Article;
import com.ssm.model.Comment;
import com.ssm.model.ReplyComment;
import com.ssm.service.ArticleService;
import com.ssm.service.CommentService;
import com.ssm.service.ReplyCommentService;
import com.ssm.tool.List_To_Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @Autowired
    ReplyCommentService replyCommentService;

    @RequestMapping("/all_articles/reading_time/{index}")
    public String selectAllNotes(Model model, @PathVariable int index){
        List<Article> articleList = articleService.selectAll(index);
        model.addAttribute("articleList",articleList);
        model.addAttribute("index",currentPage(index));
        return "article-list";
    }

    @RequestMapping("/all_articles/reading_quantity/{index}")
    public String selectAllNotesByCount(Model model, @PathVariable int index){
        List<Article> articleList = articleService.selectAllByCount(index);
        model.addAttribute("articleList",articleList);
        model.addAttribute("index",index);
        return "article-list";
    }

    @RequestMapping("/article_type/{category}")
    public String selectNotesByCategory(Model model, @PathVariable String category){
        List<Article> articleList = articleService.selectByCategory(category);
        model.addAttribute("articleList",articleList);
        return "article-list";
    }

    @RequestMapping("/time_articles/{time}")
    public String selectNotesByTime(Model model, @PathVariable String time){
        List<Article> articleList = articleService.selectByTime(time);
        model.addAttribute("articleList",articleList);
        return "article-list";
    }

    @RequestMapping("/required_articles")
    public String SearchNotes(Model model, String title){
        List<Article> articleList = articleService.searchNotes(title);
        model.addAttribute("articleList",articleList);
        return "life-notes";
    }

    @RequestMapping("/popular_articles")
    public void popularArticles(HttpSession httpSession){
        httpSession.setMaxInactiveInterval(36000);
        List<Article> articleList = articleService.popularArticles();
        httpSession.setAttribute("articleList",articleList);
    }

    @Autowired
    private RedisTemplate<String,Article> redisTemplate;

    //选取文章和评论内容
    @RequestMapping("/details/{id}")
    public String selectArticleById(Model model, @PathVariable int id, HttpSession httpSession){
        Article articleDetails;
        //重复访问不增加访问量
        if(httpSession.getAttribute("articleId"+id)==null) {
            httpSession.setAttribute("articleId" + id, "true");
        }
         articleDetails = (Article) redisTemplate.opsForValue().get("article_" + id);
        if(articleDetails == null) {
           articleDetails = articleService.articleDetails(id, httpSession);
            //缓存文章
            redisTemplate.opsForValue().set("article_"+id,articleDetails);
        }
        model.addAttribute("articleDetails", articleDetails);
        System.out.println((redisTemplate.opsForValue().get("article_"+id)));

        List<Comment> commentList =commentService.select(id);
        model.addAttribute("commentList",commentList);

        int[] array = getCommentId(commentList);
        if(array.length!=0) {
            List<ReplyComment> replyComments = replyCommentService.select(array);
            model.addAttribute("replyCommentList", List_To_Json.toJson(replyComments));
        }else  model.addAttribute("replyCommentList", "null");
        return "article-details";
    }

    //文章点赞
    @RequestMapping("/good/{articleId}")
    public void good(){

    }

    public HttpSession getSession(){
        //获取到ServletRequestAttributes 里面有
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        //获取到Request对象
        HttpServletRequest request = attrs.getRequest();
        //获取到Session对象
        HttpSession session = request.getSession();

        //获取到Response对象
        //HttpServletResponse response = attrs.getResponse();
        return session;
    }

    public int currentPage(int index){
        int currentPage = 1;
        if(index>=10){
            currentPage = 2;
        }
        return currentPage;
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
