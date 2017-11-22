<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="item" items="${drugs}">
	<tr class="rowTr">
		<td style="padding-top:8px;"><img style="width:70px;height:70px;" src="${item.picture}"></td>
		<td>${item.drugcode}</td>
		<td>${item.drugname}</td>
		<td>${item.pinyincode}</td>
		<td>${item.drugtypename}</td>
		<td>${item.norms}</td>
		<td>${item.dosageunit}</td>
		<td>${item.inbulksellprice}</td>
		<td>${item.ismedicare == 1 ? "是" : "不是"}</td>
		<td>${item.medicareprice}</td>
		<td>${item.inventoryquantity}</td>
		<td>
			<a class="btn btn-link btn-edit" href="javascript:location.href='${ctx}/drugController/toedit.do?id=${item.id}';">修改</a>
			<div class="btn-group">	
				<a class="btn btn-link dropdown-toggle" 
						data-toggle="dropdown">更多
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li class="btn-addcount"><a href="javascript:;" onclick="addCount('${item.id}')">添加库存</a></li>
					<li class="btn-reducecount"><a href="javascript:;" onclick="reduceCount('${item.id}','${item.inventoryquantity}')">库存报损</a></li>
					<li class="btn-delete"><a href="javascript:;" onclick="deletedrug('${item.id}')">删除</a></li>
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