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
		<span>&nbsp;&nbsp;</span>
		<a class="myPagemenu" href="myBucket.me?nickName=${ nickName }">
			<span>♡버킷리스트</span>
		</a>
		<span>&nbsp;&nbsp;</span>
		<span>&nbsp;&nbsp;</span>
		<a class="myPagemenu" href="myWish.me?nickName=${ nickName }">
			<span>★위시리스트</span>
		</a>
		
		<span>&nbsp;&nbsp;</span>
		<a class="myPagemenu" href="myBlog.me?nickName=${ nickName }">
			<span>♬블로그&nbsp;</span>
		</a>

			<span>&nbsp;</span>
			
		<span>&nbsp;</span>
		<a class="myPagemenu">
			<span>▤견적서</span>

		</a>
		<span>&nbsp;</span>
	</nav>
</body>
</html>