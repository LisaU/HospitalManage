<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${prescriptions}">
	<tr class="rowTr" ondblclick="backfill('${item.id}','${item.prescriptioncode}','${item.cardcode}','${item.patientname}',
					'${item.insuretypename}','${item.sex}','${item.age}','${item.departmentname}','${item.employeename}',
					'${item.viptypename}','<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.prescriptiontime}"/>',
					'${item.registerstatus}','${item.typediscount}','${item.beforediscountsum}','${item.medicarepay}',
					'${item.behinddiscountsum}','${item.privilege}','${item.refund}','${item.receiptcode}')" >
		<td>${item.prescriptioncode}</td>
		<td>${item.registercode}</td>
		<td>${item.cardcode}</td>
		<td>${item.patientname}</td>
		<td>${item.sex == 1 ? "男" : "女"}</td>
		<td>${item.departmentname}</td>
		<td>${item.employeename}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.prescriptiontime}"/></td>
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
