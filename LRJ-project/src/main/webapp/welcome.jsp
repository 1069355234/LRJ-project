<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <script type="text/javascript">

 	var data = CommnUtil.ajax("<%=request.getContextPath()%>/lowuser/getAllLowerUsers.shtml", {}, "json");
 	if(null == data || data.length == 0){
 		$("#allmap").text("暂无数据");
 	}else{
 		// 百度地图API功能
 		var map = new BMap.Map("allmap");
 		var opts = {
 				  width : 200,     // 信息窗口宽度
 				  height: 100,     // 信息窗口高度
 				  title : "<span style='color:#1E90FF'>员工定位信息</span>" , // 信息窗口标题
 				  enableMessage:true,//设置允许信息窗发送短息
 				  message:""
 		}

 		map.centerAndZoom(new BMap.Point(116.331398,39.897445),11);
 		map.enableScrollWheelZoom(true);

 		map.setCenter("江苏");
 		map.setZoom(7);

 		for(var i=0;i<data.length;i++){
 			if(null == data[i].longitude || null == data[i].latitude){
 				continue;
 			}
 			var longitude = data[i].longitude;
 			var latitude = data[i].latitude;
 			eval("var new_point_"+i+" = new BMap.Point("+longitude+","+latitude+")");
 			eval("var marker_"+i+" = new BMap.Marker(new_point_"+i+")");  // 创建标注
 	 		map.addOverlay(eval("marker_"+i));              // 将标注添加到地图中
 	 		map.panTo(eval("new_point_"+i));
 	 		var infoWindow = new BMap.InfoWindow("员工["+data[i].userName+"]的最近一次定位时间："+data[i].locationTime, opts);  // 创建信息窗口对象
 	 		eval("marker_"+i).addEventListener("click", function(){
 	 		map.openInfoWindow(infoWindow,eval("new_point_"+i)); //开启信息窗口
 	 		});
 		}

 	}

</script>
<div id="allmap" style="width:100%;height:100%;text-align: center;color:red;"></div>

