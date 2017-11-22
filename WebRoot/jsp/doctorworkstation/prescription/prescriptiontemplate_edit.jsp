<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<link href="${ctx}/assets/custom/css/custom-part-style.css" rel="stylesheet" />
	</head>

	<body onresize="resize()">
		<div class="main-container container-fluid" style="z-index:3000;">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							处方模板
							<small>
								<i class="icon-double-angle-right"></i>
								修改处方模板
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/prescriptiontemplateController/edit.do" method="post" >
					
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button type="button" class="btn btn-small" onclick="javascript:location.href='${ctx}/prescriptiontemplateController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>
							
							<input type="hidden" name="id" value="${prescription.id}">
							<button type="submit" class="btn btn-small btn-primary" >
								<i class="icon-save"></i>
								保存
							</button>
						</div>					
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板名称</label>
	
									<div class="controls controls-m">
										<input name="templatename" type="text" value="${prescription.templatename}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">医生名称</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="doctor" name="doctorid" data-placeholder="-请选择-" onchange="finddepartment()">
											<option value="0" />
											<c:forEach var="item" items="${doctors}">
												<option <c:if test="${prescription.doctorid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.employeename}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板性质</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" name="natureid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${naturenames}">
												<option <c:if test="${prescription.natureid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方类型</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" name="prescriptiontypeid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${prescriptiontypes}">
												<option <c:if test="${prescription.prescriptiontypeid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">科室名称</label>
	
									<div class="controls controls-m">
										<input id="department" type="text" readonly="readonly" value="${prescription.departmentname}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">模板分类</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" name="classifyid" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${classifynames}">
												<option <c:if test="${prescription.classifyid == item.id}">selected="selected"</c:if> value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方备注</label>
	
									<div class="controls controls-m">
										<input name="note" type="text" value="${prescription.note}"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">处方诊断</label>
	
									<div class="controls controls-m">
										<input name="diagnosis" type="text" value="${prescription.diagnosis}"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
					<!-- ------------------------------------------------分割线--------------------------------------------------------- -->
							
						<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品编号</label>
	
									<div class="controls controls-m">
										<input id="drugcode" type="text" onclick="finddurg()"/>
										<input id="drugid" type="hidden">
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品名称</label>
	
									<div class="controls controls-m">
										<input id="drugname" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">药品规格</label>
	
									<div class="controls controls-m">
										<input id="norms" type="text" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">剂数</label>
	
									<div class="controls controls-m">
										<input id="dosagequantity" type="text"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
						
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">每剂用量</label>
	
									<div class="controls controls-m">
										<input id="eachdosage" type="text"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">用药方式</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="medicineform" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${medicineforms}">
												<option value="${item.id}" />${item.detailname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">用药频率</label>
	
									<div class="controls controls-m">
										<select class="chzn-select" id="medicinefrequency" data-placeholder="-请选择-">
											<option value="0" />
											<c:forEach var="item" items="${medicinefrequencys}">
												<option value="${item.id}" />${item.detailenname}
											</c:forEach>
										</select>
									</div>
								</div>	
							</div><!--/span-->						
	
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">发药总量</label>
	
									<div class="controls controls-m">
										<input id="medicineamount" type="text" />
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->	
	
						<div class="row-fluid">
							<div></div>
							<div class="span3">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">明细备注</label>
	
									<div class="controls controls-m">
										<input id="note" type="text"/>
									</div>
								</div>	
							</div><!--/span-->
							
							<div class="span3"></div>
							<div class="span3"></div>
							
							<div class="span3">
								<div class="control-group control-group-m">
	
									<div class="controls controls-m">
										<button type="button" class="btn btn-small btn-success" style="width:auto;" onclick="addtable()">
											<i class="icon-exchange"></i>
											添加到表格
										</button>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->					
								
						<div>
							<table class="table">
								<thead>
									<tr style="background:#fff;">
										<th>药品编号</th>
										<th>药品名称</th>
										<th>每剂用量</th>
										<th>用药方式</th>
										<th>用药频率</th>
										<th>剂数</th>
										<th>用药总量</th>
										<th>备注</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="detaildatas">
									<c:forEach var="item" items="${details}" varStatus="status">
										<tr>
											<td><input name="detail[${status.index}].id" type="hidden" value="${item.id}"/>${item.drugcode}</td>
											<td><input name="detail[${status.index}].drugid" type="hidden" value="${item.drugid}"/>${item.drugname}</th>
											<td><input name="detail[${status.index}].eachdosage" type="hidden" value="${item.eachdosage}"/>${item.eachdosage}</td>
											<td><input name="detail[${status.index}].medicineformid" type="hidden" value="${item.medicineformid}"/>${item.medicineformname}</td>
											<td><input name="detail[${status.index}].medicinefrequencyid" type="hidden" value="${item.medicinefrequencyid}"/>${item.medicinefrequencyname}</td>
											<td><input name="detail[${status.index}].dosagequantity" type="hidden" value="${item.dosagequantity}"/>${item.dosagequantity}</td>
											<td><input name="detail[${status.index}].medicineamount" type="hidden" value="${item.medicineamount}"/>${item.medicineamount}</td>
											<td><input name="detail[${status.index}].note" type="hidden" value="${item.note}"/>${item.note}</td>
											<td>
												<a class="btn btn-link" href="#" onclick="deletedrug(this)">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>			
							</table>
						</div>
					</form>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<div  class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:60%;min-width:220px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							选择药品
						</h3>
						<div class="nav-search" id="nav-search" style="margin-top:5px;">
							<form class="form-search" />
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="input-small nav-search-input" id="drugcontant" autocomplete="off" onkeyup="drugsearch()"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!--#nav-search-->
					</div>
					<div style="padding-bottom:0;overflow:auto; max-height:300px;" class="modal-body">
				    	<table class="table">
							<thead>
								<tr style="background:#fff;">
									<th>药品编号</th>
									<th>药品名称</th>
									<th>拼音简码</th>
									<th>药品类型</th>
									<th>规格</th>
									<th>单位</th>
									<th>零售价</th>
								</tr>
							</thead>
							<tbody id="drugdatas">
															
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

		<script type="text/javascript">
			$(function() {
				$("#tableleft").css("max-height", $("#tableright").height() + "px");
				
				//开启表单验证
				formValidate();				    		
			});
			
			//窗口大小改变事件
			function resize(){
				$("#tableleft").css("max-height", $("#tableright").height() + "px");
			}			
			
			//打开药品模态框
			function finddurg(){
				getdrugtable('');
				$('#payModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#payModal").css("z-index","6000");
			}
			
			//根据医生查询相应科室并回填
			function finddepartment(){
				$.post("${ctx}/departmentController/findbydid.do",
				{did:$("#doctor").val()},
				function(data){
					$("#department").val(data.dpname);
				});
			}
			
			//加载药品列表
			function getdrugtable(str){
				$.post("${ctx}/drugController/druglist.do",
				{contant:str},
				function(data){
					$("#drugdatas").html(data);
				});
			}
			
			//药品搜索
			function drugsearch(){
				var contant = $("#drugcontant").val();
				getdrugtable(contant);
			}
			
			//药品数据回填
			function drugbackfill(drugid,drugcode,drugname,norms){
				$("#drugid").val(drugid);
				$("#drugcode").val(drugcode);
				$("#drugname").val(drugname);
				$("#norms").val(norms);
				$("#dosagequantity").val('');
				$("#eachdosage").val('');
				$("#medicineform").val(0);
				$("#medicineform").trigger("liszt:updated");
           		$("#medicineform").chosen();
				$("#medicinefrequency").val(0);
				$("#medicinefrequency").trigger("liszt:updated");
           		$("#medicinefrequency").chosen();
				$("#medicineamount").val('');
				$("#note").val('');
				$('#payModal').modal('hide');
			}			
				
			var row = ${not empty details ? fn:length(details) : 0};
			//把药品暂时添加到处方明细列表，以待保存
			function addtable(){
				var drugid = $("#drugid").val();
				var drugcode = $("#drugcode").val();
				var drugname = $("#drugname").val();
				var dosagequantity = $("#dosagequantity").val();
				var eachdosage = $("#eachdosage").val();				
				var medicineformid = $("#medicineform").val();
				var medicineform = $("#medicineform").find("option:selected").text();
				var medicinefrequencyid = $("#medicinefrequency").val();
				var medicinefrequency = $("#medicinefrequency").find("option:selected").text();
				var medicineamount = $("#medicineamount").val();
				var note = $("#note").val();
				$("#detaildatas").append(
					'<tr class="trbc trbc1">'
						+'<td><input name="detail[' + row + '].drugid" type="hidden" value="'+ drugid +'"/>'+ drugcode +'</td>'
						+'<td>'+ drugname +'</td>'
						+'<td><input name="detail[' + row + '].eachdosage" type="hidden" value="'+ eachdosage +'"/>'+ eachdosage +'</td>'
						+'<td><input name="detail[' + row + '].medicineformid" type="hidden" value="'+ medicineformid +'"/>'+ medicineform +'</td>'
						+'<td><input name="detail[' + row + '].medicinefrequencyid" type="hidden" value="'+ medicinefrequencyid +'"/>'+ medicinefrequency +'</td>'
						+'<td><input name="detail[' + row + '].dosagequantity" type="hidden" value="'+ dosagequantity +'"/>'+ dosagequantity +'</td>'
						+'<td><input name="detail[' + row + '].medicineamount" type="hidden" value="'+ medicineamount +'"/>'+ medicineamount +'</td>'
						+'<td><input name="detail[' + row + '].note" type="hidden" value="'+ note +'"/>'+ note +'</td>'
						+'<td><a class="btn btn-link" href="#" onclick="deletedrug(this)">删除</a></td>'+
					'</tr>');
					row++;
			}
			
			//从处方明细列表中删除药品
			function deletedrug(obj){
				$(obj).parent().parent("tr").remove();
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	templatename:"required",
				   	  	doctorid:"required",
				   	  	natureid:"required",
				   	  	prescriptiontypeid:"required",
				   	  	classifyid:"required",
				   	  	diagnosis:"required"
				    },
				    messages:{
				      	doctorid:"这是必选字段",
				      	natureid:"这是必选字段",
				      	prescriptiontypeid:"这是必选字段",
				      	classifyid:"这是必选字段"		      	
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
