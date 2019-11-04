package com.ssm.service;

import com.ssm.model.Article;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ArticleService {

    List<Article> selectAll(int index);

    List<Article> selectAllByCount(int index);

    List<Article> selectByCategory(String category);

    List<Article> selectByTime(String time);

    List<Article> popularArticles();

    List<Article> searchNotes(String title);

    Article articleDetails(int articleId, HttpSession httpSession);

    void addCount(int articleId);

}
