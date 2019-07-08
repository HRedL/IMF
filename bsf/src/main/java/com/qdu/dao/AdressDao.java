package com.qdu.dao;

import com.qdu.entity.Adress;
import com.qdu.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
public interface AdressDao {

    @Select("select * from adress")
    List<Adress> queryAll();


    public List<Adress> pageQueryAdress(Map<String, Object> map);


    public Integer pageQueryCount(Map<String, Object> map);


    public void addAdress(Adress adress);

    public Integer query4Validate(Adress adress);

    public void updateAdress(Adress adress);

    public void deleteAdress(Integer id);

    public void deleteAdresses(Map<String, Object> map);

    Adress getById(Integer id);

    List<Adress> getAdressByCondition(Adress adress);
}
