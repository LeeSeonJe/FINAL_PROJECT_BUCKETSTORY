<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<% 			SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
			String today = dateFormat.format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#background {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	background: url("resources/common/images/Mountain.jpg");
	background-size: cover;
}

.inner {
	position: absolute;
	left: 0;
	top: 50px;
	width:960px;
	height: 600px;
	/* 		background: url("resources/common/images/Mountain.jpg");  */
	/* 		background: url("resources/common/images/background.jpg"); */
	background: url("resources/common/images/colorful.png");
	background-size: cover;
}

#welcome {
	marigin: auto;
	background: url("resources/common/images/colorful.png");
	background-size: cover;
	width: 800px;
	height: 800px;
	/* 가운데 */ 
	position : absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

#content {
	position : absolute;
	left: 50%;
	top: 50%;
	transform: translate(-45%, -50%);
	width:400px;
	height:400px;
	color:#fff;
	font-size: 24px;
	
}
#content img{
	margin: 0 auto;
	width: 360px;
	height: 100px;
	border-bottom: 11px solid #fff;
	
}
.welcomHome{
	color: #eee;
	font-size : 20px;
}
#today{
	color: #eee;
	font-size : 28px;
	position : absolute;
	left: 50%;
	top: 17%;
	width: 200px;
	height: 100px;
}
#point{
	color : skyblue;
	font-size:24px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />

	<div id="background"></div>
	<div id="welcome"></div>
	<div id="content">
				<img src ="resources/common/images/LogoWhite.png">
				<p><b>-BucketList 기업/전문가 Home-</b></p><br>
				<p class ="welcomHome">어서오세요~~!! </p>
				<p class ="welcomHome"><span id = "point">${coid}</span>님 환영합니다.</p>
				<p class ="welcomHome">꿈을 이뤄주는 기업/전문가 회원님들</p>
				<p class ="welcomHome">당신들이 있어 세상이 아름답습니다.</p>
	</div>
	
	<div id ="today"><%=today %></div>
<!-- 	<div class="inner"> -->
		
<!-- 		<!-- 		<img src ="resources/common/images/Mountain.jpg"> --> -->
<!-- 	</div> -->

</body>
</html>