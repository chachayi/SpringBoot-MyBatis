package com.ssm.service.impl;

import com.ssm.dao.ArticleDao;
import com.ssm.model.Article;
import com.ssm.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleDao articleDao;

    public List<Article> selectAll(int index) {
        return  articleDao.selectAll(index);
    }

    public List<Article> selectByCategory(String category) {
        return articleDao.selectByCategory(category);
    }

    public List<Article> selectByTime(String time) {
        return articleDao.selectByTime(time);
    }

    public List<Article>  popularArticles() {
        return articleDao.popularArticles();
    }


    public List<Article> searchNotes(String title) {
        return articleDao.searchNotes(title);
    }

    public Article articleDetails(int articleId, HttpSession httpSession){
       if(httpSession.getAttribute("articleId"+articleId)=="true"){
           articleDao.addCount(articleId);
           httpSession.setAttribute("articleId"+articleId,"false");
           System.out.println("增加访问量ok");
       }
        return  articleDao.articleDetails(articleId);
    }

    public List<Article> selectAllByCount(int index){
        return articleDao.selectAllByCount(index);
    }

    public void addCount(int articleId){
        articleDao.addCount(articleId);
    }
}
