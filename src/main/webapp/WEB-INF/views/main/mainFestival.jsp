<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 행사</title>
</head>
	<link rel="stylesheet" href="resources/main/css/mainFestival.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="Myheader">EVENT</div>
	<section>
		<div id="body-wrap">
			<div id="section-left">
				<div id="fesMenu">
					<div id="fesYear">2020</div>
					<div id="fesChoice">
						<a href="#">버킷행사</a>
						/
						<a href="#">기업행사</a>
					</div>
				</div>
				<div class="f-div">
					<div class="f-day">09.13</div>
					<div class="f-dot">...</div>
					<div class="f-one">
						<div class="f-img"></div>
						<div class="f-thumbnail">
							<div class="f-event">EVENT</div>
							<div class="f-title">Lifeplus 앰배서더 투표 이벤트</div>
							<div class="f-dDay">2017. 9. 7 목요일  ~ 2017. 9. 20 수요일<button>닫기</button></div>
						</div>
						<div class="f-detail">
							<div class="f-content"></div>
						</div>
					</div>
				</div>
				<div class="f-div">
					<div class="f-day">09.13</div>
					<div class="f-dot">...</div>
					<div class="f-one">
						<div class="f-img"></div>
						<div class="f-thumbnail"></div>
						<div class="f-detail"></div>
					</div>
				</div>
			</div>
			<div id="section-right">
				<ul>
					<li><a href="#">2020</a></li>
					<hr>
					<li><a href="#">2019</a></li>
				</ul>
			</div>
		</div>
	</section>
</body>
<script>
$(function(){
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','56px');
	
	$('nav>a:eq(1)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	$('#fesChoice>a:eq(0)').css('color', '#a047c0');
	$('#section-right a:eq(0)').css('color', '#a047c0');
	
	$('.gnb_menu .gnb_menu_ul li a.gnb3').css('background','url("resources/layout/images/bg03_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb3 .ico').css('background', 'url("resources/layout/images/ico03_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb3 .text span').css('color','#fff');
	if('${loginUser}' != ""){
		$('.gnb_menu .gnb_menu_ul li a .text:eq(2)').css('color', '#fff');
	}
	if('${loginCompany}' != ""){
		$('.gnb_menu .gnb_menu_ul li a .text:eq(1)').css('color', '#fff');
	}
	$('.gnb_menu a').css('text-decoration','none');
});
</script>
</html>