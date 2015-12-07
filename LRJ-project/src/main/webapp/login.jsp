<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf" %>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

</style>
<script>
	window.onload = function() {
		var w = document.documentElement.clientWidth;//可见区域宽度
		var h = document.documentElement.clientHeight;//可见区域高度
		$("body").css("width",w + "px");
		$("body").css("height",h + "px");
	}
</script>
<body>
	<div style="width: 100%; height: 50%; background-color: #40454B;">
		<div style="width: 45%;height: 100%;float: left;padding-left:42%;padding-top: 260px;">
			<img width="40px;" title="翼龙贷" alt="翼龙贷" src="/LRJ-project/admin_files/logo.png">
		</div>
		<div style="width:55%;height:100%;float: left;font-size:45px;font-weight:bold;font-family:YouYuan;  padding-left: 0%;padding-top:249px;">
			<span>ELONGCN</span>
		</div>
	
	</div>
	<div style="width: 100%; height: 50%; background-color: #666C78;"></div>
</body>
</html>