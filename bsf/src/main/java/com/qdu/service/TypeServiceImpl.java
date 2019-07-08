package com.qdu.service;

import com.qdu.dao.TypeDao;
import com.qdu.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/7/1
 */
@Service
public class TypeServiceImpl implements TypeService {


    @Autowired
    TypeDao typeDao;

    public List<Type> queryAll(){

        return typeDao.queryAll();
    }

    public List<Type> pageQueryType(Map<String, Object> map) {
        return typeDao.pageQueryType(map);
    }

    public Integer pageQueryCount(Map<String,Object> map) {
        return typeDao.pageQueryCount(map);
    }



    public void addType(Type type){
        typeDao.addType(type);
    }


    public Boolean query4Validate(Type type) {
        Integer num=typeDao.query4Validate(type);
        if(num==0){
            return true;
        }else{
            return false;
        }
    }

    public void updateType(Type type){
        typeDao.updateType(type);
    }

    public void deleteType(Integer id){
        typeDao.deleteType(id);
    }

    public void deleteTypes(Map<String, Object> map) {
        typeDao.deleteTypes(map);
    }

    public Type getById(Integer id) {
        return typeDao.getById(id);
    }

    public List<Type> getAllType() {
        return typeDao.getAllType();
    }
}
