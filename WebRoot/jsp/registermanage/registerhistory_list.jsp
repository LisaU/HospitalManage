<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../common/quote.jsp" %>
		<%@include file="../common/list-btn-limit.jsp" %>
	</head>

	<body>
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							挂号历史记录
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->						

					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病员卡号</label>

								<div class="controls controls-l">
									<input id="cardcode" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病员姓名</label>

								<div class="controls controls-l">
									<input id="patientname" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">	
								<label class="control-label control-label-m">操作人员</label>
	
								<div class="controls controls-l">
									<select id="registerpersonid" class="chzn-select" onchange="search()">
										<option value="0" />全部
											<c:forEach var="item" items="${persons}">
												<option value="${item.id}" />${item.employeename}
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">								
								<label class="control-label control-label-m">状态</label>

								<div class="controls controls-l">
									<select id="registerstatus" class="chzn-select" onchange="search()">
										<option value="0" />全部
										<option value="1" />挂号
										<option value="2" />就诊中
										<option value="3" />已就诊
										<option value="4" />已收费
										<option value="5" />已发药
										<option value="6" />已退药
										<option value="7" />已退款
									</select>
								</div>								
								
							</div>	
						</div><!--/span-->
						
						<div class="span4">
							<label class="control-label control-label-m">常用时段</label>

							<div class="controls controls-l">
								<span  class="text-m" >
									<div class="row-fluid input-prepend">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>

										<input class="span10" type="text" style="width:193px;" name="date-range-picker" id="id-date-range-picker-1" 
										onblur="search()"/>
									</div>
								</span>
							</div>
						</div>
						
						<div class="span4">
							<div class="control-group control-group-m">

								<div class="controls controls-l">
									<button class="btn btn-small" onclick="javascript:location.href='${ctx}/patientController/list.do';">
										<i class="icon-undo"></i>
										返回
									</button>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					<div class="row-fluid">

						<div id="tableleft" class="span4" style="width:100%;overflow:auto;min-width:230px;">
							<div class="control-group control-group-m">
								<div class="controls" style="margin-left:0; margin-bottom:20px;">
									<table class="table" style="overflow:auto;">
										<thead>
											<tr style="background:#fff;">
												<th>挂号编号</th>
												<th>病人编号</th>
												<th>病人姓名</th>
												<th>挂号时间</th>
												<th>性别</th>
												<th>年龄</th>
												<th>联系电话</th>
												<th>参保类型</th>
												<th>医生姓名</th>
												<th>科室名称</th>
												<th>挂号费</th>
												<th>收款人</th>
												<th>状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="datas">
											
										</tbody>			
									</table>
									<%@include file="../common/pagingmenu.jsp" %>
								</div>
							</div>		
						</div><!--/span-->
					</div><!--/.row-fluid-->

				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/registerController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function(){
				find(1);
			});
			
			//查询
			function find(page){
				var begintime="";
				var endtime="";
				var cardcode = $("#cardcode").val();
				var patientname = $("#patientname").val();
				var registerpersonid = $("#registerpersonid").val();
				var registerstatus = $("#registerstatus").val();
				if($("#id-date-range-picker-1").val() != ""){					
					var registertime = $("#id-date-range-picker-1").val().split("-");
					begintime = registertime[0].split("/");
					begintime = $.trim(begintime[2]) + "-" + begintime[0] + "-" + begintime[1];
					endtime = registertime[1].split("/");
					endtime = endtime[2]+ "-" + $.trim(endtime[0])  + "-" + endtime[1];
				}
				gettable(cardcode,patientname,registerpersonid,registerstatus,begintime,endtime,page);
			}
			
			//搜索
			function search(){
				find(1);
			}
			
			//获取挂号历史列表
			function gettable(cardcode,patientname,registerpersonid,registerstatus,begintime,endtime,page){
				$.post(ctx + controller + "/historydatalist.do",
				{cardcode:cardcode,
				patientname:patientname,
				registerpersonid:registerpersonid,
				registerstatus:registerstatus,
				begintime:begintime,
				endtime:endtime,
				pagesize:$("#pagesize").val(),
				currentpage:page},
				function(data){
					$("#datas").html(data);
				});
			}
			
			//删除确认提示
		  	function deletehistory(id){
		  		swal({
				  	title: "是否作废单据?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonColor: "#b74635",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					$.post(ctx + controller + "/delete.do",
					{id:id},
					function(data){
		  				hint(data.msg);
		  				find(1);
					});
				});
		  	}
		</script>
	</body>
</html>
