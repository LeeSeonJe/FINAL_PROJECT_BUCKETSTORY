<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>

form{
    border-right: 1px solid red;
    height: 900px;
    margin-top: 45px;
    width: 70%;
    margin: 0 auto;
}

form>div>div>img {
	background-color:black;
    min-width: 800px;
	min-height: 350px;
	margin: 0 auto;
	
}

#adw_formimg{
	text-align: center;
	margin-bottom: 50px;
    
}

form>div>div>ul>li{
	list-style: none;
	font-size: 15px;
    height: 60px;
}

#adw_formDiv{
    width: 60%;
    margin: 0 auto;

}
.adw_formdiv{
	display: inline-flex;
}

#adw_textarea{
    resize: none;
    width: 650px;
    height: 150px;
    margin-left: 35px;
	
}

.adw_button{
    text-align: center;
    margin-top: 35px;
}

#adw_body>nav{
	width: 100%;
	height:30px;
	margin-bottom: 50px;
	
}


#adw_choyears{
    float: right;
    margin-right: 210px;
  
}

#adw_years{
	font-size: 45px;
    position: absolute;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>				
		<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"></jsp:include>				
	</header>
	
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li>
						<a href="adminwrite.ad">축제 작성</a>	
					</li>
					<li>
						<a href="adminCompany.ad">가입확인</a>
					</li>
					<li>
						<a href="adminBill.ad?search=all">결제내역</a>
					</li>
					<li>
						<a href="">통계</a>
					</li>
					<li>
						<a href="cautionlist.ad">신고</a>
					</li>
					<li>
						<a href="adminQnAlist.ad">QnA</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	
	
</body>
</html>