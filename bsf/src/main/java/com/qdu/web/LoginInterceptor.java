package com.qdu.web;

import com.qdu.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录拦截器
 *
 * 注意：此处，因为我使用的是较高版本的jdk，所以说这个接口自带了实现
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 在控制器执行之前完成业务逻辑操作
     * @return 方法的返回值决定逻辑是否继续执行
     * 若为true：表示可以继续执行
     * 若为false：表示不再继续执行
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        //判断当前用户是否已经登录
        HttpSession session=request.getSession();
        User loginUser=(User) session.getAttribute("userInf");
        if(loginUser==null){
            String APP_PATH=session.getServletContext().getContextPath();
            response.sendRedirect(APP_PATH+"/login");
            return false;
        }else{
            return true;
        }
    }




    /**
     * 在完成视图渲染之后，执行此方法
     */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }

    /**
     * 表示在控制器执行完毕之后，执行的逻辑操作
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }
}
