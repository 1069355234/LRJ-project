<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/picbox.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/picbox.css" type="text/css" media="screen" />

<style type="text/css">
.container{
	width:100%;
	background-color: #123659;
	margin:0px;
	padding:0 auto;
}
.part{
	width:162px;
	height:185px;
	background-color: #265380;
	float:left;
	text-align:center;
	margin-bottom:25px;
	margin-left:15px;
}
.part a{
	display: inline-block;
	padding-top:8px;
	width:100%;
}
.part span{
	display: inline-block;
	height: 34px;
	line-height: 32px;
	font-size:14px;
	white-space: nowrap;
	color:#c8e1fa;
	margin-top: -12px;
}
</style>

<script type="text/javascript">
function exportAll(){
	window.location.href = "${pageContext.request.contextPath}/customer/exportAll.shtml";
}
</script>

<div class="doc-buttons" style="text-align: right;">
	<button class="btn btn-primary marR10" type="button" onclick="exportAll()">全部导出</button>
</div>
<div class="container">
	<c:forEach var="item" items="${customerPics}" varStatus="i">
		<div class="part" title="${item.key }">
			<c:forEach varStatus="j" var="pic" items="${item.value }">
				<c:if test="${j.index == 0 }">
					<a href="${pageContext.request.contextPath}${pic.filepath}" title="${pic.filename }" rel="lightbox-group${i.index }"><img src="${pageContext.request.contextPath}${pic.filepath}" width="148px;" height="140px;"/></a>
				</c:if>
				<c:if test="${j.index != 0 }">
					<a href="${pageContext.request.contextPath}${pic.filepath}" title="${pic.filename }" rel="lightbox-group${i.index }"></a>
				</c:if>
			</c:forEach>
			<span>${item.key }</span>
		</div>
	</c:forEach>

</div>