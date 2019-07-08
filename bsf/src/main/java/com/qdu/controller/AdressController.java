package com.qdu.controller;

import com.qdu.entity.AJAXResult;
import com.qdu.entity.Adress;
import com.qdu.entity.Page;
import com.qdu.entity.Repair;
import com.qdu.service.AdressService;
import com.qdu.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
@Controller
@RequestMapping("/adress")
public class AdressController {

    @Autowired
    AdressService adressService;


    @ResponseBody
    @RequestMapping("pageQuery")
    public AJAXResult pageQuery(Integer pageNumber, Integer pageSize, String queryText){

        AJAXResult result=new AJAXResult();

        try{

            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);

            List<Adress> adresses= adressService.pageQueryAdress(map);
            //当前的数据条数
            int totalSize=adressService.pageQueryCount(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<Adress> userPage=new Page<Adress>();
            userPage.setDatas(adresses);
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
    @RequestMapping("deleteAdresses")
    public AJAXResult deleteRepairs(Integer[] adressid){
        AJAXResult result=new AJAXResult();
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("adressIds",adressid);
            adressService.deleteAdresses(map);

            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }
        return result;
    }



    @ResponseBody
    @RequestMapping("deleteAdress")
    public AJAXResult deleteUser(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            adressService.deleteAdress(id);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("updateAdress")
    public AJAXResult updateUser(Adress adress){
        AJAXResult result=new AJAXResult();

        adressService.updateAdress(adress);

        result.setSuccess(true);
        return result;
    }


    @ResponseBody
    @RequestMapping("query4Validate")
    public AJAXResult query4Validate(Adress adress){
        AJAXResult result=new AJAXResult();
        Boolean flag=adressService.query4Validate(adress);
        if(flag==true){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("addAdress")
    public AJAXResult addUser(Adress adress){
        AJAXResult ajaxResult=new AJAXResult();
        adressService.addAdress(adress);

        ajaxResult.setSuccess(true);
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("getById")
    public AJAXResult getById(Integer id){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            if(id!=null&&id!=0){
                Adress adress=adressService.getById(id);
                ajaxResult.setData(adress);
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

    @ResponseBody
    @RequestMapping("getByIdNoCampus")
    public AJAXResult getByIdNoCampus(Integer id){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            if(id!=null&&id!=0){
                Adress adress=adressService.getByIdNoCampus(id);
                ajaxResult.setData(adress);
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

    @ResponseBody
    @RequestMapping("getAdressesByCondition")
    public AJAXResult getAdressByCondition(Adress adress){
        AJAXResult ajaxResult=new AJAXResult();
        try{
            List<Adress> adresses=adressService.getAdressByCondition(adress);
            ajaxResult.setData(adresses);
            ajaxResult.setSuccess(true);


        }catch (Exception e){
            ajaxResult.setMsg("查询详细信息出错");
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }



}
