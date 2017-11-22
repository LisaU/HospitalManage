<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.btn-group,.btn-edit,.btn-resetpsw,.btn-addcount,.btn-reducecount,.btn-delete{display: none;}
</style>
<script type="text/javascript">
	$(function(){
		<c:forEach var="item" items="${pfuserinfo.resources}">
			if("${item.resourceurl}".indexOf(controller + "/toedit.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/edit.do") >= 0){
				$(".btn-edit").css("display", "inline-block");
			}
			if("${item.resourceurl}".indexOf(controller + "/resetpsw.do") >= 0){
				$(".btn-group").css("display", "inline-block");
				$(".btn-resetpsw").css("display", "list-item");
			}
			if("${item.resourceurl}".indexOf(controller + "/delete.do") >= 0){
				if($(".btn-delete").children().length){
					$(".btn-group").css("display", "inline-block");
					$(".btn-delete").css("display", "list-item");
				}else{
					$(".btn-delete").css("display", "inline-block");
				}
			}		
			if("${item.resourceurl}".indexOf(controller + "/addInventoryquantity.do") >= 0){
				$(".btn-group").css("display", "inline-block");
				$(".btn-addcount").css("display", "list-item");
			}		
			if("${item.resourceurl}".indexOf(controller + "/reduceInventoryquantity.do") >= 0){
				$(".btn-group").css("display", "inline-block");
				$(".btn-reducecount").css("display", "list-item");
			}
		</c:forEach>
	});
</script>
