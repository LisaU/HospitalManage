<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${employees}">
	<tr class="rowTr">
		<td style="padding-top:8px;"><img style="width:70px;height:70px;" src="${item.picture}"></td>
		<td>${item.employeecode}</td>
		<td>${item.employeename}</td>
		<td>${item.sex == 1 ? "男" : "女"}</td>
		<td>${item.idcard}</td>
		<td><fmt:formatDate value="${item.birthday}"/></td>
		<td>${item.jobtitlename}</td>
		<td>${item.positionname}</td>
		<td>${item.maxeducationname}</td>
		<td>${item.majorname}</td>
		<td><fmt:formatDate value="${item.inductiontime}"/></td>
		<td>${item.tel}</td>
		<td>${item.address}</td>				
		<td>
			<a class="btn btn-link btn-edit" href="javascript:location.href='${ctx}/employeeController/toedit.do?id=${item.id}';">修改</a>
			<div class="btn-group">	
				<a class="btn btn-link dropdown-toggle" 
						data-toggle="dropdown">更多
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li class="btn-resetpsw"><a href="javascript:;" onclick="resetpsw('${item.id}')">重置密码</a></li>
					<li class="btn-delete"><a href="javascript:;" onclick="deleteemp('${item.id}')">删除</a></li>
				</ul>
			</div>
		</td>
	</tr>
</c:forEach>

<%@include file="../../../common/table-btn-limit.jsp" %>
<script type="text/javascript">
	$(function(){
		$(".rowTr").click(function(){
			$(".rowTr").removeClass("xz");
			$(".rowTr").css("color","#000");
			$(this).addClass("xz");
			$(this).css("color","#fff");
		});
		
		//赋值总行数和当前页，应用在custom_pageload.js，js文件不可用el表达式
		sumrow = ${pagingVo.sumrow};
		currentpage = ${pagingVo.currentpage};
		//调用加载分页信息的方法，方法体在custom_pageload.js里
		loadfunction();
	});
</script>
