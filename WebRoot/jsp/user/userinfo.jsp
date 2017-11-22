<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!--basic styles-->

		<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
		
		<style>
			.main-content{margin-left:0;}
			.page-content{padding-bottom:10px;!important;}
			.content-div{margin:0 auto; width:70%; min-width:930.188px; border:1px solid #e2e2e2; }
			table{width:100%;}
			.tr-b{border-bottom: 1px solid #e2e2e2;}
			.td-l,.td-r,.td-r-b{
				height:50px;
				text-align:center; 
				font-size:16px;
				line-height: 50px;
				margin:0px;
			}
			.td-r-b{width:30%;}
			.td-l{width:10%; min-width:85px; border-right:1px solid #e2e2e2; font-weight:bold;}
			.td-r{width:30%; min-width:250px; border-right:1px solid #e2e2e2;}
		</style>
	
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							个人信息
						</h1>
					</div><!--/.page-header-->

						<div class="content-div">
							<table>
								<tr class="tr-b">
									<td class="td-l">个人编号</td>
									<td class="td-r">${user.employeecode}</td>
									<td class="td-l">真实姓名</td>
									<td class="td-r">${user.employeename}</td>
									<td rowspan="5" colspan="2">
										<img style="min-width:210px; width:100%; height:262px;" src="${user.picture}"/>
									</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">拼音简码</td>
									<td class="td-r">${user.pinyincode}</td>
									<td class="td-l">身份证号</td>
									<td class="td-r">${user.idcard}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">医务职称</td>
									<td class="td-r">${user.jobtitlename}</td>
									<td class="td-l">管理职务</td>
									<td class="td-r">${user.positionname}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">所属科室</td>
									<td class="td-r">${user.departmentname}</td>
									<td class="td-l">联系电话</td>
									<td class="td-r">${user.tel}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">电子邮件</td>
									<td class="td-r">${user.email}</td>
									<td class="td-l">政治面貌</td>
									<td class="td-r">${user.politicsstatusname}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">出生日期</td>
									<td class="td-r"><fmt:formatDate value="${user.birthday}"/></td>
									<td class="td-l">入职时间</td>
									<td class="td-r"><fmt:formatDate value="${user.inductiontime}"/></td>
									<td class="td-l">性别</td>
									<td class="td-r-b">${user.sex == 1 ? "男" : "女"}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">最高学历</td>
									<td class="td-r">${user.maxeducationname}</td>
									<td class="td-l">学习专业</td>
									<td class="td-r">${user.majorname}</td>
									<td class="td-l">工作状态</td>
									<td class="td-r-b">${user.workstatus == 1 ? "在职" : "离职"}</td>
								</tr>
								<tr class="tr-b">
									<td class="td-l">是否医生</td>
									<td class="td-r">${user.isdoctor == 1 ? "是" : "不是"}</td>
									<td class="td-l">是否护士</td>
									<td class="td-r">${user.isnurse == 1 ? "是" : "不是"}</td>
									<td class="td-l">操作员</td>
									<td class="td-r-b">${user.isoperator == 1 ? "是" : "不是"}</td>
								</tr>
								<tr>
									<td class="td-l">备注</td>
									<td class="td-r">${user.note}</td>
									<td class="td-l">联系地址</td>
									<td colspan="3" class="td-r-b">${user.address}</td>
								</tr>
							</table>
						</div>
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->
	</body>
</html>
