<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../common/quote.jsp" %>
		<%@include file="../common/list-btn-limit.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-part-style.css" rel="stylesheet" />	
	</head>

	<body onresize="resize()">
		<div class="main-container container-fluid" style="z-index:3000;">		

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							挂号登记
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form1" class="form-horizontal" action="${ctx}/patientController/add.do" method="post">
					
					<div style="border-bottom:1px dotted #e2e2e2; margin:30px 0 10px 0;">
						<span style="margin-left:15px;">病人资料</span>
					</div>					

					<div class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人卡号</label>

								<div class="controls controls-m">
									<input name="cardcode" type="text" onfocus="findpatient()"/>
								</div>
							</div>		
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人名称</label>

								<div class="controls controls-m">
									<input name="patientname" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">性别</label>

								<div class="controls controls-m">
									<div class="controls-radio">
										<label style="display:inline-block;">
											<input name="sex" type="radio"  value="1"/>
											<span class="lbl"> 男</span>
										</label>
	
										<label style="display:inline-block;">
											<input name="sex" type="radio" value="2"/>
											<span class="lbl"> 女</span>
										</label>
									</div>
								</div>
							</div>	
						</div><!--/span-->						

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">年龄</label>

								<div class="controls controls-m">
									<input name="age" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->

					<div class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">婚姻状况</label>

								<div class="controls controls-m">
									<select name="maritalstatusid" class="chzn-select" data-placeholder="-请选择-" disabled="disabled">
										<option value="0" />
										<c:forEach var="item" items="${politicsstatuss}">
											<option value="${item.id}" />${item.detailname}
										</c:forEach>
									</select>		
								</div>
							</div>		
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">所在职业</label>

								<div class="controls controls-m">
									<input name="job" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">会员类型</label>

								<div class="controls controls-m">
									<select name="viptypeid" class="chzn-select" data-placeholder="-请选择-" disabled="disabled">
										<option value="" />
										<c:forEach var="item" items="${viptypes}">
											<option value="${item.id}" />${item.typename}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">医保卡号</label>

								<div class="controls controls-m">
									<input name="medicarecode" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->

					<div class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">参保类型</label>

								<div class="controls controls-m">
									<select name="insuretypeid" class="chzn-select" data-placeholder="-请选择-" disabled="disabled">
										<option value="0" />
										<c:forEach var="item" items="${insuretypes}">
											<option value="${item.id}" />${item.detailname}
										</c:forEach>
									</select>
								</div>
							</div>		
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人类别</label>

								<div class="controls controls-m">
									<select name="patienttypeid" class="chzn-select" data-placeholder="-请选择-" disabled="disabled">
										<option value="" />
										<c:forEach var="item" items="${patienttypes}">
											<option value="${item.id}" />${item.typename}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">联系电话</label>

								<div class="controls controls-m">
									<input name="tel" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">联系地址</label>

								<div class="controls controls-m">
									<input name="address" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->

					<div class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">药过敏史</label>

								<div class="controls controls-m">
									<input name="drugallergyhistory" type="text" readonly="readonly"/>
								</div>
							</div>		
						</div><!--/span-->
						
						<div class="span3" style="width:35%;">
							<div class="control-group control-group-m">

								<div class="controls controls-m">
									<button type="button" class="btn btn-small btn-success btn-add-p" id="editpt" onclick="addpatient()">
										<i class="icon-edit"></i>
										新增病人
									</button>
									<button type="submit" class="btn btn-small btn-primary" id="savept" style="display:none;">
										<i class="icon-save"></i>
										保存病人
									</button>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->
					</form>
					
					<!-- ------------------------------------------------分割线--------------------------------------------------------- -->
					
					<form id="validation-form2"  class="form-horizontal" action="${ctx}/registerController/add.do" method="post" >

					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;">
						<span style="margin-left:15px;">挂号</span>
					</div>					

					<div class="row-fluid">
						<div></div>
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">挂号单号</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" value="自动生成" style="text-align:center;"/>
								</div>
							
								<label class="control-label control-label-m">选择科室</label>

								<div class="controls controls-m">
									<select id="department" name="departmentid" class="chzn-select" data-placeholder="-请选择-" onchange="finddoctor()">
										<option value="" />
										<c:forEach var="item" items="${departments}">
											<option value="${item.id}" />${item.departmentname}
										</c:forEach>
									</select>
								</div>

								<label class="control-label control-label-m">挂号备注</label>

								<div class="controls controls-m">
									<input name="note" type="text"/>
								</div>						
							</div>
						</div><!--/span-->

						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">病人姓名</label>

								<div class="controls controls-m">
									<input id="patientname" type="text" readonly="readonly" onfocus="findpatient()"/>
									<input name="patientid" type="hidden"/>
								</div>
								
								<label class="control-label control-label-m">选择医生</label>

								<div class="controls controls-m">
									<select id="doctor" name="doctorid" class="chzn-select" data-placeholder="-请选择-">
										<option id="all" value="0" />
										<c:forEach var="item" items="${doctors}">
											<option value="${item.id}" />${item.employeename}
										</c:forEach>
									</select>
								</div>
							</div>	
						</div><!--/span-->
						
						<div class="span3">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">挂号金额</label>

								<div class="controls controls-m">
									<input id="registersum" name="registersum" type="text" readonly />
								</div>
								
								<label class="control-label control-label-m">会员类型</label>

								<div class="controls controls-m">
									<input id="viptype" type="text" readonly="readonly"/>
								</div>
							</div>	
						</div><!--/span-->
						
						<div class="span3">
							<div class="control-group control-group-m">
								<div class="controls controls-l" style="border:1px dotted #e2e2e2; max-width:294px; min-width:220px;" >
									<c:forEach var="item" items="${registertypes}">
										<label>
											<input id="r${item.id}" class="radioclass" name="registertype" type="radio" value="${item.id},${item.typesum}"/>
											<span class="lbl"> ${item.typename}</span>
										</label>
									</c:forEach>

									<label>
										<input id="r4" class="radioclass" name="registertype" type="radio" value="0"/>
										<span class="lbl"> 自定义挂号费</span>
										<input id="isum" type="text" readonly="readonly" style="width:33%;" onkeyup="isumchange()"/>
									</label>
									<input id="registertypeid" type="hidden" name="registertypeid">
								</div>
							</div>	
						</div><!--/span-->						
					</div><!--/.row-fluid-->					

					<div class="row-fluid">
						<div></div>
						<div id="tableleft" class="span3" style="width:71.3%; overflow:auto; min-width:240px;">
							<div class="control-group control-group-m" style="width:95.3%;">
								<div class="controls controls-m">
									<table class="table" style="height:100px !important; overflow:auto;">
										<thead>
											<tr style="background:#fff;">
												<th>挂号单号</th>
												<th>病人卡号</th>
												<th>病人姓名</th>
												<th>挂号时间</th>
												<th>医生姓名</th>
												<th>科室名称</th>
												<th>挂号费</th>
												<th>挂号状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="registerdatas">
																									
										</tbody>	
									</table>
									<%@include file="../common/pagingmenu.jsp" %>
								</div>
							</div>		
						</div><!--/span-->

						<div id="tableright" class="span3">
							<div class="control-group control-group-m">
								<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;">
									<span style="margin-left:15px;">统计信息</span>
								</div>
								<label class="control-label control-label-m">上位病员</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" style="text-align:center;" value="${register.patientname}"/>
								</div>

								<label class="control-label control-label-m">上位时间</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" style="text-align:center;" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${register.registertime}"/>'/>
								</div>
								
								<label class="control-label control-label-m">挂号金额</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" style="text-align:center;" value="${register.registersum}"/>
								</div>
								
								<label class="control-label control-label-m">挂号人员</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" style="text-align:center;" value="${register.registerpersonname}"/>
								</div>
								
								<label class="control-label control-label-m">现在日期</label>

								<div class="controls controls-m">
									<input id="currentdata" type="text" readonly="readonly" style="text-align:center;"/>
								</div>
								
								<label class="control-label control-label-m">现在时间</label>

								<div class="controls controls-m">
									<input id="currenttime" type="text" readonly="readonly" style="text-align:center;"/>
								</div>
								
								<label class="control-label control-label-m">合计人数</label>

								<div class="controls controls-m">
									<input type="text" readonly="readonly" style="text-align:center;" value="${countinfo.countregister}"/>
								</div>
								
								<label class="control-label control-label-m">合计金额</label>

								<div class="controls controls-m">
									<input id="" type="text" readonly="readonly" style="text-align:center;" value="${countinfo.sumregistersum}"/>
								</div>
							</div>	
						</div><!--/span-->
					</div><!--/.row-fluid-->				

					<div class="row-fluid">
						<div class="span12">	
							<div class="modal-footer" style="background:#f5f5f5; width:96%; position:fixed;bottom:0; z-index:4000;">
								<div id="bigbtn">
									<button type="submit" class="btn btn-small btn-success btn-add">
										<i class="icon-check"></i>
										挂号
									</button>

									<button type="button" class="btn btn-small btn-info btn-history" onclick="javascript:location.href='${ctx}/registerController/tohistory.do';">
										<i class="icon-circle-blank"></i>
										查询历史记录
									</button>
								</div>
							</div>								
						</div><!--/.span-->
					</div><!--/.row-fluid-->
					</form>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->

		<div  class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择病人
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" onkeyup="ptsearch()"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>病人卡号</th>
									<th>病人名称</th>
									<th>性别</th>
									<th>年龄</th>
									<th>参保类型</th>
									<th>病人类型</th>
									<th>联系电话</th>
									<th>药物过敏史</th>
								</tr>
							</thead>
							<tbody id="patientdatas">
								
							</tbody>			
						</table>
					</div>
					<div class="modal-footer">
						<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
						<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="openhintModal()">确定</button>
					</div>
				</div>
			</div>
  		</div>
		
		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">
			var ctx = "${ctx}";
			var controller = "/registerController";
			var sumrow;
			var currentpage;
		</script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				//加载数据		
				find(1);
				
				//左下列表高度
				$("#tableleft").css("height",$("#tableright").height());
				
				//是否自定义挂号费，若是则自定义挂号费文本框可用，反之不可用
				$(".radioclass").change(function(){
					var $rdo = $('input[name="registertype"]:checked').next().text().trim();
					if($rdo == "自定义挂号费"){
						$("#isum").removeAttr("readonly");
					}else{
						$("#isum").attr("readonly","readonly");
					}
				});
				
				//挂号类别，内含挂号id和类别金额，需根据逗号分隔，分别赋值
				$("input[name='registertype']").click(function(){
				 	var arr = $("input[name='registertype']:checked").val().split(',');
				 	$("#registertypeid").val(arr[0]);
				  	$("#registersum").val(arr[1]);
			 	});
			 	
			 	//获取日期
				getDate();
				//设置一秒更新一次时间
				setInterval("getDate()", 1000);
				
	    		//提交返回信息
				if("${resulttext}" == "addpt"){
					hint("新增病人成功！");
				}else if("${resulttext}" == "addrgt"){
					hint("挂号成功！");
				}
				
				//开启表单验证-病人信息
				ptFormValidate();				
			    
			    //开启表单验证-挂号
			    rgtFormValidate();
			});
			
			//获取日期
			function getDate(){
				var myDate = new Date();
				$("#currentdata").val(myDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
				var hours = myDate.getHours(); //获取当前小时数(0-23)
				hours = (hours < 10 ? "0" + hours : hours);
				var mins = myDate.getMinutes(); //获取当前分钟数(0-59)
				mins = (mins < 10 ? "0" + mins : mins);
				var seconds = myDate.getSeconds(); //获取当前秒数(0-59)
				seconds = (seconds < 10 ? "0" + seconds : seconds);
				$("#currenttime").val(hours + ":" + mins + ":" + seconds);
			}
			
			//窗口大小改变事件
			function resize(){
				$("#tableleft").css("max-height", $("#tableright").height() + "px");
			}
			
			//添加病人时各个控件可用状态
			function addpatient(){
				$("#editpt").css("display","none");
				$("#savept").css("display","");
				$("#patientname").val("");
				$("#viptype").val("");
				$("#patientform").find("input[type='text']").val("");
				$("#patientform").find("select").val(0);
				$("input[name='sex']").prop("checked",false); 
				$("input[name='cardcode']").val("自动生成");
				$("input[name='cardcode']").css("text-align","center");
				$("input[name='cardcode']").attr("readonly", "readonly");
				$("input[name='patientname']").removeAttr("readonly");
				$("input[name='age']").removeAttr("readonly");
				$("select[name='maritalstatusid']").removeAttr("disabled");
				$("select[name='maritalstatusid']").trigger("liszt:updated");
            	$("select[name='maritalstatusid']").chosen();
				$("input[name='job']").removeAttr("readonly");
				$("select[name='viptypeid']").removeAttr("disabled");
				$("select[name='viptypeid']").trigger("liszt:updated");
            	$("select[name='viptypeid']").chosen();
				$("input[name='medicarecode']").removeAttr("readonly");
				$("select[name='insuretypeid']").removeAttr("disabled");
				$("select[name='insuretypeid']").trigger("liszt:updated");
            	$("select[name='insuretypeid']").chosen();
				$("select[name='patienttypeid']").removeAttr("disabled");
				$("select[name='patienttypeid']").trigger("liszt:updated");
            	$("select[name='patienttypeid']").chosen();
				$("input[name='tel']").removeAttr("readonly");
				$("input[name='address']").removeAttr("readonly");
				$("input[name='drugallergyhistory']").removeAttr("readonly");
			}
			
			//表单验证-病人信息
			function ptFormValidate(){
				$("#validation-form1").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	patientname:"required",
				   	  	sex:"required",
				   	  	age:{
				   	  		required:true,
				   	  		number:true
				   	  	},
				   	  	viptypeid:"required",
				   	  	patienttypeid:"required",
				   	  	tel:{
				   	  		required:true,
				   	  		phone:true
				   	  	},
				   	  	address:"required",
				   	  	drugallergyhistory:"required"
				    },
				    messages:{
				      	sex:"这是必选字段",
				      	viptypeid:"这是必选字段",
				      	patienttypeid:"这是必选字段"		      	
				    },
				    
				    highlight: function (e) {
						$(e).closest('.control-group').removeClass('info').addClass('error');
					},
			
					success: function (e) {
						$(e).closest('.control-group').removeClass('error').addClass('info');
						$(e).remove();
					},
					//重写提交方式
					submitHandler:function(){
						ptSubmit();
					}
			    });
			}
			
			//表单提交-病人信息
			function ptSubmit(){
				swal({
				  	title: "是否保存病人?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					document.forms[0].submit();
				});
			}
			
			//打开病人模态框
			function findpatient(){
				getpatienttable("");
				$('#payModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#payModal").css("z-index","6000");
			}
			
			//病人信息回填
			function selectpatient(cardcode,patientname,patientid,sex,age,maritalstatusid,
			job,viptypeid,medicarecode,insuretypeid,patienttypeid,tel,address,drugallergyhistory,vipname){
				$("input[name='sex'][value="+ sex +"]").prop("checked","checked"); 
				$("input[name='cardcode']").val(cardcode);
				$("input[name='patientname']").val(patientname);
				$("input[name='patientid']").val(patientid);
				$("#patientname").val(patientname);
				$("input[name='age']").val(age);
				$("select[name='maritalstatusid']").val(maritalstatusid);
				$("select[name='maritalstatusid']").trigger("liszt:updated");
            	$("select[name='maritalstatusid']").chosen();
				$("input[name='job']").val(job);
				$("select[name='viptypeid']").val(viptypeid);
				$("select[name='viptypeid']").trigger("liszt:updated");
            	$("select[name='viptypeid']").chosen();
				$("#viptype").val(vipname);
				$("input[name='medicarecode']").val(medicarecode);
				$("select[name='insuretypeid']").val(insuretypeid);
				$("select[name='insuretypeid']").trigger("liszt:updated");
            	$("select[name='insuretypeid']").chosen();
				$("select[name='patienttypeid']").val(patienttypeid);
				$("select[name='patienttypeid']").trigger("liszt:updated");
            	$("select[name='patienttypeid']").chosen();
				$("input[name='tel']").val(tel);
				$("input[name='address']").val(address);
				$("input[name='drugallergyhistory']").val(drugallergyhistory);
				$('#payModal').modal('hide');
				$(".modal-backdrop").css("z-index","1040");
				$("#payModal").css("z-index","1050");
			 }
			 
			 //自定义挂号费文本框值改变时挂号费文本框相应改变
			 function isumchange(){
			 	$("#registersum").val($("#isum").val());
			 }
			 
			 //模糊查询病人
			 function ptsearch(){
			 	getpatienttable($("#nav-search-input").val());
			 }
			 
			 //加载病人列表
			 function getpatienttable(str){
			 	$.post(ctx + "/patientController/patienttablelist.do",
				{contant:str},
				function(data){
					$("#patientdatas").html(data);
				});
			 }
			 
			 //跳转页数
	 		 function find(page){
				getregistertable(page);
		 	 }
			 
			 //查询挂号信息
			 function getregistertable(page){
			 	$.post(ctx + controller + "/registerlist.do",
			 	{pagesize:$("#pagesize").val(),
				 currentpage:page},
				function(data){
					$("#registerdatas").html(data);
				});
			 }
			 
			 //根据科室部门查询医生
			 function getselect(){
				$("#all").nextAll().remove();
				$.post(ctx + "/passController/getdoctorbydptid.do",
				{id:$("#department").val() == "" ? 0 : $("#department").val()},
				function(data){					
					$.each(data,function(name,value) {
						$("#doctor").append("<option value='"+value['id']+"'>"+value['employeename'] + "</option>");
					});
					$("#doctor").val(0);
					$("#doctor").trigger("liszt:updated");
            		$("#doctor").chosen();
				});
			}
			
			//根据科室部门查询医生
			function finddoctor(){
				getselect();
			}
			
			//表单验证-挂号
			function rgtFormValidate(){
				$("#validation-form2").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	departmentid:"required"
				    },
				    messages:{
				      	departmentid:"这是必选字段"	      	
				    },
				    
				    highlight: function (e) {
						$(e).closest('.control-group').removeClass('info').addClass('error');
					},
			
					success: function (e) {
						$(e).closest('.control-group').removeClass('error').addClass('info');
						$(e).remove();
					},
					//重写提交方式
					submitHandler:function(){
						rgtSubmit();
					}
			    });
			}
			
			//表单提交-挂号
			function rgtSubmit(){
				swal({
				  	title: "是否挂号?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					document.forms[1].submit();
				});
			}
			
			//删除确认提示
		  	function deleterigster(id){
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
