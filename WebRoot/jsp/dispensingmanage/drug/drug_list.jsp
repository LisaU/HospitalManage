<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
		<%@include file="../../common/list-btn-limit.jsp" %>
		<style>
			.dropdown-menu>a{width:auto;}
			.modal{left:58%;top:30% !important;}
			.ace-spinner{width:90%;}
			.input-append{width:100%;}
			.input-mini{width:83% !important;}
		</style>	
	</head>

	<body>
		<div class="main-container container-fluid">			

			<div class="main-content">
				

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							药品档案
							<input id="gritter-light" checked="" type="checkbox" class="ace-switch ace-switch-5" />
						</h1>
					</div><!--/.page-header-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">药品名称</label>

								<div class="controls controls-l">
									<input type="text" id="drugname" onkeyup="search()"/>
								</div>
							</div>
						</div><!--/span-->									

						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">药品编号</label>

								<div class="controls controls-l">
									<input type="text" id="drugcode" onkeyup="search()"/>
								</div>
							</div>
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">医学编号</label>

								<div class="controls controls-l">
									<input type="text" id="medicalsciencecode" onkeyup="search()"/>
								</div>
							</div>
						</div><!--/span-->	
					</div><!--/.row-fluid-->
					
					<div class="row-fluid">
						<div></div>
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">拼音码</label>

								<div class="controls controls-l">
									<input type="text" id="pinyincode" onkeyup="search()"/>
								</div>
							</div>
						</div><!--/span-->						
															
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">厂商名称</label>

								<div class="controls controls-l">
									<input type="text" id="manufacturer" onkeyup="search()"/>
								</div>
							</div>
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">供应商</label>

								<div class="controls controls-l">
									<select class="chzn-select" id="supplier" onchange="search()">
										<option value="0" />全部
										<c:forEach var="item" items="${suppliers}">
											<option value="${item.id}" />${item.suppliername}
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
								<label class="control-label control-label-m">使用状态</label>

								<div class="controls controls-l">
									<select class="chzn-select" id="usestatus" onchange="search()">
										<option value="0" />全部
										<option value="1" />使用
										<option value="2" />停用
										<option value="3" />只销
										<option value="4" />停销
									</select>
								</div>
							</div>
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">
								<label class="control-label control-label-m">收费类别</label>

								<div class="controls controls-l">
									<select class="chzn-select" id="chargetype" onchange="search()">
										<option value="0" />全部
										<c:forEach var="item" items="${chargetypes}">
											<option value="${item.id}" />${item.typename}
										</c:forEach>
									</select>
								</div>
							</div>
						</div><!--/span-->
						
						<div class="span4">
							<div class="control-group control-group-m">
								<div class="controls controls-l">
									<button class="btn btn-small btn-success btn-add" onclick="javascript:location.href='${ctx}/drugController/toadd.do';">
										<i class="icon-share-alt"></i>
										新增
									</button>
									<button id="btnSubmit3" type="button" style="display: none" onclick="bbb()">隐藏的提交按钮</button>
								</div>
							</div>
						</div><!--/span-->
					</div><!--/.row-fluid-->				
					
					
					<div style="border-bottom:1px dotted #e2e2e2; margin-bottom:10px;"></div>	

					<table id="imgtable" class="table" style="overflow:auto;">
						<thead>
							<tr style="background:#fff;">
								<th>图片</th>
								<th>编码</th>
								<th>药品名称</th>
								<th>拼音简码</th>
								<th>药品类型</th>
								<th>规格</th>
								<th>单位</th>
								<th>零售价</th>
								<th>是否医保</th>
								<th>医保价格</th>
								<th>库存数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="datas">
							
						</tbody>			
					</table>
					<%@include file="../../common/pagingmenu.jsp" %>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
		
		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->
  		
  		<div  class="modal fade" id="addCountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:20%;min-width:280px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<form id="validation-form1" style="margin:0;" action="${ctx}/drugController/addInventoryquantity.do" method="post">
						<div class="modal-header">
							<h3 class="modal-title" id="myModalLabel">
								添加库存
							</h3>
						</div>
						<div style="padding-bottom:0; overflow:auto; max-height:300px;" class="modal-body">
					    	<input type="text" class="input-mini" id="spinner4" name="inventoryquantity"/>
					    	<div class="space-6"></div>
					    	<input type="hidden" id="addid" name="id">
						</div>
						<div class="modal-footer">
							<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
							<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="submitAddCount()">确定</button>
							<button id="btnSubmit1" type="submit" style="display: none">隐藏的提交按钮</button>
						</div>
					</form>
				</div>
			</div>
  		</div>
		
		<!-- ----------------------------------------------------------------------模态框-------------------------------------------------------------------- -->
  		
  		<div  class="modal fade" id="reduceCountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:20%;min-width:280px;">
			<div class="modal-dialog">	
				<div class="modal-content form-horizontal">
					<form id="validation-form2" style="margin:0;" action="${ctx}/drugController/reduceInventoryquantity.do" method="post">
						<div class="modal-header">
							<h3 class="modal-title" id="myModalLabel">
								库存报损
							</h3>
						</div>
						<div style="padding-bottom:0; overflow:auto; max-height:300px;" class="modal-body">
					    	<input type="text" class="input-mini" id="spinner5" name="inventoryquantity"/>
					    	<div class="space-6"></div>
					    	<input type="hidden" id="reduceid" name="id">
						</div>
						<div class="modal-footer">
							<button style="width:110px;" type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
							<button style="width:110px;" class="btn btn-small btn-primary" data-dismiss="modal" onclick="submitReduceCount()">确定</button>
							<button id="btnSubmit2" type="submit" style="display: none">隐藏的提交按钮</button>
						</div>
					</form>
				</div>
			</div>
  		</div>
  		<!-- 参数化,应用在custom_pageload.js -->
		<script type="text/javascript">					
			var ctx = "${ctx}";
			var controller = "/drugController";
			var sumrow;
			var currentpage;
		</script>
  		
		<script type="text/javascript">
			var count;
			$(function(){
				find(1);
				//提交返回信息
				if("${resulttext}" == "add"){
					hint("新增成功！");
				}else if("${resulttext}" == "edit"){
					hint("修改成功！");
				}else if("${resulttext}" == "addCount"){
					hint("添加库存成功！");
				}else if("${resulttext}" == "reduceCount"){
					hint("库存报损成功！");
				}
			});			
			
			//打开添加库存模态框
			function addCount(id){
				$('#addCountModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#addCountModal").css("z-index","6000");				
				$("#addid").val(id);
			}
			
			//打开库存报损模态框
			function reduceCount(id,icount){
				$('#reduceCountModal').modal('show');
				$(".modal-backdrop").css("z-index","5000");
				$("#reduceCountModal").css("z-index","6000");				
				$("#reduceid").val(id);
				count = icount;
			}
			
			//跳转页数
			function find(page){
				var drugname = $("#drugname").val();
				var drugcode = $("#drugcode").val();
				var medicalsciencecode = $("#medicalsciencecode").val();
				var pinyincode = $("#pinyincode").val();
				var manufacturer = $("#manufacturer").val();
				var supplier = $("#supplier").val();
				var usestatus = $("#usestatus").val();
				var chargetype = $("#chargetype").val();
				gettable(drugname,drugcode,medicalsciencecode,pinyincode,manufacturer,supplier,usestatus,chargetype,page);
			}
			
			//查询
			function gettable(drugname,drugcode,medicalsciencecode,
					pinyincode,manufacturer,supplierid,usestatus,chargetypeid,page){
				$.post(ctx + controller + "/datalist.do",
				{drugname:drugname, drugcode:drugcode, medicalsciencecode:medicalsciencecode,
				pinyincode:pinyincode, manufacturer:manufacturer, supplierid:supplierid,
				usestatus:usestatus,chargetypeid:chargetypeid,pagesize:$("#pagesize").val(),
				currentpage:page},
				function(data){					
					$("#datas").html(data);
				});
			}
			
			//搜索
			function search(){
				find(1);
			}
			
			//添加库存确认提示
			function submitAddCount(){
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
					//提交
					$("#btnSubmit1").click();
				});
		  	}
		  	
		  	//库存报损确认提示
			function submitReduceCount(){
		  		swal({
				  	title: "是否保存?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: false
				},
				function(){
					if($("#spinner5").val() > count){
						swal({
						  	title: "错误",
						  	text: "报损数【"+ $("#spinner5").val() +"】不可大于库存数【"+ count +"】！",
						  	type: "error",
						  	confirmButtonClass: "btn-danger",
						  	confirmButtonText: "是",
						  	closeOnConfirm: true
						},
						function(){							
							$('#reduceCountModal').modal('show');
						});
					}else{						
						//提交
						$("#btnSubmit2").click();
					}
				});
		  	}
			
			//删除确认提示
		  	function deletedrug(id){
		  		swal({
				  	title: "是否删除?",
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
