<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel ="stylesheet" href ="resources/expert/css/hp_nav.css">
	<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<style>
	.p-section{
		
	}

</style>
</head>
<body>
	
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<nav>
	<div id='cssmenu'>
		<ul>
           	<li>
           		<a href='helperEdit.ex'>헬퍼마이페이지</a>
           	</li>        
            <li>
                <a href='helperBucketList.ex'>헬퍼버킷리스트</a>
            </li>
           	<li>
                <a href='#'>견적서 관리</a>
            </li>
            <li>
                <a href='point.ex'>포인트 관리</a>
            </li>
            <li>
                <a href='#'>Q & A</a>
            </li>
   
		</ul>
	</div>
	</nav>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
</body>
</html>