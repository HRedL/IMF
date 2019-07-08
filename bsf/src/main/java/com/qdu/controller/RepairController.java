package com.qdu.controller;

import com.qdu.dao.RepairDao;
import com.qdu.entity.*;
import com.qdu.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
@Controller
@RequestMapping("/repair")
public class RepairController {

    @Autowired
    RepairService repairService;


    @ResponseBody
    @RequestMapping("doAssign")
    public AJAXResult doAssign(Integer id,Integer[] unassignRoleIds){
        AJAXResult result=new AJAXResult();


        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("userId",id);
            map.put("repairIds",unassignRoleIds);
            map.put("hasRepair","1");

            repairService.updateRepairSetRepairman(map);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    @ResponseBody
    @RequestMapping("doUnassign")
    public AJAXResult doUnassign(Integer id,Integer[] assignRoleIds){
        AJAXResult result=new AJAXResult();

        try{
            Map<String,Object> map=new HashMap<String, Object>();

            map.put("userId",-1);
            map.put("repairIds",assignRoleIds);
            map.put("hasRepair","2");
            repairService.updateRepairSetRepairman(map);

            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }




    @ResponseBody
    @RequestMapping("query4AssignRepair")
    public AJAXResult query4AssignRepair(Integer userId){
        AJAXResult result=new AJAXResult();
        try{

            List<Repair> unassignedRepairs=repairService.queryRepairByRepaimanId(-1);

            List<Repair> assignedRepairs=repairService.queryRepairByRepaimanId(userId);

            Map<String,Object> map=new HashMap<String, Object>();
            map.put("unassignedRepairs",unassignedRepairs);
            map.put("assignedRepairs",assignedRepairs);
            result.setData(map);
            result.setSuccess(true);
        }catch(Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    //分页查询
    @ResponseBody
    @RequestMapping("pageQuery")
    public AJAXResult pageQuery(Integer pageNumber, Integer pageSize, String queryText){

        AJAXResult result=new AJAXResult();

        try{

            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);

            List<Repair> repairs= repairService.pageQueryRepair(map);
            //当前的数据条数
            int totalSize=repairService.pageQueryCount(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<Repair> userPage=new Page<Repair>();
            userPage.setDatas(repairs);
            userPage.setTotalNumber(totalNumber);
            userPage.setTotalSize(totalSize);
            userPage.setPageNumber(pageNumber);
            if(totalNumber==1||totalNumber==0){
                userPage.setShowNumber(Arrays.asList(1));
            }else if(totalNumber==2){
                userPage.setShowNumber(Arrays.asList(1,2));
            }else if(totalNumber==3){
                userPage.setShowNumber(Arrays.asList(1,2,3));
            }else if(totalNumber==4){
                userPage.setShowNumber(Arrays.asList(1,2,3,4));
            }else if(pageNumber<=3){
                userPage.setShowNumber(Arrays.asList(1,2,3,4,5));
            }else if(pageNumber+3>totalNumber){
                List<Integer> list=new ArrayList<Integer>();
                list.add(totalNumber-4);
                list.add(totalNumber-3);
                list.add(totalNumber-2);
                list.add(totalNumber-1);
                list.add(totalNumber);
                userPage.setShowNumber(list);
            }else{
                List<Integer> list=new ArrayList<Integer>();
                list.add(pageNumber-2);
                list.add(pageNumber-1);
                list.add(pageNumber);
                list.add(pageNumber+1);
                list.add(pageNumber+2);
                userPage.setShowNumber(list);
            }
            result.setData(userPage);
            result.setSuccess(true);


        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    /**
     * 为维修人员写的分页查询
     * @param pageNumber
     * @param pageSize
     * @param userId
     * @param queryText
     * @return
     */
    @ResponseBody
    @RequestMapping("pageQuery2")
    public AJAXResult pageQuery2(Integer pageNumber, Integer pageSize,Integer userId, String queryText){

        AJAXResult result=new AJAXResult();

        try{

            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);
            map.put("userId",userId);

            List<Repair> repairs= repairService.pageQueryRepair2(map);
            //当前的数据条数
            int totalSize=repairService.pageQueryCount2(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<Repair> userPage=new Page<Repair>();
            userPage.setDatas(repairs);
            userPage.setTotalNumber(totalNumber);
            userPage.setTotalSize(totalSize);
            userPage.setPageNumber(pageNumber);
            if(totalNumber==1||totalNumber==0){
                userPage.setShowNumber(Arrays.asList(1));
            }else if(totalNumber==2){
                userPage.setShowNumber(Arrays.asList(1,2));
            }else if(totalNumber==3){
                userPage.setShowNumber(Arrays.asList(1,2,3));
            }else if(totalNumber==4){
                userPage.setShowNumber(Arrays.asList(1,2,3,4));
            }else if(pageNumber<=3){
                userPage.setShowNumber(Arrays.asList(1,2,3,4,5));
            }else if(pageNumber+3>totalNumber){
                List<Integer> list=new ArrayList<Integer>();
                list.add(totalNumber-4);
                list.add(totalNumber-3);
                list.add(totalNumber-2);
                list.add(totalNumber-1);
                list.add(totalNumber);
                userPage.setShowNumber(list);
            }else{
                List<Integer> list=new ArrayList<Integer>();
                list.add(pageNumber-2);
                list.add(pageNumber-1);
                list.add(pageNumber);
                list.add(pageNumber+1);
                list.add(pageNumber+2);
                userPage.setShowNumber(list);
            }
            result.setData(userPage);
            result.setSuccess(true);


        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    /**
     * 为普通用户写的分页查询
     * @param pageNumber
     * @param pageSize
     * @param userId
     * @param queryText
     * @return
     */
    @ResponseBody
    @RequestMapping("pageQuery3")
    public AJAXResult pageQuery3(Integer pageNumber, Integer pageSize,Integer userId, String queryText){

        AJAXResult result=new AJAXResult();

        try{
            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);
            map.put("userId",userId);

            List<Repair> repairs= repairService.pageQueryRepair3(map);
            //当前的数据条数
            int totalSize=repairService.pageQueryCount3(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<Repair> userPage=new Page<Repair>();
            userPage.setDatas(repairs);
            userPage.setTotalNumber(totalNumber);
            userPage.setTotalSize(totalSize);
            userPage.setPageNumber(pageNumber);

            if(totalNumber==1||totalNumber==0){
                userPage.setShowNumber(Arrays.asList(1));
            }else if(totalNumber==2){
                userPage.setShowNumber(Arrays.asList(1,2));
            }else if(totalNumber==3){
                userPage.setShowNumber(Arrays.asList(1,2,3));
            }else if(totalNumber==4){
                userPage.setShowNumber(Arrays.asList(1,2,3,4));
            }else if(pageNumber<=3){
                userPage.setShowNumber(Arrays.asList(1,2,3,4,5));
            }else if(pageNumber+3>totalNumber){
                List<Integer> list=new ArrayList<Integer>();
                list.add(totalNumber-4);
                list.add(totalNumber-3);
                list.add(totalNumber-2);
                list.add(totalNumber-1);
                list.add(totalNumber);
                userPage.setShowNumber(list);
            }else{
                List<Integer> list=new ArrayList<Integer>();
                list.add(pageNumber-2);
                list.add(pageNumber-1);
                list.add(pageNumber);
                list.add(pageNumber+1);
                list.add(pageNumber+2);
                userPage.setShowNumber(list);
            }
            result.setData(userPage);
            result.setSuccess(true);


        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    @ResponseBody
    @PostMapping("deleteRepairs")
    public AJAXResult deleteRepairs(Integer[] repairid){
        AJAXResult result=new AJAXResult();
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("repairIds",repairid);
            repairService.deleteRepairs(map);

            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }
        return result;
    }



    @ResponseBody
    @PostMapping("deleteRepair")
    public AJAXResult deleteUser(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            repairService.deleteRepair(id);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @PostMapping("updateRepair")
    public AJAXResult updateUser(Integer id,Integer adressId,String detailInf,Integer userId,Integer typeId){
        AJAXResult ajaxResult=new AJAXResult();
        Repair repair=new Repair();
        repair.setId(id);
        Adress adress=new Adress();
        adress.setId(adressId);
        repair.setAdress(adress);
        repair.setDetailInf(detailInf);
        User user=new User();
        user.setId(userId);
        repair.setUser(user);
        Type type=new Type();
        type.setId(typeId);
        repair.setType(type);

        repairService.updateRepair(repair);

        ajaxResult.setSuccess(true);
        return ajaxResult;
    }


    //维修工修改状态
    @ResponseBody
    @PostMapping("updateHasRepairType")
    public AJAXResult updateHasRepairType(Repair repair){
        AJAXResult ajaxResult=new AJAXResult();

        repairService.updateHasRepairType(repair);

        ajaxResult.setSuccess(true);
        return ajaxResult;
    }



    @ResponseBody
    @RequestMapping("query4Validate")
    public AJAXResult query4Validate(Integer adressId,Integer userId,Integer typeId,String detailInf){
        AJAXResult result=new AJAXResult();
        Repair repair=new Repair();
        //因为此处是管理员新增的一个新用户，所以说不用管理员给他设置密码，密码统一为账户名称
        Adress adress=new Adress();
        adress.setId(adressId);
        repair.setAdress(adress);
        User user=new User();
        user.setId(userId);
        repair.setUser(user);

        Type type=new Type();
        type.setId(typeId);
        repair.setType(type);
        repair.setDetailInf(detailInf);
        Boolean flag=repairService.query4Validate(repair);
        if(flag){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
            result.setMsg("此报修已提交，请勿重复提交");
        }
        return result;
    }


    @ResponseBody
    @PostMapping("addRepair")
    public AJAXResult addUser(Integer adressId,String detailInf,Integer userId,Integer typeId){
        AJAXResult ajaxResult=new AJAXResult();
        Repair repair=new Repair();
        //因为此处是管理员新增的一个新用户，所以说不用管理员给他设置密码，密码统一为账户名称
        Adress adress=new Adress();
        adress.setId(adressId);
        repair.setAdress(adress);
        repair.setDetailInf(detailInf);
        User user=new User();
        user.setId(userId);
        repair.setUser(user);
        Type type=new Type();
        type.setId(typeId);
        repair.setType(type);

        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd:HH:mm:ss");
        String date=simpleDateFormat.format(new Date());
        repair.setCreateTime(date);
        repair.setHasRepair("2");
        repairService.addRepair(repair);

        ajaxResult.setSuccess(true);
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("getById")
    public AJAXResult getById(Integer id){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            if(id!=null&&id!=0){
                Repair repair=repairService.getById(id);
                ajaxResult.setData(repair);
                ajaxResult.setSuccess(true);
            }else{
                ajaxResult.setMsg("传递报修id不合法");
                ajaxResult.setSuccess(false);
            }

        }catch (Exception e){
            ajaxResult.setMsg("查询详细信息出错");
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("getByIdNoAdress")
    public AJAXResult getByIdNoAdress(Integer id){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            if(id!=null&&id!=0){
                Repair repair=repairService.getByIdNoAdress(id);
                ajaxResult.setData(repair);
                ajaxResult.setSuccess(true);
            }else{
                ajaxResult.setMsg("传递维护id不合法");
                ajaxResult.setSuccess(false);
            }

        }catch (Exception e){
            ajaxResult.setMsg("查询详细信息出错");
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }



}
