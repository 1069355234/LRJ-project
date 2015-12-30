<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<link rel="stylesheet" href="${ctx}/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${ctx}/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/js/system/role/edit.js"></script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/role/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${role.id}"
			name="roleFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">角色名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkRole"
							placeholder="请输入角色名" name="roleFormMap.name" id="name" value="${role.name}"/>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">roleKey</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							placeholder="请输入roleKey" name="roleFormMap.roleKey" id="roleKey" value=${role.roleKey}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">父级角色</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							placeholder="请选择父级角色" value="${role.parentName }" readonly="readonly" style="cursor: default;" id="parentId" onclick="showZtree()">
						<input type="hidden" name="roleFormMap.parentId" id="parentIdVal" value="${role.parentId }"/>
					</div>
					<ul id="treeDemo" class="ztree form-control checkacc" style="width: 452px; height: 100px;margin-left: 100px; overflow: auto;display: none;"></ul>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">描述</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入角色描述"
							name="roleFormMap.description" id="description" value="${role.description }">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">角色状态</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
								class="btn btn-sm btn-default dropdown-toggle">
								<span class="dropdown-label"><c:if test="${role.state eq 0}">是</c:if><c:if test="${role.state eq 1}">否</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
										name="roleFormMap.state" value="0"<c:if test="${role.state eq 0}"> checked="checked"</c:if>>是</a></li>
								<li class="active"><a href="#"><input type="radio"
										name="roleFormMap.state" value="1" <c:if test="${role.state eq 1}"> checked="checked"</c:if>>否</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
			</div>
			<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer>
	</section>
	</form>
	<script type='text/javascript'>
		/* $(function(){
			$("from input[name='enable'][value='${role.enable}']").attr("checked","checked");
			alert("input[name='enable'][value='${role.enable}']");
		}); */
	</script>
</body>
</html>