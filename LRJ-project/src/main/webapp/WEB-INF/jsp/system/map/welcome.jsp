<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <script type="text/javascript">

 	var data = CommnUtil.ajax("<%=request.getContextPath()%>/lowuser/getAllLowerUsers.shtml", {}, "json");
 	if(null == data || data.length == 0){
 		$("#allmap").text("暂无下属员工定位数据");
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
 			(function(x){
	 			var longitude = data[x].longitude;
	 			var latitude = data[x].latitude;
	 			var point = new BMap.Point(longitude,latitude);
	 			var marker = new BMap.Marker(point);  // 创建标注
	 	 		map.addOverlay(marker);              // 将标注添加到地图中
	 	 		map.panTo(point);
	 	 		var infoWindow = new BMap.InfoWindow("员工["+data[x].userName+"]的最近一次定位时间："+data[x].locationTime, opts);  // 创建信息窗口对象
	 	 		marker.addEventListener("click", function(){
	 	 			map.openInfoWindow(infoWindow,point); //开启信息窗口
	 	 		});
 			})(i)
 		}

 	}

</script>
<div id="allmap" style="width:100%;height:100%;text-align: center;color:red;"></div>

