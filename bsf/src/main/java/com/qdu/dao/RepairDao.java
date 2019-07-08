package com.qdu.dao;

import com.qdu.entity.Repair;
import com.qdu.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
public interface RepairDao {


    @Select("select * from repair")
    List<Repair> queryAll();

    List<Repair> pageQueryRepair(Map<String, Object> map);


    Integer pageQueryCount(Map<String, Object> map);


    void addRepair(Repair repair);

    Integer query4Validate(Repair repair);

    void updateRepair(Repair repair);

    void deleteRepair(Integer id);

    void deleteRepairs(Map<String, Object> map);

    Repair getById(Integer id);

    void updateHasRepairType(Repair repair);

    List<Repair> pageQueryRepair2(Map<String, Object> map);

    Integer pageQueryCount2(Map<String, Object> map);

    List<Repair> queryRepairByRepaimanId(int id);

    void updateRepairRepairman(Repair repair);

    List<Repair> pageQueryRepair3(Map<String, Object> map);

    Integer pageQueryCount3(Map<String, Object> map);
}
