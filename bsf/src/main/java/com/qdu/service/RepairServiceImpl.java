package com.qdu.service;

import com.qdu.dao.DictDao;
import com.qdu.dao.RepairDao;
import com.qdu.dao.UserDao;
import com.qdu.entity.Adress;
import com.qdu.entity.Repair;
import com.qdu.entity.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
@Service
public class RepairServiceImpl implements RepairService {

    @Autowired
    RepairDao repairDao;

    @Autowired
    DictDao dictDao;

    @Autowired
    UserDao userDao;

    @Autowired
    AdressService adressService;

    public List<Repair> queryAll(){

        return repairDao.queryAll();
    }


    public List<Repair> pageQueryRepair(Map<String, Object> map) {
        List<Repair> repairs= repairDao.pageQueryRepair(map);
        for(Repair repair:repairs){
            Adress adress=new Adress();
            BeanUtils.copyProperties(repair.getAdress(),adress);
            adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
            adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
            repair.setAdress(adress);
            repair.setHasRepair(dictDao.getDictByTypeAndValue("hasRepair",repair.getHasRepair()).getLabel());
        }
        return repairs;
    }


    public List<Repair> pageQueryRepair2(Map<String, Object> map) {
        List<Repair> repairs= repairDao.pageQueryRepair2(map);
        for(Repair repair:repairs){
            Adress adress=new Adress();
            BeanUtils.copyProperties(repair.getAdress(),adress);
            adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
            adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
            repair.setAdress(adress);
        }
        return repairs;
    }

    public Integer pageQueryCount(Map<String,Object> map) {
        return repairDao.pageQueryCount(map);
    }


    public Integer pageQueryCount2(Map<String,Object> map) {
        return repairDao.pageQueryCount2(map);

    }

    public List<Repair> queryRepairByRepaimanId(int id) {

        List<Repair> repairs= repairDao.queryRepairByRepaimanId(id);
        for(Repair repair:repairs){
            Adress adress=new Adress();
            BeanUtils.copyProperties(repair.getAdress(),adress);
            adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
            adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
            repair.setAdress(adress);
        }
        return repairs;
    }

    public void updateRepairSetRepairman(Map<String, Object> map) {
        Integer userId= (Integer) map.get("userId");
        Integer[] repaidIds= (Integer[]) map.get("repairIds");
        String hasRepair=(String) map.get("hasRepair");
        for(Integer id:repaidIds){
            Repair repair=new Repair();
            repair.setId(id);
            User user=new User();
            user.setId(userId);
            repair.setRepairman(user);
            repair.setHasRepair(hasRepair);

            repairDao.updateRepairRepairman(repair);
        }

    }

    public List<Repair> pageQueryRepair3(Map<String, Object> map) {
        List<Repair> repairs= repairDao.pageQueryRepair3(map);
        for(Repair repair:repairs){
            Adress adress=new Adress();
            BeanUtils.copyProperties(repair.getAdress(),adress);
            adress.setCampus(dictDao.getDictByTypeAndValue("CAMPUS",adress.getCampus()).getLabel());
            adress.setType(dictDao.getDictByTypeAndValue("BNUM",adress.getType()).getLabel());
            repair.setAdress(adress);
            repair.setHasRepair(dictDao.getDictByTypeAndValue("hasRepair",repair.getHasRepair()).getLabel());
        }
        return repairs;
    }

    public Integer pageQueryCount3(Map<String, Object> map) {
        return repairDao.pageQueryCount3(map);
    }


    public void addRepair(Repair repair){
        repairDao.addRepair(repair);
    }


    public Boolean query4Validate(Repair repair) {
        Integer num=repairDao.query4Validate(repair);
        if(num==0){
            return true;
        }else{
            return false;
        }
    }

    public void updateRepair(Repair repair){
        repairDao.updateRepair(repair);
    }

    public void deleteRepair(Integer id){
        repairDao.deleteRepair(id);

    }


    public void deleteRepairs(Map<String, Object> map) {
        repairDao.deleteRepairs(map);
    }

    public Repair getById(Integer id) {
        Repair repair= repairDao.getById(id);
        repair.setAdress(adressService.getById(repair.getAdress().getId()));
        repair.setHasRepair(dictDao.getDictByTypeAndValue("hasRepair",repair.getHasRepair()).getLabel());
        if(repair.getRepairman().getId()!=-1){
            repair.setRepairman(userDao.getById(repair.getRepairman().getId()));
        }else{
            User user=new User();
            user.setUsername("暂无");
            user.setPhone("暂无");
            user.setEmail("暂无");
            repair.setRepairman(user);
        }

        return repair;
    }

    public Repair getByIdNoAdress(Integer id){
        return repairDao.getById(id);
    }

    public void updateHasRepairType(Repair repair) {
        repairDao.updateHasRepairType(repair);
    }

}
