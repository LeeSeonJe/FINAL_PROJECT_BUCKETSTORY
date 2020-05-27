<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/common/css/main.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
	<header><%@ include file="header.jsp" %></header>
	<nav><%@ include file="mainNav.jsp" %></nav>
	<div id="search">
		
	</div>
	<section>
		<%@ include file="mainLeftSide.jsp" %>
		<div class="bucket"></div>
		<div class="bucket"></div>
	</section>
</body>
<script>
	$(function(){
		// --현재 카테고리 표시
		$('#cssmenu>ul>li:eq(1)>a').css({'color':'#5B5AFF','border-bottom':'2px solid #3a7af8'});
		//console.log($(window).width());
		
		// --section 버킷들 width에 따라 height변화
		var hg = $('.bucket').css('width');
		$('.bucket').css('height', hg);
		$(window).resize(function(){
			var hg = $('.bucket').css('width');
			$('.bucket').css('height', hg);
		});
		
		
	});
</script>
</html>