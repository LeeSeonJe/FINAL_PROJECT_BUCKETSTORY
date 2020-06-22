<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script  type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel ="stylesheet" href ="resources/expert/css/hp_nav.css">
	<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<style>
#overlay-2{
	top:145px;
	width:100%;
	height: 150%;
	background : rgba(0,0,0,0.55);
	position: absolute;
	z-index:9999;
	display:none;
}
.sub-c{
	display:none;
}
.hidden {height:100%; min-height:100%; overflow:hidden !important; touch-action:none;}
</style>
</head>
<body>


	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<%-- 			<jsp:include page="/WEB-INF/views/expert/hp_header.jsp"/> --%>
	</header>
	
	<!-- 전문가 로그인 아이디 coid를 가져와서 집어넣어야 한다. -->
	
    <nav>
    <div id="menu-area">
        <ul class='menu-c'>
            <li id ="menu-item1"><a href='expertIntro.ex'>헬퍼마이페이지</a></li>
            <li id ="menu-item2"><a href='ex_infoUpdateForm.ex'>헬퍼버킷리스트</a></li>
            <li id ="menu-item3"><a href='getRequest.ex'>견적서 관리</a></li>
            <li id ="menu-item4"><a href='point.ex?search=none'>포인트 관리</a></li>
<!--             <li id ="menu-item5"><a href='helperQnaList.ex?search=all'>Q & A</a></li> -->
        </ul>
    </div>
	</nav>
	
<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>

<div id ="overlay-2"></div>
</body>
</html>