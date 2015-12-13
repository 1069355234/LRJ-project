<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.331398,39.897445),11);
	map.enableScrollWheelZoom(true);

	map.setCenter("江苏");
	map.setZoom(7);

	var new_point = new BMap.Point(118.78,32.07);
	var marker = new BMap.Marker(new_point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.panTo(new_point);

	var new_point2 = new BMap.Point(117.18,34.27);
	var marker2 = new BMap.Marker(new_point2);  // 创建标注
	map.addOverlay(marker2);              // 将标注添加到地图中
	map.panTo(new_point);

</script>
<div id="allmap" style="width:100%;height:100%;"></div>

