<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${drugs}">
	<tr class="rowTr" ondblclick="drugbackfill('${item.id}','${item.drugcode}','${item.drugname}','${item.norms}','${item.inventoryquantity}')">
		<td>${item.drugcode}</td>
		<td>${item.drugname}</td>
		<td>${item.pinyincode}</td>
		<td>${item.drugtypename}</td>
		<td>${item.norms}</td>
		<td>${item.virtualinventory}</td>
		<td>${item.inbulksellprice}</td>
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
