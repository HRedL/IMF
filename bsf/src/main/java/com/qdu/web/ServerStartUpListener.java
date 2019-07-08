package com.qdu.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServerStartUpListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //在web应用对象初始化时会被监听到，将web应用路径保存到application范围中
        ServletContext application=servletContextEvent.getServletContext();
        String path=application.getContextPath();
        application.setAttribute("APP_PATH",path);
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
