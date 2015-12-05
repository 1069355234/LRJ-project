<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf" %>
<html lang="en"
	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<link href="/favicon.ico" type="image/x-icon" rel=icon>
<link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta name="renderer" content="webkit">
<title>登录－蓝缘管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/admin_files/min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/admin_files/login.css">
<link
	href="${pageContext.servletContext.contextPath }/admin_files/css.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
	changeCode();
	$("#codeImg").bind("click",changeCode);
});
function changeCode(){
	$("#codeImg").attr("src","code.shtml?t="+genTimestamp());
}
function genTimestamp(){
	var time = new Date();
	return time.getTime();
}
//回车事件 点击回车按钮登录
function KeyDown(e) {
	e = window.event || e;
	var ke = e.keyCode || e.which;
	if (ke == 13) {
		if(checkUserForm()){
			document.getElementById("loginform").submit();
		}
	}
}
</script>
</head>
<body onload="javascript:to_top()"  onkeydown="KeyDown(event);"
	style="background-image: url('${pageContext.servletContext.contextPath }/admin_files/bg.jpg');margin-top:0px;background-repeat: round;">
	<div id="loginbox" style="padding-top: 10%;">
		<form id="loginform" name="loginform" class="form-vertical"
			style="background-color: rgba(0, 0, 0, 0.5) !important; background: #000; filter: alpha(opacity = 50); *background: #000; *filter: alpha(opacity = 50); /*黑色透明背景结束*/ color: #FFF; bottom: 0px; right: 0px; border: 1px solid #000;"
			action="${pageContext.servletContext.contextPath }/login.shtml"
			method="post">
			<div class="control-group normal_text">
				<table style="width: 100%">
					<tr>
						<td align="left"><img
							src="${pageContext.servletContext.contextPath }/admin_files/logo_left.png"
							alt="Logo"></td>
							<td align="center" style="font-weight: bold;color: gray;">员工管理系统</td>
						<td align="right"><img
							src="${pageContext.servletContext.contextPath }/admin_files/logo_left.png"
							alt="Logo"></td>
					</tr>
				</table>

			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly" style="background: #28b779"><img
							src="${pageContext.servletContext.contextPath }/admin_files/account_1.png"
							alt="请输入账号.."></span><input type="text" placeholder="请输入账号.." name="username" value=""
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><img
							src="${pageContext.servletContext.contextPath }/admin_files/lock_1.png"
							alt="请输入密码.."></span><input type="password" placeholder="请输入密码.." name="password" value=""
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly" style="background: #fff"><img
							src="${pageContext.servletContext.contextPath }/admin_files/yzm.png"
							alt="请输入验证码.."></span><input type="password" placeholder=请输入验证码.. name="code"
							style="height: 30px;width: 58%; margin-bottom: 1px;border-left:1px solid;border-right:1px solid;"/><img id="codeImg" style="cursor: pointer;" src="${pageContext.servletContext.contextPath }/admin_files/test.jpg" alt="单击图片刷新">
					</div>
				</div>
			</div>
			<div style="text-align:center;"><span style="color: #FFD700;" id="info">&nbsp;</span></div>
			<div class="form-actions" style="padding-right:73%">
				<!-- <span class="pull-left" style="width: 33%"><a href="#"
					class="flip-link btn btn-info" id="to-recover">忘记密码？</a></span> -->
					<!-- <span class="pull-left" style="width: 33%"><a href="install.shtml"
					class="flip-link btn btn-danger" id="to-recover">一键初始化系统</a></span> -->
					 <span
					class="pull-right"><a type="submit"
					href="javascript:checkUserForm()" class="btn btn-success" style="width:530%;">登&nbsp;&nbsp;录</a></span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		if ("${error}" != "") {
			$("#info").text("${error}");
		};
		function checkUserForm() {
			var username = $("input[name='username']").val();
			var pwd = $("input[name='password']").val();
			var code = $("input[name='code']").val();
			if("" == username){
				$("#info").text("用户名不能为空");
				return ;
			}
			if("" == pwd){
				$("#info").text("密码不能为空");
				return;
			}
			if("" == code){
				$("#info").text("验证码不能为空");
				return;
			}
			document.loginform.submit();
		}
		function to_top(){
			if(window != top){
		        top.location.href=location.href;
		    }
		}
	</script>
</body>
</html>