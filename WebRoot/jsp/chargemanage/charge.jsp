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

	<body>
		<div class="main-container container-fluid" style="z-index:3000;">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							收费单
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/chargeController/add.do" method="post" >										
					
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方单号</label>
	
									<div class="controls controls-m">
										<input id="prescriptioncode" name="prescriptioncodeid" type="text" onfocus="findprescription()"/>
										<input id="prescriptionid" type="hidden" name="prescriptionid">
									</div>
								</div>
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">收据号</label>
	
									<div class="controls controls-m">
										<input id="quittance" type="text" name="receiptcode" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">状态</label>
	
									<div class="controls controls-m">
										<input id="registerstatus" type="text" readonly="readonly"/>
										<input type="hidden" name="chargestatus">
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3" style="width:72%;">
								<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; width:96%;">
									<span style="margin-left:15px;">病人信息</span>
								</div>
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">病人卡号</label>
			
											<div class="controls controls-m">
												<input id="cardcode" type="text" readonly="readonly" />
											</div>
										</div>
									</div><!--/span-->
	
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">病人姓名</label>
			
											<div class="controls controls-m">
												<input id="patientname" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">参保类型</label>
			
											<div class="controls controls-m">
												<input id="insuretypename" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->					
								</div><!--/.row-fluid-->
								
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">病人性别</label>
			
											<div class="controls controls-m">
												<input id="sex" type="text" readonly="readonly" />
											</div>
										</div>
									</div><!--/span-->
	
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">年龄</label>
			
											<div class="controls controls-m">
												<input id="age" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">处方时间</label>
			
											<div class="controls controls-m">
												<input id="prescriptiontime" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->					
								</div><!--/.row-fluid-->
								
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">就诊科室</label>
			
											<div class="controls controls-m">
												<input id="departmentname" type="text" readonly="readonly" />
											</div>
										</div>
									</div><!--/span-->
	
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">就诊医生</label>
			
											<div class="controls controls-m">
												<input id="employeename" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->							
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">会员类型</label>
			
											<div class="controls controls-m">
												<input id="viptypename" type="text" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->	
								</div><!--/.row-fluid-->
								
								
								<div class="row-fluid">
									<div id="tableleft" class="span3" style="width:99.5%; height:250px; overflow:auto;min-width:230px;">
										<div class="control-group control-group-m" style="width:95.1%;">
											<div class="controls controls-m">
												<table class="table" style="overflow:auto;">
													<thead>
														<tr style="background:#fff;">
															<th>明细类型</th>
															<th>药品编码</th>
															<th>药品名称</th>
															<th>用药总量</th>
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
							</div><!--/span-->
							
							<div class="span3" style="margin-left: 0px;">
								<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px; ">
									<span style="margin-left:15px;">统计信息</span>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">上位付费</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" style="text-align:center;" value="${lastcharge.patientname}"/>
									</div>								
									
									<label class="control-label control-label-m">上位时间</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" style="text-align:center;" value="<fmt:formatDate value="${lastcharge.chargetime}" pattern="yyyy-MM-dd hh:mm:ss"/>"/>
									</div>								
									
									<label class="control-label control-label-m">上位金额</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" style="text-align:center;" value="${lastcharge.cost}"/>
									</div>								
									
									<label class="control-label control-label-m">操作人员</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" style="text-align:center;" value="${lastcharge.operationpersonname}"/>
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
										<input type="text" readonly="readonly" style="text-align:center;" value="${lastcharge.totalcount}"/>
									</div>								
									
									<label class="control-label control-label-m">合计金额</label>
	
									<div class="controls controls-m">
										<input type="text" readonly="readonly" style="text-align:center;" value="${lastcharge.totalsum}"/>
									</div>
								</div>
							</div>
						</div><!--/.row-fluid-->			
						
						
						<!-- ------------------------------------------------分割线--------------------------------------------------------- -->					
								
						<div class="row-fluid">
							<div></div>
							<div class="span3" style="width:72%;">
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">折扣(%)</label>
			
											<div class="controls controls-m">
												<input id="typediscount" type="text" name="discount" readonly="readonly"/>
											</div>
										</div>
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">优惠(%)</label>
			
											<div class="controls controls-m">
												<input id="favorable" type="text" name="privilege" onkeyup="setfavorable()"/>
											</div>
										</div>	
									</div><!--/span-->
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">折前应收</label>
			
											<div class="controls controls-m">
												<input id="before" type="text" name="beforereceivable" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->
								
								<div class="row-fluid">
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">医保可付</label>
			
											<div class="controls controls-m">
												<input id="medicarepay" type="text" name="medicarecanpay" readonly="readonly" />
											</div>
										</div>
									</div><!--/span-->
			
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">应收</label>
			
											<div class="controls controls-m">
												<input id="receivable" type="text" name="cost" readonly="readonly"/>
											</div>
										</div>	
									</div><!--/span-->
									
									<div class="span4">
										<div class="control-group control-group-m">
											<label class="control-label control-label-m">实收</label>
			
											<div class="controls controls-m">
												<input id="realitycharge" name="realitychargea" type="text" onkeyup="charge()"/>
											</div>
										</div>	
									</div><!--/span-->
								</div><!--/.row-fluid-->
							</div><!--/span-->
							
							<div class="span3" style="margin-left: 0px;">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">折后应收</label>
			
									<div class="controls controls-m">
										<input id="behind" type="text" name="afterreceivable" readonly="readonly"/>
									</div>
									
									<label class="control-label control-label-m">找零</label>
			
									<div class="controls controls-m">
										<input id="change" type="text" readonly="readonly" <fmt:formatNumber value="" pattern="#,#00.00#"/> />
									</div>
								</div>
							</div>
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div class="span12">
								<div class="modal-footer" style="background:#f5f5f5; width:96%; position:fixed;bottom:0; z-index:4000;">
									<div id="bigbtn">
										<button id="chargesubmit" type="submit" class="btn btn-small btn-success btn-add">
											<i class="icon-dollar"></i>
											收费
										</button>
	
										<button type="button" class="btn btn-small btn-info btn-history" onclick="javascript:location.href='${ctx}/chargeController/tohistory.do';">
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

		<div class="modal fade" id="prescriptionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择病人
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="contant" autocomplete="off" onkeyup="search()" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>处方单号</th>
									<th>挂号单号</th>
									<th>病人卡号</th>
									<th>病人姓名</th>
									<th>性别</th>
									<th>就诊科室</th>
									<th>就诊医生</th>
									<th>处方时间</th>
								</tr>
							</thead>
							<tbody id="datas">
										
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
  		
  		<!-- 参数化 -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/chargeController";
		</script>

		<script type="text/javascript">			
			//格式化数字（金额）
			function fmoney(s, n)
			{
			   n = n > 0 && n <= 20 ? n : 2;
			   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
			   var l = s.split(".")[0].split("").reverse(),
			   r = s.split(".")[1];
			   t = "";
			   for(i = 0; i < l.length; i ++ )
			   {
			      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
			   }
			   return t.split("").reverse().join("") + "." + r;
			}
			
			$(function() {
				//右上角提示信息
				if("${resulttext}" == "add"){
					hint("收费成功！");
				}else if("${resulttext}" == "edit"){
					hint("退款成功！");
				}
				
				//获取日期
				getDate();
				//设置一秒更新一次时间
				setInterval("getDate()", 1000);
				//生成收费单
				var quittancecode = "SFD" + (Math.floor(Math.random() * (99999999 - 10000000) + 10000000));
				$("#quittance").val(quittancecode);
				
				//开启表单验证
				formValidate();				
			});
			
			//获取当前时间
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
			
			//打开处方模态框
			function findprescription(){
				gettable('');
				$("#prescriptionModal").modal("show");
				$(".modal-backdrop").css("z-index","5000");
				$("#prescriptionModal").css("z-index","6000");
			}
			
			//获取处方数据
			function gettable(str){
				$.post(ctx + controller + "/prescripttablelist.do",
				{contant:str},
				function(data){
					$("#datas").html(data);
				});
			}
			
			//搜索处方
			function search(){
				var contant = $("#contant").val();
				gettable(contant);
			}
			
			var receivablesum = 0;
			//数据回填
			function backfill(id,prescriptioncode,cardcode,patientname,insuretypename,
				sex,age,departmentname,employeename,viptypename,prescriptiontime,registerstatus,
				typediscount,beforediscountsum,medicarepay,behinddiscountsum,privilege,refund,receiptcode){
				$.post(ctx + "/prescriptionController/chargedetailtablelist.do",
				{id:id,status:1},
				function(data){
					$("#detailtatas").html(data);
				});
				var quittancecode = "SFD" + (Math.floor(Math.random() * (99999999 - 10000000) + 10000000));				
				$("#quittance").val(registerstatus == 6 ? receiptcode : quittancecode);
				$("#prescriptionid").val(id);
				$("#prescriptioncode").val(prescriptioncode);
				$("#cardcode").val(cardcode);
				$("#patientname").val(patientname);
				$("#insuretypename").val(insuretypename);
				$("#sex").val((sex == 1 ? "男" : "女"));
				$("#age").val(age);
				$("#prescriptiontime").val(prescriptiontime);
				$("#departmentname").val(departmentname);
				$("#employeename").val(employeename);
				$("#viptypename").val(viptypename);
				$("#registerstatus").val(registerstatus == 6 ? "退款" : "正常收费");
				$("input[name='chargestatus']").val(registerstatus == 6 ? "2" : "1");
				$("#typediscount").val(typediscount);
				$("#before").val(beforediscountsum);
				$("#medicarepay").val(medicarepay);
				$("#behind").val(fmoney(behinddiscountsum,2));
				$("#receivable").val(registerstatus == 6 ? fmoney(refund,2) : fmoney(behinddiscountsum,2));
				$("#receivable").parent().prev().html(registerstatus == 6 ? "应退" : "应收");
				receivablesum = fmoney(behinddiscountsum,2);
				$("#favorable").val(registerstatus == 6 ? privilege : 0);
				$("#chargesubmit").html(registerstatus == 6 ? "<i class='icon-reply'></i> 退款" : "<i class='icon-dollar'></i> 收费");				
				var change = fmoney(eval(receivablesum - ($("#favorable").val() * $("#before").val() * 0.01)),2);
				$("#realitycharge").val(registerstatus == 6 ? change : "");
				if(registerstatus == 6){
					$("#favorable").attr("readonly","readonly");
					$("#realitycharge").attr("readonly","readonly");
				}else{
					$("#favorable").removeAttr("readonly");
					$("#realitycharge").removeAttr("readonly");
				}
				$("#change").val(registerstatus == 6 ? 10 : "");
				$("#change").parent().prev().html(registerstatus == 6 ? "手续(%)" : "找零");
				$("#prescriptionModal").modal("hide");
			}
			
			//计算应收
			function setfavorable(){
				var favorable = $("#favorable").val();
				var before = $("#before").val();
				var receivable = receivablesum;
				var change = fmoney(eval(receivable - (favorable * before * 0.01)),2);
				if(favorable == "" || favorable == 0){
					$("#receivable").val(receivablesum);
				}else{
					$("#receivable").val(change <= 0 ? 0 : change);
				}
				if($("#change").val() != ""){
					charge();
				}
			}
			
			//计算找零
			function charge(){
				var receivable = $("#receivable").val();
				var realitycharge = $("#realitycharge").val();
				var change = fmoney(eval(realitycharge - receivable), 2);
				$("#change").val(realitycharge == "" ? 0 : change);
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	prescriptioncodeid:"required",
				   	  	realitychargea:{
				   	  		required:true,
				   	  		number:true
				   	  	}
				    },
				    messages:{
				      	prescriptioncodeid:"这是必选字段"  	
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
						formSubmit();
					}
			    });
			}
			
			//表单提交
			function formSubmit(){
				swal({
				  	title: "是否保存?",
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
		</script>
	</body>
</html>
