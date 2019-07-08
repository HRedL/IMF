package com.qdu.service;

import com.qdu.dao.AdressDao;
import com.qdu.dao.DictDao;
import com.qdu.entity.Adress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/30
 */
@Service
public class AdressServiceImpl implements AdressService {

    @Autowired
    AdressDao adressDao;

    @Autowired
    DictDao dictDao;

    public List<Adress> queryAll(){

        return adressDao.queryAll();
    }


    public List<Adress> pageQueryAdress(Map<String, Object> map) {
        List<Adress> adresses=adressDao.pageQueryAdress(map);
        for(Adress adress:adresses){

            adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
            adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
        }
        return adresses;
    }

    public Integer pageQueryCount(Map<String,Object> map) {
        return adressDao.pageQueryCount(map);
    }




    public void addAdress(Adress adress){
        adressDao.addAdress(adress);
    }


    public Boolean query4Validate(Adress adress) {
        Integer num=adressDao.query4Validate(adress);
        if(num==0){
            return true;
        }else{
            return false;
        }
    }

    public void updateAdress(Adress adress){
        adressDao.updateAdress(adress);
    }

    public void deleteAdress(Integer id){
        adressDao.deleteAdress(id);

    }


    public void deleteAdresses(Map<String, Object> map) {
        adressDao.deleteAdresses(map);
    }

    public Adress getById(Integer id) {
        Adress adress=adressDao.getById(id);
        adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
        adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
        return adress;
    }

    public List<Adress> getAdressByCondition(Adress adress) {
        return adressDao.getAdressByCondition(adress);
    }

    public Adress getByIdNoCampus(Integer id) {
        return adressDao.getById(id);
    }


}
