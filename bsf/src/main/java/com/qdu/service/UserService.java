package com.qdu.service;

import com.qdu.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    List<User> queryAll();

    User query4Login(User user);

    List<User> pageQueryUser(Map<String, Object> map);


    Integer pageQueryCount(Map<String, Object> map);


    void addUser(User user);

    Boolean query4Validate(User user);

    void updateUser(User user);

    void deleteUser(Integer id);

    void deleteUsers(Map<String, Object> map);


    User getUserById(Integer id);

    User getUserByIdNoType(Integer id);

    List<User> pageQueryOnlyRepairman(Map<String, Object> map);

    Integer pageQueryCountOnlyRepairman(Map<String, Object> map);
}
