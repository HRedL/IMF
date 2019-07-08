package com.qdu.service;

import com.qdu.entity.Repair;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
public interface RepairService {

    List<Repair> queryAll();

    List<Repair> pageQueryRepair(Map<String, Object> map);

    List<Repair> pageQueryRepair2(Map<String, Object> map);


    Integer pageQueryCount(Map<String, Object> map);


    void addRepair(Repair repair);

    Boolean query4Validate(Repair repair);

    void updateRepair(Repair repair);

    void deleteRepair(Integer id);

    void deleteRepairs(Map<String, Object> map);

    Repair getById(Integer id);

    Repair getByIdNoAdress(Integer id);

    void updateHasRepairType(Repair repair);

    Integer pageQueryCount2(Map<String, Object> map);

    List<Repair> queryRepairByRepaimanId(int id);

    void updateRepairSetRepairman(Map<String, Object> map);

    List<Repair> pageQueryRepair3(Map<String, Object> map);

    Integer pageQueryCount3(Map<String, Object> map);
}
