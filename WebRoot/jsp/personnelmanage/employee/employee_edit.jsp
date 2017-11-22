<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<style>
			.controls-radio{width:74.34%;display:inline-block;min-width:200px;}
			.date-picker{display:block !important;}
			.add-on{position: relative; top:-30px; left:14%; z-index:3000;z-index:1;}
		</style>
	
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							员工档案
							<small>
								<i class="icon-double-angle-right"></i>
								修改员工信息
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/employeeController/edit.do" method="post" enctype="multipart/form-data">
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button class="btn btn-small" type="button" onclick="javascript:location.href='${ctx}/employeeController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>

							<input type="hidden" name="id" value="${employee.id}">
							<button class="btn btn-small btn-primary" type="submit">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">人员编号</label>
									<div class="controls controls-m">
										<input type="text" name="employeecode" value="${employee.employeecode}"/>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">拼音简码</label>
									<div class="controls controls-m">
										<input type="text" id="pinyincode" name="pinyincode" value="${employee.pinyincode}" readonly="readonly"/>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医务职称</label>
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="jobtitleid">
											<option value="0" />
											<c:forEach var="item" items="${jobtitles}">
												<option <c:if test="${employee.jobtitleid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">所属科室</label>	
									<div class="controls controls-m">
										<select id="department" class="chzn-select" data-placeholder="-请选择-" name="departmentid">
											<option id="all" value="" />
											<c:forEach var="item" items="${departments}">													
												<option <c:if test="${employee.departmentid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.departmentname}
											</c:forEach>
										</select>
									</div>
								</div>
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">人员名称</label>
									<div class="controls controls-m">
										<input type="text" id="employeename" name="employeename" value="${employee.employeename}" onkeyup="getpinyin()"/>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">身份证号</label>
									<div class="controls controls-m">
										<input type="text" name="idcard" value="${employee.idcard}"/>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">管理职务</label>
									<div class="controls controls-m">
										<select id="position" class="chzn-select" data-placeholder="-请选择-" name="positionid" onchange="findDepartment()">
											<option value="0" />
											<c:forEach var="item" items="${positions}">
												<option <c:if test="${employee.positionid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">工作状态</label>
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="workstatus" onchange="getwork()">
											<option value="0" />
											<option <c:if test="${employee.workstatus == 1}">selected="selected"</c:if> value="1" />在职
											<option <c:if test="${employee.workstatus == 2}">selected="selected"</c:if> value="2" />离职											
										</select>
									</div>
								</div>
							</div><!--/span-->
	
							
							<div class="span4">
								<div class="control-group control-group-m">
									<div class="controls controls-m">
										<input type="file" name="file" id="btn_file" style="display: none">
										<img style="width:150px; height:170px; " id="img_file" onclick="F_Open_dialog()" src="${employee.picture}">
										<c:if test="${employee.picture == null}">
											<a id="a_file" href="#" style="position:relative; left:-117px; text-decoration:none;" onclick="F_Open_dialog()">点击添加图片</a>
										</c:if>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">最高学历</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="maxeducationid">
											<option value="0" />
											<c:forEach var="item" items="${maxeducations}">
												<option <c:if test="${employee.maxeducationid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">学习专业</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="majorid">
											<option value="0" />
											<c:forEach var="item" items="${majors}">
												<option <c:if test="${employee.majorid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">政治面貌</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" data-placeholder="-请选择-" name="politicsstatusid">
											<option value="0" />
											<c:forEach var="item" items="${politicsstatuss}">
												<option <c:if test="${employee.politicsstatusid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">电子邮件</label>
	
									<div class="controls controls-m">
										<input type="text" name="email" value="${employee.email}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">联系电话</label>
	
									<div class="controls controls-m">
										<input type="text" name="tel" value="${employee.tel}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">人员性别</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="sex" type="radio" value="1" <c:if test="${employee.sex == 1}">checked="true"</c:if> />
												<span class="lbl"> 男</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="sex" type="radio" value="2" <c:if test="${employee.sex == 2}">checked="true"</c:if> />
												<span class="lbl"> 女</span>
											</label>
										</div>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">操作员</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isoperator" type="radio" value="1" <c:if test="${employee.isoperator == 1}">checked="true"</c:if> />
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isoperator" type="radio" value="2" <c:if test="${employee.isoperator == 2}">checked="true"</c:if> />
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">是否医生</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isdoctor" type="radio" value="1" <c:if test="${employee.isdoctor == 1}">checked="true"</c:if> />
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isdoctor" type="radio" value="2" <c:if test="${employee.isdoctor == 2}">checked="true"</c:if> />
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">是否护士</label>
	
									<div class="controls controls-m">
										<div class="controls-radio">
											<label style="display:inline-block;">
												<input name="isnurse" type="radio" value="1" <c:if test="${employee.isnurse == 1}">checked="true"</c:if> />
												<span class="lbl"> 是</span>
											</label>
		
											<label style="display:inline-block;">
												<input name="isnurse" type="radio" value="2" <c:if test="${employee.isnurse == 2}">checked="true"</c:if> />
												<span class="lbl"> 否</span>
											</label>
										</div>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">出生日期</label>
	
									<div class="controls controls-m">
										<span class="text-m" >
											<div class="row-fluid input-append">
												<input class="span10 date-picker" name="birthday" style="width:193px;" type="text" data-date-format="yyyy-mm-dd" 
												value='<fmt:formatDate pattern="yyyy-MM-dd" value="${employee.birthday}"/>'/>
												<span class="add-on" style="float:right;">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</span>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">入职日期</label>
	
									<div class="controls controls-m">
										<span class="text-m" >
											<div class="row-fluid input-append">
												<input class="span10 date-picker" name="inductiontime" style="width:193px;" type="text" data-date-format="yyyy-mm-dd" 
												value='<fmt:formatDate pattern="yyyy-MM-dd" value="${employee.inductiontime}"/>' />
												<span class="add-on" style="float:right;">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</span>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">离职日期</label>
	
									<div class="controls controls-m">
										<span class="text-m" >
											<div class="row-fluid input-append">
												<input class="span10 date-picker" name="dimissiontime" style="width:193px;" type="text" 
												data-date-format="yyyy-mm-dd" value="${employee.dimissiontime}" 
												<c:if test="${employee.workstatus == 1}">disabled="disabled"</c:if> />
												<span class="add-on" style="float:right;">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</span>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>							
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">联系地址</label>
	
									<div class="controls controls-m">
										<input type="text" name="address" value="${employee.address}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">备注</label>
	
									<div class="controls controls-m">
										<input type="text" name="note" value="${employee.note}"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
					</form><!-- /.form -->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<script type="text/javascript">
			$(function() {
				//图片转换
				$("#btn_file").change(function() {
					var $file = $(this);
					var fileValue = document.getElementById("btn_file").value;
					var fileObj = $file[0];
					var windowURL = window.URL || window.webkitURL;
					var dataURL;
					var $img = $("#img_file");
					var patn = /\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/;
					if(fileValue=="") return;
					if(patn.test(fileValue)){
						if(fileObj && fileObj.files && fileObj.files[0]){
							dataURL = windowURL.createObjectURL(fileObj.files[0]);
							$img.attr('src',dataURL);
						}else{
							dataURL = $file.val();
							var imgObj = document.getElementById("img_file");
							imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
							imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
						}
						$("#a_file").css('display','none');
					}
					else{
						swal({ 
							    title: "这货不是图片",
							    text: "图片类型必须是(gif、jpeg、jpg、png)其中一种", 
							    type: "warning",   
							    timer: 3000
							});
					}
				});
				
				//是否医生单选框，若是医生则不是护士，二选一
				$("input[name='isdoctor']").click(function(){
					if($(this).val() == 1){
						$("input[name='isnurse'][value=2]").prop("checked","checked");
					}else{
						$("input[name='isnurse'][value=1]").prop("checked","checked");
					}
				});
				
				//是否护士单选框，若是护士则不是医生，二选一
				$("input[name='isnurse']").click(function(){
					if($(this).val() == 1){
						$("input[name='isdoctor'][value=2]").prop("checked","checked");
					}else{
						$("input[name='isdoctor'][value=1]").prop("checked","checked");
					}
				});
				
				//开启表单验证
				formValidate();				
			});
			
			//点击选择图片
			function F_Open_dialog() 
			{ 
				$("#btn_file").click(); 
			}
			
			//获取拼音码
			function getpinyin(){
				$.post("${ctx}/passController/getpinyin.do",
				{zhname:$("#employeename").val()},
				function(data){	
					$("#pinyincode").val(data.pinyincode);
				});
			}
			
			//根据职务id查询科室部门
			 function findDepartment(){
				$("#all").nextAll().remove();
				$.post("${ctx}/departmentController/getdptbypid.do",
				{id:$("#position").val()},
				function(data){					
					$.each(data,function(name,value) {
						$("#department").append("<option value='"+value['id']+"'>"+value['departmentname'] + "</option>");
					});
					$("#department").val("");
					$("#department").trigger("liszt:updated");
            		$("#department").chosen();
				});
			}
			
			//若工作状态为2(离职)，则离职日期选项框可用，反之不可用且清空
			function getwork(){
				if($("select[name='workstatus']").val() == 2){
					$("input[name='dimissiontime']").removeAttr("disabled");
				}else{
					$("input[name='dimissiontime']").val("");
					$("input[name='dimissiontime']").attr("disabled", "disabled");
				}
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	employeecode:"required",
				   	  	employeename:"required",
				   	  	loginpsw:"required",
				   	  	psw:{
				   	  		required:true,
				   	  		equalTo:"#loginpsw"
				   	  	},
				   	  	idcard:"required",
				   	  	jobtitleid:"required",
				   	  	positionid:"required",
				   	  	departmentid:"required",
				   	  	workstatus:"required",
				   	  	tel:"required",
				   	  	sex:"required",
				   	  	isoperator:"required",
				   	  	isdoctor:"required",
				   	  	isnurse:"required",
				   	  	birthday:"required",
				   	  	inductiontime:"required",
				   	  	maxeducationid:"required",
				   	  	majorid:"required",
				   	  	politicsstatusid:"required",
				   	  	address:"required"
				    },
				    messages:{
				      	jobtitleid:"这是必选字段",
				      	positionid:"这是必选字段",
				      	departmentid:"这是必选字段",
				      	workstatus:"这是必选字段",
				      	sex:"这是必选字段",
				      	isoperator:"这是必选字段",
				      	isdoctor:"这是必选字段",
				      	isnurse:"这是必选字段",
				      	birthday:"这是必选字段",
				      	inductiontime:"这是必选字段",
				      	maxeducationid:"这是必选字段",
				      	majorid:"这是必选字段",
				      	politicsstatusid:"这是必选字段" 	
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
