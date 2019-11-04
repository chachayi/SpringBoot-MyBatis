package com.ssm.dao;

import com.ssm.model.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {

    List<Article> selectAll(int index);

    List<Article> selectAllByCount(int index);

    List<Article> selectByCategory(String category);

    List<Article> selectByTime(String time);

    List<Article> popularArticles();

    List<Article> searchNotes(String title);

    Article articleDetails(int articleId);

    void addCount(int articleId);
}
