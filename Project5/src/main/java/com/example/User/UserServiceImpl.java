package com.example.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {


    @Autowired
    UserDAO userDao;

    public UserVO getUser(UserVO vo) {
        return userDao.getUser(vo);
    }

    public int insertUser(UserVO vo) {
        return userDao.insertUser(vo);
    }
}
