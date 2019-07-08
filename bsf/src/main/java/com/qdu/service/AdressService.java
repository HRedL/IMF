package com.qdu.service;

import com.qdu.entity.Adress;
import com.qdu.entity.Repair;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/30
 */
public interface AdressService {

    List<Adress> queryAll();

    List<Adress> pageQueryAdress(Map<String, Object> map);


    Integer pageQueryCount(Map<String, Object> map);


    void addAdress(Adress adress);

    Boolean query4Validate(Adress adress);

    void updateAdress(Adress adress);

    void deleteAdress(Integer id);

    void deleteAdresses(Map<String, Object> map);

    Adress getById(Integer id);

    List<Adress> getAdressByCondition(Adress adress);

    Adress getByIdNoCampus(Integer id);
}
