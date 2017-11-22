<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${dispensings}">
	<tr class="rowTr" onclick="getdetaildatas('${item.chargeid}','${item.prescriptionid}','${item.registerid}','${item.dispensingstatus}')">
		<td>${item.prescriptioncode}</td>
		<td>${item.patientname}</td>
		<td>${item.chargestatus == 2 ? "已退款" : "已收费"}</td>
		<td
			<c:choose>
				<c:when test="${item.dispensingstatus == 3}">
					style="color:#d15b47;"
				</c:when>
				<c:when test="${item.dispensingstatus == 2}">
					style="color:#2283c5;"
				</c:when>
				<c:otherwise>
					style="color:#629b58;"
				</c:otherwise>
			</c:choose>
		>${item.dispensingstatus == 3 ? "已退药" : item.dispensingstatus == 2 ? "已发药" : "可发药"}</td>
		<td>${item.employeename}</td>
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