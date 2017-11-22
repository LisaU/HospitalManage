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
							收费历史记录
						</h1>
					</div><!--/.page-header-->						

					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">处方单号</label>

								<div class="controls controls-l">
									<input id="prescriptioncode" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->

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
						</div>
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">								
								<label class="control-label control-label-m">收款人员</label>

								<div class="controls controls-l">
									<select id="operationpersonid" class="chzn-select" onchange="search()">
										<option value="0" />全部
										<c:forEach var="item" items="${operations}">
											<option value="${item.id}" />${item.employeename}
										</c:forEach>
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
									<button class="btn btn-small" onclick="javascript:location.href='${ctx}/chargeController/list.do';">
										<i class="icon-undo"></i>
										返回
									</button>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					<div class="row-fluid">

						<div id="tableleft" class="span4" style="width:100%;overflow:auto;min-width:230px; height:300px;">
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<table class="table" style="overflow:auto;">
										<thead>
											<tr style="background:#fff;">
												<th>处方单号</th>
												<th>收据号</th>
												<th>病人编号</th>
												<th>病人姓名</th>
												<th>性别</th>
												<th>年龄</th>
												<th>联系电话</th>
												<th>医生姓名</th>
												<th>科室名称</th>
												<th>状态</th>
												<th>费用</th>
												<th>时间</th>
												<th>收款人</th>
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
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					<div class="row-fluid">

						<div id="tableleft" class="span4" style="width:100%;overflow:auto;min-width:230px; height:300px;">
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<table class="table" style="overflow:auto;">
										<thead>
											<tr style="background:#fff;">
												<th>明细类型</th>
												<th>编码</th>
												<th>药品（项目）名称</th>
												<th>用药总量</th>
												<th>规格</th>
												<th>单位</th>
												<th>单价</th>
												<th>金额</th>
												<th>是否医保</th>
											</tr>
										</thead>
										<tbody id="detailtatas">
										
										</tbody>		
									</table>
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
			var controller = "/chargeController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				//加载数据
				find(1);
			});
			
			//跳转页数
			function find(page){
				var begintime="";
				var endtime="";
				var prescriptioncode = $("#prescriptioncode").val();
				var cardcode = $("#cardcode").val();
				var patientname = $("#patientname").val();
				var operationpersonid = $("#operationpersonid").val();
				if($("#id-date-range-picker-1").val() != ""){					
					var registertime = $("#id-date-range-picker-1").val().split("-");
					begintime = registertime[0].split("/");
					begintime = $.trim(begintime[2]) + "-" + begintime[0] + "-" + begintime[1];
					endtime = registertime[1].split("/");
					endtime = endtime[2]+ "-" + $.trim(endtime[0])  + "-" + endtime[1];
				}
				gettable(prescriptioncode,cardcode,patientname,operationpersonid,begintime,endtime,page);
			}
			
			//搜索
			function search(){
				find(1);
				getdetailtable(0);
			}
			
			//查询
			function gettable(prescriptioncode,cardcode,patientname,operationpersonid,begintime,endtime,page){
				$.post(ctx + controller + "/historydatalist.do",
				{prescriptioncode:prescriptioncode,
				cardcode:cardcode,
				patientname:patientname,
				operationpersonid:operationpersonid,
				begintime:begintime,
				endtime:endtime,
				pagesize:$("#pagesize").val(),
				currentpage:page},
				function(data){
					$("#datas").html(data);
				});
			}
			
			//删除历史记录
			function deletehistory(id){
				find(1);
				getdetailtable(0);
			}
			
			//查询历史记录
			function getdetailtable(id){
				$.post(ctx + "/prescriptionController/chargedetailtablelist.do",
				{id:id,status:2},
				function(data){
					$("#detailtatas").html(data);
				});
			}
		</script>
	</body>
</html>
