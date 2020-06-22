<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 행사</title>
</head>
	<link rel="stylesheet" href="resources/main/css/myInfo.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="Myheader">MY INFO</div>
	<section>
		<div id="body-wrap">
				<div class="f-div">
					<div class="f-one">
						<button>비밀번호 변경</button><br>
						폰번호 : <input><br>
						이메일 : <input><br>
						닉네임 : <input><br>
					</div>
				</div>
		</div>
	</section>
</body>
<script>
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','56px');
	$('.gnb_menu .gnb_menu_ul li a.gnb2').css('background','url("resources/layout/images/bg02_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb2 .ico').css('background', 'url("resources/layout/images/ico02_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb2 .text span').css('color','#fff');
	$('.gnb_menu .gnb_menu_ul li a .text:eq(1)').css('color', '#fff');
	$('.gnb_menu a').css('text-decoration','none');
</script>
</html>