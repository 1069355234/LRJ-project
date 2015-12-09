<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#groupsForSelect").dblclick(function() {
			selected();
		});
		$("#selectGroups").dblclick(function() {
			unselected();
		});
	});
	function selected() {
		var selOpt = $("#groupsForSelect option:selected");

		selOpt.remove();
		var selObj = $("#selectGroups");
		selObj.append(selOpt);

		var selOpt = $("#selectGroups")[0];
		ids = "";
		for (var i = 0; i < selOpt.length; i++) {
			ids += (selOpt[i].value + ",");
		}

		if (ids != "") {
			ids = ids.substring(0, ids.length - 1);
		}
		$('#txtGroupsSelect').val(ids);
	}

	function selectedAll() {
		var selOpt = $("#groupsForSelect option");

		selOpt.remove();
		var selObj = $("#selectGroups");
		selObj.append(selOpt);

		var selOpt = $("#selectGroups")[0];
		ids = "";
		for (var i = 0; i < selOpt.length; i++) {
			ids += (selOpt[i].value + ",");
		}

		if (ids != "") {
			ids = ids.substring(0, ids.length - 1);
		}
		$('#txtGroupsSelect').val(ids);
	}

	function unselected() {
		var selOpt = $("#selectGroups option:selected");
		selOpt.remove();
		var selObj = $("#groupsForSelect");
		selObj.append(selOpt);

		var selOpt = $("#selectGroups")[0];
		ids = "";
		for (var i = 0; i < selOpt.length; i++) {
			ids += (selOpt[i].value + ",");
		}

		if (ids != "") {
			ids = ids.substring(0, ids.length - 1);
		}
		$('#txtGroupsSelect').val(ids);
	}

	function unselectedAll() {
		var selOpt = $("#selectGroups option");
		selOpt.remove();
		var selObj = $("#groupsForSelect");
		selObj.append(selOpt);

		$('#txtGroupsSelect').val("");
	}
	
	function closeWin(){
		parent.layer.close(parent.pageii);
	}
	
	function sub(){
		ly.ajax({
			async : false,
			type : "POST",
			data : $("#form").serializeJson(),
			url : rootPath + '/user/assignUsers.shtml',
			dataType : 'json',
			success : function(json) {
				if (json == "success") {
						layer.confirm('分配成功！是否关闭窗口？',{icon: 3,offset: '50px'}, function(index) {
				        	parent.layer.close(parent.pageii);
				        	return false;
 						 });
				} else {
					layer.alert(json,{icon: 2,offset: '-100px'});
				}
				;
			}
		});
	}
</script>
</head>
<body>
<form id="form" name="form" class="form-horizontal" method="post">
	<div class="form-group">
		<input id="txtGroupsSelect" type="hidden"
			value="${txtLowerUserSelect}" name="txtGroupsSelect" />
		<input name="userId" value="${userId }" type="hidden"/>
		<label for="host" class="col-sm-3 control-label"></label>
		<div class="col-sm-9">
			<table class="tweenBoxTable" name="groups_tweenbox"
				id="groups_tweenbox" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td>可选员工</td>
						<td></td>
						<td>已选员工</td>
					</tr>
					<tr>
						<td><select id="groupsForSelect" multiple="multiple"
							class="input-large" style="height: 150px; width: 150px">
								<c:forEach items="${users}" var="key">
									<option value="${key.id}">${key.userName}</option>
								</c:forEach>
						</select></td>
						<td align="center">
							<div style="margin-left: 5px; margin-right: 5px">
								<button onclick="selectedAll()" class="btn btn-primary"
									type="button" style="width: 50px;" title="全选">&gt;&gt;</button>
							</div>
							<div
								style="margin-left: 5px; margin-right: 5px; margin-top: 5px;">
								<button onclick="selected()" class="btn btn-primary"
									type="button" style="width: 50px;" title="选择">&gt;</button>
							</div>
							<div
								style="margin-left: 5px; margin-right: 5px; margin-top: 5px;">
								<button onclick="unselected()" class="btn btn-primary"
									type="button" style="width: 50px;" title="取消">&lt;</button>
							</div>
							<div style="margin-left: 5px; margin-right: 5px; margin-top: 5px">
								<button onclick="unselectedAll()" class="btn btn-primary"
									type="button" style="width: 50px;" title="全取消">&lt;&lt;</button>
							</div>
						</td>
						<td><select id="selectGroups" multiple="multiple"
							class="input-large" name="selectGroups"
							style="height: 150px; width: 150px">
								<c:forEach items="${lowerUsers}" var="key">
									<option value="${key.id}">${key.userName}</option>
								</c:forEach>
						</select></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="doc-buttons" style="text-align: center;">
		<a href="#" class="btn btn-s-md btn-success btn-rounded" onclick="sub()">保存</a>
		<a href="#" class="btn btn-s-md btn-info btn-rounded" onclick="closeWin();">关闭</a>
	</div>
</form>
</body>
</html>