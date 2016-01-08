var pageii = null;
var grid = null;
$(function() {

	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "userName",
			name : "用户名",
			isSort:true,
		}, {
			colkey : "accountName",
			name : "账号",
			isSort:true,
		}, {
			colkey : "region",
			name : "负责区域",
			isSort:true,
		}, {
			colkey : "roleName",
			name : "所属角色"
		}, {
			colkey : "lowerUsers",
			name : "下属员工"
		}, {
			colkey : "createTime",
			name : "创建时间",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		} , {
			colkey : "accountName",
			name : "定位",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a herf='javascript:void(0)' onclick='showPlace(\""+data+"\")' style='cursor:pointer;color:blue;'>查看定位</a>";
			}
		}],
		jsonUrl : rootPath + '/lowuser/findByPage.shtml?flag=byRole',
		checkbox : false,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

});

function showPlace(accountName){
	var url = rootPath + "/lowuser/getLocation.shtml";
	var location = CommnUtil.ajax(url, {"accountName":accountName}, "json");
	if('没有结果!' == location){
		layer.alert('暂无定位信息', {
			skin:'layui-layer-molv'
		});
		return;
	}
	var li = $("<li>><a href='javascript:void(0)'>地图定位</a></li>");
	$("#topli").append(li);
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/lowuser/goToMapLocation.shtml",{"accountName":accountName});
}
