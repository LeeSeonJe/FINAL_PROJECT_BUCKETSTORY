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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=deba653fd81e7e506676cae7697d70bf&libraries=services"></script>
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
						<a href="festival.ho?year=2020&check=1">버킷행사</a>
						/
						<a href="festival.ho?year=2020&check=2">기업행사</a>
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
							<button id="btn${f.feno}"class="btn" onclick="mapAPI(${f.feno}, '${f.feplace}');">장소 보기</button>
						</div>
						<div id="f-detail${f.feno}" class="f-detail">
							<div class="f-content">${f.feplace}</div>
							<div class="f-map" id="map${f.feno}"></div>
						</div>
					</div>
					
				</div>
<script>
$(function(){
	$('#btn${f.feno}').click(function(){
		if($('#btn${f.feno}').text() == '장소 보기'){
			$('#btn${f.feno}').text('숨기기');
			$('#f-detail${f.feno}').show(1000);
		} else{
			$('#btn${f.feno}').text('장소 보기');
			$('#f-detail${f.feno}').hide(1000);
		}
	});
	/* 지도 검색 */
	var mapContainer = document.getElementById('map${f.feno}'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${f.feplace}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
//	         // 인포윈도우로 장소에 대한 설명을 표시합니다
//	         var infowindow = new kakao.maps.InfoWindow({
	        
//	         });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
		     $("#map2").children().next().next().next().children().children().next().children('img').hide();
	    } 
	});
});

</script>
				</c:forEach>
			</div>
			<div id="section-right">
				<ul>
					<li><a href="festival.ho?year=2020&check=1">2020</a></li>
					<hr>
					<li><a href="festival.ho?year=2019&check=1">2019</a></li>
				</ul>
			</div>
		</div>
	</section>
</body>
<script>
$(function(){
	$('.f-detail').hide();
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','56px');
	
	$('nav>a:eq(1)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	$('#fesChoice>a:eq(0)').css('color', '#a047c0');
	if('${year}' == '2020'){
		$('#section-right a:eq(0)').css('color', '#a047c0');
	} else if('${year}' == '2019'){
		$('#section-right a:eq(1)').css('color', '#a047c0');
	}
	
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
function mapAPI(feno, feplace){
	/* 지도 검색 */
	var mapContainer = document.getElementById('map'+feno), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(feplace, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
//	         // 인포윈도우로 장소에 대한 설명을 표시합니다
//	         var infowindow = new kakao.maps.InfoWindow({
	        
//	         });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
			$("#map2").children().next().next().next().children().children().next().children('img').hide();
	    } 
	    
	});
}

$(function(){
	
})
</script>

</html>