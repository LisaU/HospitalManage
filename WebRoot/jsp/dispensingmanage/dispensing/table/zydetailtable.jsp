<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${zydetail}">
	<tr>
		<td>${item.drugname}</td>
		<td>${item.dosagequantity}</td>
		<td>${item.eachdosage}</td>
		<td>${item.dosageunit}</td>
		<td>${item.medicineformname}</td>
		<td>${item.medicinefrequencyname}</td>
		<td>${item.medicineamount}</td>
		<td>${item.inbulksellprice}</td>
		<td>${item.note}</td>
	</tr>
</c:forEach>
