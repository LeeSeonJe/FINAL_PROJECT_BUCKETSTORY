<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		<c:if test="${ loginUser.userId eq getMember.userId }">
			<a class="myPagemenu" href="myEstimateView.ex">
				<span>▤견적서</span>
			</a>
		</c:if>
		<c:choose>
			<c:when test="${ loginUser.userId ne getMember.userId }">
				<a class="myPagemenu" onclick="tt(this);">
				<span>▤견적서</span>
				</a>
				<script type="text/javascript">
				function tt(t){
					alert("페이지 주인만 접근할 수 있습니다.");					
					}
				</script>
			</c:when>	
			<c:when test="${ loginUser == null && loginUser.userId ne getMember.userId && loginCompany != null }">
				<a class="myPagemenu" onclick="tt(this);">
					<span>▤견적서</span>
				</a>			
				<script type="text/javascript">
					function tt(t){
						alert("페이지 주인만 접근할 수 있습니다.");					
					}
				</script>
			</c:when>	
		</c:choose>
		<span>&nbsp;</span>
	</nav>
</body>
</html>