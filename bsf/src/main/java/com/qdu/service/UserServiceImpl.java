package com.qdu.service;

import com.qdu.dao.DictDao;
import com.qdu.dao.UserDao;
import com.qdu.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    UserDao userDao;


    @Autowired
    DictDao dictDao;

    public List<User> queryAll(){

        return userDao.queryAll();
    }

    public User query4Login(User user){

        return userDao.query4Login(user);
    }

    public List<User> pageQueryUser(Map<String, Object> map) {
        List<User> users=userDao.pageQueryUser(map);

        return users;
    }

    public Integer pageQueryCount(Map<String,Object> map) {
        return userDao.pageQueryCount(map);
    }


    public void addUser(User user){
        userDao.addUser(user);
    }


    public Boolean query4Validate(User user) {
        Integer num=userDao.query4Validate(user);
        if(num==0){
            return true;
        }else{
            return false;
        }
    }

    public void updateUser(User user){
        userDao.updateUser(user);
    }

    public void deleteUser(Integer id){
        userDao.deleteUser(id);

    }

    public void deleteUsers(Map<String, Object> map) {
        userDao.deleteUsers(map);
    }

    public User getUserById(Integer id) {
        User user=userDao.getById(id);

        user.setType(dictDao.getDictByTypeAndValue("userType",user.getType()).getLabel());
        return user;
    }

    public User getUserByIdNoType(Integer id) {
        return userDao.getById(id);
    }

    public List<User> pageQueryOnlyRepairman(Map<String, Object> map) {
        return userDao.pageQueryOnlyRepairman(map);
    }

    public Integer pageQueryCountOnlyRepairman(Map<String, Object> map) {
        return userDao.pageQueryCountOnlyRepairman(map);
    }


}
