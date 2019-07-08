package com.qdu.service;

import com.qdu.entity.Dict;

import java.util.List;

/**
 * @Author huahonglei
 * @Version 2019/6/30
 */
public interface DictService {


    Dict get(int id);


    List<Dict> findAllList();


    int delete(int id);


    int insert(Dict entity);


    int update(Dict entity);

    List<Dict> getDictsByCondition(String type);

    Dict getDictByTypeAndValue(String type,String value);

    List<Dict> getDictsByType(String type);

    List<Dict> getDictsByTypeAndParent(String type, String ptype,String p);
}
