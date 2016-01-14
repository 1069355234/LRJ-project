<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.left{
		float:left;
	}
	.one_app{
		width:237px;
		height:90px;
		margin-right:25px;
		margin-left:25px;
	}
	.app_icon{
    	height: 86px;
    	margin-right: 13px;
    	width: 76px;
    	background-image: url("${pageContext.request.contextPath}/images/app_list.png");
    	background-repeat: no-repeat;
	}
	.app_title{
		color: #333;
    	font-family: "Microsoft Yahei","微软雅黑","微软雅黑";
    	font-size: 18px;
    	margin-bottom: 10px;
	}
	.latest_version{
		color: #666;
    	font-size: 12px;
    	margin-bottom: 10px;
	}
	.download_p{
		width:30%;
		padding-left:0;
	}
	.download_btn:hover{
		color:#fff;
		background-color: #ffa800;
		border-color: #f8a300;
	}
	.download_btn{
		background-color: #fff;
	    border: 1px solid #ececec;
	    color: #4c4c4c;
	    font-size: 14px;
	    height: 35px;
	    line-height: 35px;
	    text-align: center;
	}
	.app_phone{
		background-position: -100px 0;
	}
	.app_pad{
		background-position: -300px 0;
	}

</style>

<script>
	function download(){
		layer.open({
			title: false,
		    type: 1,
		    skin: 'layui-layer-rim', //加上边框
		    area: ['280px', '280px'], //宽高
		    content: '<img src="${pageContext.request.contextPath}/app/phone.png"/>'
		});
	}
</script>

<div style="width:100%;margin-top:20px;">
	<div class="one_app left">
		<div class="app_icon app_phone left"></div>
		<div class="app_info">
			<p class="app_title">手机客户端</p>
			<p class="latest_version">发布时间：2016-01-07</p>
			<p class="left download_p">
				<a class="download_btn" href="${pageContext.request.contextPath}/download/downloadApk.shtml">立即下载</a>
			</p>
			<p class="left download_p">
				<a class="download_btn" href="javascript:download();">扫码下载</a>
			</p>
		</div>
	</div>
	<%-- <div class="one_app left">
		<div class="app_icon app_pad left"></div>
		<div class="app_info">
			<p class="app_title">平板客户端</p>
			<p class="latest_version">发布时间：2016-01-07</p>
			<p class="left download_p">
				<a class="download_btn" href="${pageContext.request.contextPath}/app/phone.apk">立即下载</a>
			</p>
			<p class="left download_p">
				<a class="download_btn" href="">扫码下载</a>
			</p>
		</div>
	</div> --%>
</div>