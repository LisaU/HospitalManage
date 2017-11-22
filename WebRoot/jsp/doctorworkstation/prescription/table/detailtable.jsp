<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="item" items="${details}" varStatus="status">
	<tr class="rowTr">
		<td>${item.drugcode}</td>
		<td><input name="detail[${status.index}].drugid" type="hidden" value="${item.drugid}"/>${item.drugname}</th>
		<td><input name="detail[${status.index}].eachdosage" type="hidden" value="${item.eachdosage}"/>${item.eachdosage}</td>
		<td><input name="detail[${status.index}].medicineformid" type="hidden" value="${item.medicineformid}"/>${item.medicineformname}</td>
		<td><input name="detail[${status.index}].medicinefrequencyid" type="hidden" value="${item.medicinefrequencyid}"/>${item.medicinefrequencyname}</td>
		<td><input name="detail[${status.index}].dosagequantity" type="hidden" value="${item.dosagequantity}"/>${item.dosagequantity}</td>
		<td><input name="detail[${status.index}].medicineamount" type="hidden" value="${item.medicineamount}"/>${item.medicineamount}</td>
		<td><input name="detail[${status.index}].note" type="hidden" value="${item.note}"/>${item.note}</td>
		<td>
			<a class="btn btn-link" href="#" onclick="deletedrug(this)">删除</a>
		</td>
	</tr>
</c:forEach>

<script type="text/javascript">
	row = ${not empty details ? fn:length(details) : 0};	

	$(function(){
		$(".rowTr").click(function(){
			$(".rowTr").removeClass("xz");
			$(".rowTr").css("color","#000");
			$(this).addClass("xz");
			$(this).css("color","#fff");
		});
	});
</script>
