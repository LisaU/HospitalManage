<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 分页标签模块 -->
<li onclick="find(${pagingVo.currentpage - 1})" class="${pagingVo.currentpage > 1 ? 'waves-effect' : 'disabled'}"><a><i class="icon-double-angle-left"></i></a></li>
<li onclick="find(1)" class="${pagingVo.currentpage == 1 ? 'active' : 'waves-effect'}"><a >1</a></li>
<c:if test="${pagingVo.beginpage > 2}">
<li class="disabled"><a >...</a></li>
</c:if>
<c:forEach begin="${pagingVo.beginpage}" end="${pagingVo.endpage}" var="item">
	<li onclick="find(${item})" class="${pagingVo.currentpage == item ? 'active' : 'waves-effect'}"><a >${item}</a></li>
</c:forEach>
<c:if test="${pagingVo.sumpage > pagingVo.endpage + 1}">
<li class="disabled"><a >...</a></li>
</c:if>
<c:if test="${pagingVo.sumpage > 1}">
<li onclick="find(${pagingVo.sumpage})" class="${pagingVo.currentpage == pagingVo.sumpage ? 'active' : 'waves-effect'}"><a >${pagingVo.sumpage}</a></li>
</c:if>
<li class="${pagingVo.sumpage > pagingVo.currentpage ? 'waves-effect' : 'disabled'}"><a onclick="find(${pagingVo.currentpage + 1})"><i class="icon-double-angle-right"></i></a></li>
