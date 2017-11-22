<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${chargehistorys}">
	<tr class="rowTr" onclick="getdetailtable('${item.prescriptionid}')">
		<td>${item.prescriptioncode}</td>
		<td>${item.receiptcode}</td>
		<td>${item.cardcode}</td>
		<td>${item.patientname}</td>
		<td>${item.sex == 1 ? "男" : "女"}</td>
		<td>${item.age}</td>
		<td>${item.tel}</td>
		<td>${item.doctorname}</td>
		<td>${item.departmentname}</td>
		<td>${item.chargestatus == 1 ? "收费" : "退款"}</td>
		<td>${item.cost}</td>
		<td><fmt:formatDate value="${item.chargetime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		<td>${item.operationpersonname}</td>
		<td>
			<a class="btn btn-link" href="#" onclick="deletehistory('${item.id}')">删除</a>
		</td>
	</tr>											
</c:forEach>

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
