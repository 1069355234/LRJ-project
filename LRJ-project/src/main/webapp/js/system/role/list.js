var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "主键",
			width : "50px",
			hide : true
		}, {
			colkey : "name",
			name : "角色名"
		}, {
			colkey : "parentName",
			name : "父级角色",
			renderData : function(rowindex,data, rowdata, column) {
				if("" == data){
					return "-";
				}
				return data;
			}
		}, {
			colkey : "state",
			name : "状态",
			width : "100px",
		}, {
			colkey : "roleKey",
			name : "关键字"
		}, {
			colkey : "description",
			name : "描述"
		} ],
		jsonUrl : rootPath + '/role/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addRole").click("click", function() {
		addRole();
	});
	$("#editRole").click("click", function() {
		editRole();
	});
	$("#delRole").click("click", function() {
		delRole();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
});
function editRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/role/editUI.shtml?id=' + cbox
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?roleId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "60%" ],
		content : url
	});
}
function addRole() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px;", "60%" ],
		content : rootPath + '/role/addUI.shtml'
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}

	var isHaveChild = CommnUtil.ajax(rootPath+"/role/isHaveChild.shtml", {ids : cbox.join(",")}, "json");
	if(isHaveChild){
		layer.msg("选中的角色包含子角色，请先删除子角色！");
		return;
	}

	layer.confirm('删除角色后，和该角色关联的信息将一起删除！是否删除？', function(index) {
		var url = rootPath + '/role/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
