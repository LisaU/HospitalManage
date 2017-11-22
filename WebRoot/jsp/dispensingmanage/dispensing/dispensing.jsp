<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<%@include file="../../common/list-btn-limit.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-part-style.css" rel="stylesheet" />
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							发药管理
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div id="first" class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">处方编号</label>

								<div class="controls controls-l">
									<input id="prescriptioncode" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病员卡号</label>

								<div class="controls controls-l">
									<input id="cardcode" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->	
						
						<div class="span3" style="width:45%;">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">查询时段</label>

								<div class="controls controls-l">
									<select id="selectdate" onchange="selectdate()">
										<option value="1" />按日期
										<option value="2" />今天
										<option value="3" />本月
									</select>
									<div class="row-fluid input-prepend" style="width:41%; min-width:198px;">
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>

										<input id="id-date-range-picker-1" class="span10" type="text" name="date-range-picker" onblur="search()"/>
									</div>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">	
						<div></div>					
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病员名称</label>

								<div class="controls controls-l">									
									<input id="patientname" type="text" onkeyup="search()"/>
								</div>
							</div>	
						</div><!--/span-->	

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">开方科室</label>

								<div class="controls controls-l">
									<select id="department" class="chzn-select" onchange="finddoctor()">
										<option value="0" />全部
										<c:forEach var="item" items="${departments}">
											<option value="${item.id}"  />${item.departmentname}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">开方医生</label>

								<div class="controls controls-l">
									<select id="doctor" class="chzn-select" onchange="search()">
										<option id="all" value="0" />全部
										<c:forEach var="item" items="${doctors}">
											<option value="${item.id}" />${item.employeename}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->
											
						<div class="span3">
							<div class="control-group control-group-m">

								<div class="controls controls-l">					
									<button class="btn btn-small btn-success btn-add" onclick="dispensing()">
										<i class="icon-share-alt"></i>
										发药
									</button>
									
									<button class="btn btn-small btn-danger btn-delete" onclick="dispensingout()">
										<i class="icon-reply"></i>
										退药
									</button>									
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					
					<div class="row-fluid">

						<div id="tableleft" class="span3" style="width:43.4%;min-width:230px;">
							<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; width:95%; height:27px;">
								<span style="margin-left:15px;">发药处方列表</span>
								<div style="float:right;">
									<label class="control-label control-label-m" >状态</label>

									<div class="controls controls-l" style="float:right">
										<select id="dispensingstatus" class="chzn-select" style="width:94px;" onchange="search()">
											<option value="0" />全部
											<option value="1" />可发药
											<option value="2" />已发药
											<option value="3" />已退药
										</select>
									</div>
								</div>
							</div>
							<div class="control-group control-group-m" style="width:95.1%;">
								<div class="controls controls-l">
									<table class="table">
										<thead>
											<tr style="background:#fff;">
												<th>处方单编号</th>
												<th>病人名称</th>
												<th>收费状态</th>
												<th>发药状态</th>
												<th>医生</th>
											</tr>
										</thead>
										<tbody id="datas">
											
										</tbody>			
									</table>
									<%@include file="../../common/pagingmenu.jsp" %>
								</div>
							</div>		
						</div><!--/span-->
						

						<div id="tableright" class="span3" style="width:54%;">
							<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; height:27px;">
								<span style="margin-left:15px;">西药处方明细列表</span>
							</div>
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<table class="table">
										<thead>
											<tr style="background:#fff;">
												<th>药品名称</th>
												<th>剂型</th>
												<th>每剂用量</th>
												<th>单位</th>
												<th>用药方式</th>
												<th>用药频率</th>
												<th>用药总量</th>
												<th>药品价格</th>
												<th>备注</th>
											</tr>
										</thead>
										<tbody id="xydatas">
										
										</tbody>			
									</table>
								</div>
							</div>	
							
							<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; height:27px; margin-top:40px;">
								<span style="margin-left:15px;">中药处方明细列表</span>
							</div>
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<table class="table">
										<thead>
											<tr style="background:#fff;">
												<th>药品名称</th>
												<th>剂数</th>
												<th>每剂用量</th>
												<th>单位</th>
												<th>用药方式</th>
												<th>用药频率</th>
												<th>用药总量</th>
												<th>药品价格</th>
												<th>备注</th>
											</tr>
										</thead>
										<tbody id="zydatas">
										
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
			var controller = "/dispensingController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				find(1);
				//提交返回信息
				if("${resulttext}" == "add"){
					hint("发药成功！");
				}else if("${resulttext}" == "edit"){
					hint("退药成功！");
				}
			});
			
			//选择日期来查询
			function selectdate(){
				search();
				if($("#selectdate").val() == 1) {
					$("#id-date-range-picker-1").removeAttr("disabled");
				}else{
					$("#id-date-range-picker-1").attr("disabled","disabled");
				}
			}
			
			//跳转页数
			function find(page){
				var prescriptioncode = $("#prescriptioncode").val();
				var cardcode = $("#cardcode").val();
				var patientname = $("#patientname").val();
				var departmentid = $("#department").val();
				var doctorid = $("#doctor").val();
				var dispensingstatus = $("#dispensingstatus").val();
				var timestatus = $("#selectdate").val();
				var begintime = "";
				var endtime = "";
				var myDate = new Date();
				if(timestatus == 1){//按日期
					if($("#id-date-range-picker-1").val() != ""){					
						var dispensingtime = $("#id-date-range-picker-1").val().split("-");
						begintime = dispensingtime[0].split("/");
						begintime = $.trim(begintime[2]) + "-" + begintime[0] + "-" + begintime[1];
						endtime = dispensingtime[1].split("/");
						endtime = endtime[2]+ "-" + $.trim(endtime[0])  + "-" + (parseInt(endtime[1]) + 1);
					}
				}else if(timestatus == 2){//今天
					begintime = myDate.toLocaleDateString().replace("/", "-").replace("/", "-");
					endtime = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+(myDate.getDay()+2);
				}else{//本月
					begintime = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-1";
					endtime = myDate.getFullYear()+"-"+(myDate.getMonth()+2)+"-1";
				}
				gettable(0,prescriptioncode,cardcode,patientname,departmentid,doctorid,dispensingstatus,begintime,endtime,page);
				getdetaildatas(0,0,0,0);
			}
			
			//查询
			function gettable(id,prescriptioncode,cardcode,patientname,departmentid,doctorid,
					dispensingstatus,begintime,endtime,page){
				$.post(ctx + controller + "/datalist.do",
				{id:id,	prescriptioncode:prescriptioncode, cardcode:cardcode, patientname:patientname,
				departmentid:departmentid, doctorid:doctorid, dispensingstatus:dispensingstatus,
				begintime:begintime,endtime:endtime,pagesize:$("#pagesize").val(),currentpage:page},
				function(data){
					$("#datas").html(data);
				});
			}
			
			//查询中药明细
			function getzydetaildata(prescriptionid){
				$.post(ctx + controller + "/zydetailtablelist.do",
				{prescriptionid:prescriptionid},
				function(data){
					$("#zydatas").html(data);
				});
			}
			
			//查询西药明细
			function getxydetaildata(prescriptionid){
				$.post(ctx + controller + "/xydetailtablelist.do",
				{prescriptionid:prescriptionid},
				function(data){
					$("#xydatas").html(data);
				});
			}
			
			var cid = 0;
			var rid = 0;
			var dpstatus = 0;
			//点击获取明细
			function getdetaildatas(chargeid,prescriptionid,registerid,dispensingstatus){
				getzydetaildata(prescriptionid);
				getxydetaildata(prescriptionid);
				cid = chargeid;
				rid = registerid;
				dpstatus = dispensingstatus;
			}
			
			//搜索
			function search(){
				find(1);
			}
			
			//根据科室部门查询医生
			function getselect(){
				$("#all").nextAll().remove();
				$.post(ctx + "/passController/getdoctorbydptid.do",
				{id:$("#department").val()},
				function(data){					
					$.each(data,function(name,value) {
						$("#doctor").append("<option value='"+value['id']+"'>"+value['employeename'] + "</option>");
					});
					$("#doctor").val(0);
					$("#doctor").trigger("liszt:updated");
            		$("#doctor").chosen();
				});
			}
			
			//查询医生
			function finddoctor(){
				getselect();
				search();
			}
			
			//发药
			function dispensing(){
				if (dpstatus == 0){
					swal("请选择发药的处方！");
				}else if(dpstatus == 1){
					swal({
					  	title: "是否发药?",
					  	text: "",
					  	type: "warning",
					  	showCancelButton: true,
					  	cancelButtonText: "否",
					  	confirmButtonClass: "btn-danger",
					  	confirmButtonText: "是",
					  	closeOnConfirm: true
					},
					function(){
						//访问
						location.href = ctx + controller + "/dispensing.do?chargeid=" + cid +"&registerid=" + rid;
					});
				}else if(dpstatus == 2){
					swal("该处方已发药，不可重复发药！");
				}else{
					swal("该处方已退药，不可进行发药操作！");
				}
			}
			
			//退药
			function dispensingout(){
				if (dpstatus == 0){
					swal("请选择退药的处方！");
				}else if(dpstatus == 1){
					swal("该处方未发药，不可进行退药操作！");
				}else if(dpstatus == 2){
					swal({
					  	title: "是否退药?",
					  	text: "",
					  	type: "warning",
					  	showCancelButton: true,
					  	cancelButtonText: "否",
					  	confirmButtonClass: "btn-danger",
					  	confirmButtonText: "是",
					  	closeOnConfirm: true
					},
					function(){
						//访问
						location.href = ctx + controller + "/dispensingout.do?chargeid=" + cid +"&registerid=" + rid;
					});
				}else{
					swal("该处方已退药，不可重复退药！");
				}
			}
		</script>
	</body>
</html>
