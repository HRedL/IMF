package com.qdu.controller;

import com.qdu.entity.AJAXResult;
import com.qdu.entity.Adress;
import com.qdu.entity.Page;
import com.qdu.entity.Type;
import com.qdu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @Author huahonglei
 * @Version 2019/7/1
 */
@Controller
@RequestMapping("/type")
public class TypeController {

    @Autowired
    private TypeService typeService;

    @ResponseBody
    @RequestMapping("deleteTypes")
    public AJAXResult deleteTypes(Integer[] typeid){
        AJAXResult result=new AJAXResult();
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("typeIds",typeid);
            typeService.deleteTypes(map);

            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("deleteType")
    public AJAXResult deleteUser(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            typeService.deleteType(id);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("updateType")
    public AJAXResult updateUser(Type type){
        AJAXResult result=new AJAXResult();

        typeService.updateType(type);

        result.setSuccess(true);
        return result;
    }



    @ResponseBody
    @RequestMapping("addType")
    public AJAXResult addUser(Type type){
        AJAXResult ajaxResult=new AJAXResult();
        //因为此处是管理员新增的一个新用户，所以说不用管理员给他设置密码，密码统一为账户名称
        typeService.addType(type);

        ajaxResult.setSuccess(true);
        return ajaxResult;
    }

    @RequestMapping("userMain")
    public String userMain(){

        return "manager/repairManage";
    }

    @ResponseBody
    @RequestMapping("pageQuery")
    public AJAXResult pageQuery(Integer pageNumber,Integer pageSize,String queryText){

        AJAXResult result=new AJAXResult();

        try{

            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);

            List<Type> types= typeService.pageQueryType(map);
            //当前的数据条数
            int totalSize=typeService.pageQueryCount(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<Type> userPage=new Page<Type>();
            userPage.setDatas(types);
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
    @GetMapping("getAllType")
    public AJAXResult getAllType(){
        AJAXResult ajaxResult=new AJAXResult();
        try{

            List<Type> types= typeService.getAllType();
            ajaxResult.setData(types);
            ajaxResult.setSuccess(true);
        }catch (Exception e){
            ajaxResult.setMsg("查询失败");
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }

    @ResponseBody
    @GetMapping("getById")
    public AJAXResult getById(Integer id){
        AJAXResult ajaxResult=new AJAXResult();
        try{

            Type type= typeService.getById(id);
            ajaxResult.setData(type);
            ajaxResult.setSuccess(true);
        }catch (Exception e){
            ajaxResult.setMsg("查询失败");
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("query4Validate")
    public AJAXResult query4Validate(Type type){
        AJAXResult result=new AJAXResult();
        Boolean flag=typeService.query4Validate(type);
        if(flag==true){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }


}
