<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_point.css">
<link rel ="stylesheet" href ="resources/expert/css/hp_pointList.css">
<style>

#nav-inner{
	width: 980px;
	margin: 0 auto;
	padding-top:108px;
}
#point-nav{
	border-radius: 5px;
	position:fixed;
	width: 980px;
	margin: 0 auto;
	background:#fff;
	height:45px;
	text-align: center;
	border-bottom:1px solid gray;
}

#point-nav ul{
	display: inline-block;
}

#point-nav ul li{
	padding: 11px;	
	padding-left: 30px;
	padding-right: 30px;
	margin-left : 50px;
	font-size: 18px;
	font-weight: 800;
	float:left;
	cursor: pointer;
	border-radius: 8px;
}


#p-content{
	width: 100%;
	height: auto;
	padding-top:50px;
}

a{
	color:#333;
	text-decoration: none;
}

a:hover{
	color:red;
}
</style>
</head>
<body>	

	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	

	  <div id ="nav-inner">
		<div id ="point-nav">
			<ul>
				<li><a href="helperEdit.ex">MyHelper</a></li>
				<li><a href="helperView.ex">헬퍼작성</a></li>
			</ul>
		</div>
	  </div>

	
</html>