<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/layout/css/header.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<header>
		<div id="facebookBtn" class="snsLink"><a href="https://www.facebook.com" target="_blank"><img src="resources/layout/images/facebook.png"></a></div>
		<div id="instaBtn" class="snsLink"><a href="https://www.instagram.com" target="_blank"><img src="resources/layout/images/instagram.png"></a></div>
		<div id="menuBtn" class="Rmenu"></div>
		<div id="alertBtn" class="Rmenu"></div>
		<div id="logoutBtn" class="Rmenu"></div>
		<div id="logo-wrap">
			<div id="logo">Bucket Story</div>
		</div>
	</header>
</body>
<script>
	$('#logoutBtn').click(function(){
		var result = confirm("로그아웃 하시겠습니까?");
		if(result){
			location.href='';
		} else{
			alert("로그아웃 취소");
		}
	});
</script>
</html>