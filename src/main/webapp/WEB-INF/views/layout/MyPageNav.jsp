<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="resources/layout/css/MyPageNav.css">
</head>
<body>
	<nav>
		<a class="myPagemenu" href="myBucket.me?nickName=${ nickName }">
			<span>&nbsp;♡</span>
			<span>버킷리스트&nbsp;&nbsp;</span>
		</a>
		<a class="myPagemenu">
			<span>&nbsp;&nbsp;★</span>
			<span>위시리스트&nbsp;&nbsp;</span>
		</a>
		<a class="myPagemenu" href="myBlog.me?nickName=${ nickName }">
			<span>&nbsp;♬</span>
			<span>블로그&nbsp;</span>
		</a>
		<a class="myPagemenu" href="myEstimateView.ex">
			<span>&nbsp;▤</span>
			<span>견적서&nbsp;</span>
		</a>
	</nav>
</body>
</html>