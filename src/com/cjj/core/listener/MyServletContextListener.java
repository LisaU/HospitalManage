package com.cjj.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//在web应用启动的时候，通过servletContext获取web应用工程名
		String contextPath = event.getServletContext().getContextPath();
		//由于web应用在启动和销毁过程中，web应用的工程名一直不变，
		//所以我们就将这个工程名存放到servletContext属性，
		//需要用到的时候，直接通过servletContext会话级别获取属性
		event.getServletContext().setAttribute("ctx", contextPath);
		
	}

}
