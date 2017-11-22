<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${patients}">
	<tr class="rowTr" onclick="selectpatient('${item.cardcode}','${item.patientname}','${item.id}',
					'${item.sex}','${item.age}','${item.maritalstatusid}','${item.job}','${item.viptypeid}',
					'${item.medicarecode}','${item.insuretypeid}','${item.patienttypeid}','${item.tel}','${item.address}',
					'${item.drugallergyhistory}','${item.viptypename}')" >
		<td>${item.cardcode}</td>
		<td>${item.patientname}</td>
		<td>${item.sex == 1 ? "男" : "女"}</td>
		<td>${item.age}</td>
		<td>${item.insuretypename}</td>
		<td>${item.patienttypename}</td>
		<td>${item.tel}</td>
		<td>${item.drugallergyhistory}</td>
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
