package com.qdu.service;

import com.qdu.entity.Repair;
import com.qdu.entity.Type;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/7/1
 */
public interface TypeService {

    List<Type> queryAll();

    List<Type> pageQueryType(Map<String, Object> map);


    Integer pageQueryCount(Map<String, Object> map);


    void addType(Type type);

    Boolean query4Validate(Type type);

    void updateType(Type type );

    void deleteType(Integer id);

    void deleteTypes(Map<String, Object> map);

    Type getById(Integer id);

    List<Type> getAllType();
}
