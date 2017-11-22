<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${templates}">
	<tr class="rowTr" ondblclick="templatebackfill('${item.id}','${item.templatename}','${item.doctorid}','${item.natureid}',
	'${item.prescriptiontypeid}','${item.departmentname}','${item.classifyid}','${item.note}','${item.diagnosis}')">
		<td>${item.templatename}</td>
		<td>${item.departmentname}</td>
		<td>${item.naturename}</td>
		<td>${item.prescriptiontypename}</td>
		<td>${item.classifyname}</td>
		<td>${item.diagnosis}</td>
		<td>${item.note}</td>
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
