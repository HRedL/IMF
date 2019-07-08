package com.qdu.controller;

import com.qdu.entity.AJAXResult;
import com.qdu.entity.Page;
import com.qdu.entity.User;
import com.qdu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @ResponseBody
    @RequestMapping("deleteUsers")
    public AJAXResult deleteUsers(Integer[] userid){
        AJAXResult result=new AJAXResult();
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("userIds",userid);
            userService.deleteUsers(map);

            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("deleteUser")
    public AJAXResult deleteUser(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            userService.deleteUser(id);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("updateUser")
    public AJAXResult updateUser(User user){
        AJAXResult result=new AJAXResult();

        userService.updateUser(user);

        result.setSuccess(true);
        return result;
    }

    @RequestMapping("update")
    public String update(User user){

        userService.updateUser(user);

        return "redirect:/logout";
    }


    @ResponseBody
    @RequestMapping("usernameValidate")
    public AJAXResult usernameValidate(User user){
        AJAXResult result=new AJAXResult();
        Boolean flag=userService.query4Validate(user);
        if(flag==true){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("addUser")
    public AJAXResult addUser(User user){
        AJAXResult ajaxResult=new AJAXResult();
        //因为此处是管理员新增的一个新用户，所以说不用管理员给他设置密码，密码统一为账户名称
        user.setPassword(user.getAccount());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd:HH:mm:ss");
        String date=simpleDateFormat.format(new Date());
        user.setCreateTime(date);
        userService.addUser(user);

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

            List<User> users= userService.pageQueryUser(map);
            //当前的数据条数
            int totalSize=userService.pageQueryCount(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<User> userPage=new Page<User>();
            userPage.setDatas(users);
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
    @RequestMapping("pageQueryOnlyRepairman")
    public AJAXResult pageQueryOnlyRepairman(Integer pageNumber,Integer pageSize,String queryText){

        AJAXResult result=new AJAXResult();

        try{

            Map<String ,Object> map=new HashMap();
            map.put("start",(pageNumber-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("queryText",queryText);

            List<User> users= userService.pageQueryOnlyRepairman(map);
            //当前的数据条数
            int totalSize=userService.pageQueryCountOnlyRepairman(map);
            //当前总页码
            int totalNumber=0;
            //如果正好整除，总页码=总记录/每页记录数,不正好，那么，总页码=总记录/每页记录数+1
            if(totalSize%pageSize==0){
                totalNumber=totalSize/pageSize;
            }else {
                totalNumber=totalSize/pageSize+1;
            }

            //分页对象
            Page<User> userPage=new Page<User>();
            userPage.setDatas(users);
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
    @RequestMapping("getUserById")
    public AJAXResult getUserById(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            User user= userService.getUserById(id);
            result.setData(user);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setMsg("查询出错");
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("getUserByIdNoType")
    public AJAXResult getUserByIdNoType(Integer id){
        AJAXResult result=new AJAXResult();
        try{
            User user= userService.getUserByIdNoType(id);
            result.setData(user);
            result.setSuccess(true);
        }catch (Exception e){
            e.printStackTrace();
            result.setMsg("查询出错");
            result.setSuccess(false);
        }
        return result;
    }

}
