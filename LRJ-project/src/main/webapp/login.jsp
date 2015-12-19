<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf" %>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="icon" href="${ctx }/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon">
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

	function submit(){
		var username = $("input[name='username']").val();
		var pwd = $("input[name='password']").val();
		if("" == username || "" == pwd){
			$("#info").text("用户名或密码不能为空");
			return;
		}
		$("form").submit();
	}
</script>
<body>
	<div style="width: 100%; height: 50%; background-color: #40454B;">
		<div style="width: 100%;text-align: center; height: 100%;padding-top: 260px;">
			<span style="height: 40px;display: inline-block;"><img width="40px;" title="翼龙贷" alt="翼龙贷" src="/LRJ-project/admin_files/logo.png"></span>
			<span style="font-size:45px;font-weight:bold;font-family:YouYuan;height: 60px;display: inline-block; vertical-align:middle;">ELONGCN</span>
		</div>

	</div>
	<div style="width: 100%; height: 50%; background-color: #666C78;">
		<div style="padding-top:20px;">
			<form action="${pageContext.servletContext.contextPath }/login.shtml" method="post">
				<table style="width:40%;margin:0 auto;height:27%;">
					<tr>
						<td style="color:#fff;">用户名</td>
						<td><input type="text" name="username" placeholder="请输入用户名" style="border-radius:10px;"/></td>
						<td style="color:#fff;">密码</td>
						<td><input type="password" name="password" placeholder="请输入密码" style="border-radius:10px;"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="checkbox" name="username"/>&nbsp;&nbsp;<span style="font-size:12px;color:#fff;">记住我</span></td>
						<td></td>
						<td style="text-align:right;padding-right:26px;"><button style="width:76px;background-color:#585F69;color:#fff; ">登录</button></td>
					</tr>
				</table>
			</form>
			<div id="info" style="color:#FFD700;width:100%;text-align:center;">${error }</div>
		</div>
	</div>
</body>
</html>