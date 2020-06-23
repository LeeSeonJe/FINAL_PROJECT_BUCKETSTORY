<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<c:forEach var="f" items="${ fList }">
				<div class="f-div">
					<div class="f-day">${fn:substring(f.feDate, 5, 10)}</div>
					<div class="f-dot">...</div>
					<div class="f-one">
					<c:forEach var="m" items="${ mList }">
						<c:if test="${m.feno == f.feno}">
						<div class="f-img"><img src="resources/buploadFiles/${m.mweb}"></div>
						</c:if>
					</c:forEach>
						<div class="f-thumbnail">
							<div class="f-event">EVENT</div>
							<div class="f-title">${f.fetitle}</div>
							<div class="f-dDay">${f.feDate}</div>
							<div class="f-fecontent">${f.fecontent}</div>
							<button id="btn${f.feno}"class="btn">장소 보기</button>
						</div>
						<div id="f-detail${f.feno}" class="f-detail">
							<div class="f-content">${f.feplace}</div>
							<div class="f-map"></div>
						</div>
					</div>
				</div>
<script>
$(function(){
	if('${m.feno}' == '${f.feno}'){
		$('.f-img').css('background-image', 'url()');
	}
	$('#btn${f.feno}').click(function(){
		if($('#btn${f.feno}').text() == '장소 보기'){
			$('#btn${f.feno}').text('숨기기');
			$('#f-detail${f.feno}').show(1000);
		} else{
			$('#btn${f.feno}').text('장소 보기');
			$('#f-detail${f.feno}').hide(1000);
		}
	});
});
</script>
				</c:forEach>
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