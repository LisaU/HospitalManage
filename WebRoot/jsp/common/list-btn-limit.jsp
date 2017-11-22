<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		<c:forEach var="item" items="${pfuserinfo.resources}">
			if("${item.resourceurl}".indexOf(controller + "/toadd.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/add.do") >= 0 ||
			"${item.resourceurl}".indexOf("/patientController/add.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/dispensing.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/addChild.do") >= 0){
				$(".btn-add").css("display", "inline-block");
			}
			if("${item.resourceurl}".indexOf("/patientController/add.do") >= 0){
				$(".btn-add-p").css("display", "inline-block");
			}
			if("${item.resourceurl}".indexOf(controller + "/toedit.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/edit.do") >= 0){
				$(".btn-edit").css("display", "inline-block");
			}
			if("${item.resourceurl}".indexOf(controller + "/delete.do") >= 0 ||
			"${item.resourceurl}".indexOf(controller + "/dispensingout.do") >= 0){
				$(".btn-delete").css("display", "inline-block");
				$(".btn-deleteone").css("display", "inline-block");
			}
			if("${item.resourceurl}".indexOf(controller + "/deletemore.do") >= 0){
				$(".btn-deletemore").css("display", "inline-block");
			}			
			if("${item.resourceurl}".indexOf(controller + "/tohistory.do")){
				$(".btn-history").css("display", "inline-block");
			}
		</c:forEach>
	});
</script>
