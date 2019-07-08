package com.qdu.service;


import com.qdu.dao.DictDao;
import com.qdu.entity.Dict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 字典Service
 * @Author mqy
 * @Version 2018/11/6
 */
@Service
public class DictServiceImpl implements DictService{

   @Autowired
   DictDao dictDao;


    public Dict get(int id) {
        return dictDao.get(id);
    }


    public List<Dict> findAllList() {
        return dictDao.findAllList();
    }


    public int delete(int id) {
        return dictDao.delete(id);
    }


    public int insert(Dict entity) {
        return dictDao.insert(entity);
    }


    public int update(Dict entity) {
        return dictDao.update(entity);
    }

    public List<Dict> getDictsByCondition(String type) {
        return dictDao.getDictsByCondition(type);
    }

    public Dict getDictByTypeAndValue(String type, String value) {
        return dictDao.getDictByTypeAndValue(type,value);
    }

    public List<Dict> getDictsByType(String type){
        return dictDao.getDictsByType(type);
    }

    public List<Dict> getDictsByTypeAndParent(String type, String ptype,String pavalue) {

        return dictDao.getDictsByTypeAndParent(type,ptype,pavalue);
    }
}
