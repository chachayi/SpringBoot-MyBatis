package com.ssm.dao;

import com.ssm.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    User login(String username);

    void registerByUsernameAndPassword(User user);
}

