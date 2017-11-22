package com.cjj.core.common;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.cjj.vo.PagingVo;

public abstract class BaseController {
	private static ThreadLocal<ServletRequest> requestLocal = new ThreadLocal<ServletRequest>();
	private static ThreadLocal<ServletResponse> responseLocal = new ThreadLocal<ServletResponse>();	
	protected PagingVo pagingVo;
	
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){
		requestLocal.set(request);
		responseLocal.set(response);
	}
	
	/**
	 * 线程安全
	 * @return
	 */
	public HttpServletRequest request(){
		return (HttpServletRequest) requestLocal.get();
	}
	
	/**
	 * 线程安全
	 * @return
	 */
	public HttpServletResponse response(){
		return (HttpServletResponse) responseLocal.get();
	}
	
	/**
	 * 设置分页参数
	 * @param pagesize 每页显示行数
	 * @param sumrow 总行数
	 * @param currentpage 当前页数
	 */
	public void setPaging(int pagesize, int sumrow, int currentpage){
		//总页数
		int sumpage = (int)Math.ceil(Double.parseDouble(sumrow+"")/Double.parseDouble(pagesize+""));
		if(sumpage<1){//如果总页数小于1，则赋值为1
			sumpage = 1;
		}
		if(currentpage < 1){//如果当前页数小于1，则赋值为1
			currentpage = 1;
		}else if(currentpage > sumpage){//如果当前页数大于总页数，则赋值为总页数
			currentpage = sumpage;
		}
		//分页标签，开始循环数
		int beginpage = currentpage - 2;
		//分页标签，结束循环数
		int endpage = currentpage + 2;
		//调整分页标签
		while (beginpage < 2) {//循环，一直到开始循环数不小于2
			if(beginpage != 1 && endpage < sumpage - 1){//开始循环数 !=1，且 结束循环数 < 总页数-1
				endpage++; //结束循环数+1
			}
			beginpage++;//开始循环数+1
		}
		while (endpage >= sumpage) {//循环，一直到结束循环数>=总页数
			if(endpage != sumpage && beginpage > 2){//结束循环数 != 总页数 且 开始循环数 > 2
				beginpage--; //开始循环数-1
			}
			endpage--; //结束循环数-1
		}
		//生成分页参数类
		pagingVo = new PagingVo(sumrow, currentpage, sumpage, beginpage, endpage);
		request().getSession().setAttribute("pagingVo", pagingVo);
		
	}
}
