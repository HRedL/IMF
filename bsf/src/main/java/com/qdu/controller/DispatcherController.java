package com.qdu.controller;


import com.github.pagehelper.util.StringUtil;

import com.qdu.entity.AJAXResult;
import com.qdu.entity.User;
import com.qdu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class DispatcherController {

    @Autowired
    UserService userService;


    @RequestMapping("/error")
    public String error(){
        return "error";
    }


    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "login";
    }



    /**
     * 跳转到普通用户主界面
     * @return
     */
    @RequestMapping("/user")
    public String toUserMain(){
        return "user/userMain";
    }

    /**
     * 跳转到管理员主界面
     * @return
     */
    @RequestMapping("/manager")
    public String toManagerMain(){
        return "manager/managerMain";
    }

    @RequestMapping("/repairman")
    public String toRepairMain(){
        return "repairman/repairmanMain";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "redirect:login";
    }


    @RequestMapping("/repairManage")
    public String repairManage(){
        return "manager/repairManage";
    }

    @RequestMapping("/typeManage")
    public String typeManage(){
        return "manager/typeManage";
    }

    @RequestMapping("/userManage")
    public String userManage(){
        return "manager/userManage";
    }

    @RequestMapping("/adressManage")
    public String adressManage(){
        return "manager/adressManage";
    }

    @RequestMapping("/repairmanManage")
    public String repairmanManage(){
        return "manager/repairmanManage";
    }



    /**
     * 处理登录页面上的ajax请求,并且把查询出来的user存入到session域中
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/ajaxLogin")
    public AJAXResult doAjaxLogin(User user, HttpSession session){

        AJAXResult result=new AJAXResult();
        try{
            User dbUser=userService.query4Login(user);
            if(dbUser!=null){
                //将user信息放入session
                session.setAttribute("userInf",dbUser);

                result.setMsg("输入正确");
                result.setSuccess(true);
                result.setData(dbUser.getType());
            }else{
                result.setMsg("用户的账号或密码输入错误，请重新输入");
                result.setSuccess(false);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("出现异常");
        }

        return result;
    }

    /**
     * 跳转到主界面
     * @return
     */
    @RequestMapping("/main")
    public String toMain(){
        return "main";
    }


//    @RequestMapping("/dologin")
//    public String dologin(User user,Model model){
//        //1).获取表单数据
//
//        //2).查询用户信息
//        User dbUser=userService.query4Login(user);
//        //3)判断用户信息是否存在
//        if(dbUser!=null){
//            //登录成功，跳转到主页面
//            return "main";
//        }else{
//            //登陆失败，跳转回到登录页面，并且提示错误信息
//            String errorMsg="登录账号或密码不正确，请重新输入";
//            model.addAttribute("errorMsg",errorMsg);
//            return "redirect:login";
//        }
//
//    }
}
