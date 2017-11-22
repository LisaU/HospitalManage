<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${registers}">
	<tr class="rowTr" ondblclick="selectregister('${item.id}','${item.registercode}','${item.patientname}','${item.sex}',
					'${item.age}','${item.typename}','${item.insuretypename}','${item.drugallergyhistory}','${item.note}')">
		<td>${item.registercode}</td>
		<td>${item.cardcode}</td>
		<td>${item.patientname}</td>
		<td>${item.sex == 1 ? "男" : "女"}</td>
		<td>${item.age}</td>
		<td>${item.insuretypename}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.registertime}"/></td>
		<td>${item.tel}</td>
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
