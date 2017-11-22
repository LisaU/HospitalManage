package com.cjj.core.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cjj.vo.EmployeeVo;
import com.cjj.vo.ResourceVo;


public class CommonInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Object obj = request.getSession().getAttribute("pfuserinfo");
		if(obj == null){
			response.sendRedirect(request.getContextPath() + "/indexController/toinitial.do");
			return false;
		}
		
		//获取请求路径
		String path = request.getServletPath();
		//过滤请求，以下不设拦截
		if(path.indexOf("tablelist.do") >= 0 || path.indexOf("finduser.do") >= 0 
			|| path.indexOf("toeditpsw.do") >= 0 || path.indexOf("editpswnext.do") >= 0 
			|| path.indexOf("editpsw.do") >= 0 || path.indexOf("getdptbypid.do") >= 0){
			return true;
		}
		//获取用户信息
		EmployeeVo user = (EmployeeVo) obj;
		//获取用户资源
		List<ResourceVo> resources = user.getResources();
		//循环用户资源
		for (ResourceVo resource : resources) {
			//获取用户资源路径
			String url = resource.getResourceurl();
			//若用户资源路径不为null和""且包含请求路径，则表示用户有该权限，跳出拦截
			if(url != null && url.length() > 0 && url.indexOf(path) >= 0){
				return true;
			}
		}
		return false;
	}
	
}
