<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="allmap" style="width:100%;height:100%;"></div>
<input type="hidden" id="longitude" value="${location.longitude}"/>
<input type="hidden" id="latitude" value="${location.latitude}"/>
<input type="hidden" id="locationTime" value="${location.locationTime}"/>


 <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.331398,39.897445),11);
	map.enableScrollWheelZoom(true);

	//map.setCenter("江苏");
	map.setZoom(7);

	var new_point = new BMap.Point($("#longitude").val(),$("#latitude").val());
	var marker = new BMap.Marker(new_point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.panTo(new_point);
	
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "<span style='color:#1E90FF'>员工定位信息</span>" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:""
	}
	var infoWindow = new BMap.InfoWindow("该员工的最近一次定位时间："+$("#locationTime").val(), opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
	map.openInfoWindow(infoWindow,new_point); //开启信息窗口
	});
</script>


