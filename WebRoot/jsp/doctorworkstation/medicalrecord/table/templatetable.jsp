<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${templates}">
	<tr class="rowTr" ondblclick="selecttemplate('${item.templatename}','${item.doctorid}','${item.departmentname}',
					'${item.diseaseid}','${item.note}','${item.fitstatus}','${item.patientappeal}','${item.medicalhistory}',
					'${item.physicalstatus}','${item.primarydiagnosis}','${item.opinion}')">
		<td>${item.templatecode}</td>
		<td>${item.templatename}</td>
		<td>${item.diseasename}</td>
		<td>${item.employeename}</td>
		<td>${item.departmentname}</td>
		<td>${item.fitstatus}</td>
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
