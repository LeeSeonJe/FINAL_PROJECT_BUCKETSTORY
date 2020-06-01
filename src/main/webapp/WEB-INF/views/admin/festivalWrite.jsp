<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>				
	</header>
	
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li>
						<a href="">축제 작성</a>	
					</li>
					<li>
						<a href="">가입확인</a>
					</li>
					<li>
						<a href="">결제내역</a>
					</li>
					<li>
						<a href="">통계</a>
					</li>
					<li>
						<a href="">신고</a>
					</li>
					<li>
						<a href="">QnA</a>
					</li>
				</ul>
			</div>
		</nav>
		<form id="adw_form">
			<div id="adw_formimg">
				<img>
			</div>
			<div class="adw_formDiv">
				<ul>
					<li>제목 :
						<input type="text">
					</li>
					<li>일시 : 
						<input type="text">
					</li>
					<li>장소 :
						<input type="text">
					</li>
				</ul>
			</div>
				<div class="test" id="map" style="width:480px; height:383px; float:right;"></div>
			<div>
				<textarea id="adw_textarea">내용작성</textarea>
			</div>
			
			<div class="adw_button">
				<input type="submit" value="완료">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=deba653fd81e7e506676cae7697d70bf&libraries=services"></script>
	<script>	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
	
</body>
</html>