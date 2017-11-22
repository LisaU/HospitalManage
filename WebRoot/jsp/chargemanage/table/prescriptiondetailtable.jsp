<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${details}">
	<tr class="rowTr">
		<td>${item.drugtypename}</td>
		<td>${item.drugcode}</td>
		<td>${item.drugname}</td>
		<td>${item.medicineamount}</td>
		<td>${item.dosageunit}</td>
		<td>${item.inbulksellprice}</td>
		<td>${item.drugsum}</td>
		<td>${item.ismedicare == 1 ? "是" : "否"}</td>
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
	});
</script>
