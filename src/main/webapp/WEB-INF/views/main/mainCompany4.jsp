<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/main/css/main.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<c:set var="menuNum" value="4" scope="application"/>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>				
	</header>
	<nav><jsp:include page="/WEB-INF/views/layout/mainNav.jsp"/></nav>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="search">
		<div id="search-wrap">
			<img id="search-img" src="resources/layout/images/검색창버튼.png">
		</div>
	</div>
	<%@ include file="searchscreen.jsp" %>
	<section>
		<jsp:include page="/WEB-INF/views/layout/mainLeftSide.jsp"/>
		<div class="bucket">
			<div class="bucketContent">
				<div class="c-category">FOOD</div>
				<div class="c-bucket">
					<div class="c-bucket-1">리틀 포레스트에 나오는 음식 따라 만들기</div>
				</div>
				<div class="c-Add">
					<div class="c-addBtn"> + ADD</div>
				</div>
				<div class="c-likewish">
					<div class="c-likeBtn"><span class="likehover" style="font-size:20px">♡ </span>좋아요</div>
					<div class="c-wishBtn"><span class="wishhover" style="font-size:20px">☆ </span>위시 등록</div>
				</div>
			</div>
		</div>
	</section>
	<div id="FullOverLay">
		<div id="bucketDatail">
			<div id="bucketexit">X</div>
			<div id="bucketimg">
				<div id="bucketcate">FOOD</div>
				<div id="buckettitle">리틀 포레스트에 나오는 음식 따라 만들기</div>
				<div id="bucketleft">〈</div>
				<div id="bucketright">〉</div>
				<div id="bucketAdd"> + ADD</div>
				<div id="bucketlike">♡ </div>
				<div id="bucketwish">☆ </div>
			</div>
			<div id="bucketcp">
				<div id="bucketTag">
					<div id="bucketTag1"><span>#</span>화이트데이</div>
					<div id="bucketTag1"><span>#</span>화이트데이</div>
					<div id="bucketTag1"><span>#</span>화이트데이</div>
					<div id="bucketTag1"><span>#</span>화이트데이</div>
					<div id="bucketTag1"><span>#</span>화이트데이</div>
				</div>
				<div id="bucketexplain">한옥에서 즐기는 타이푸드 식당 동남아. 요즘 핫한 동네 익선동에 들어서면 '동남아' 세 글자가 쓰여진 정직한 간판이 반겨준다. 내부에는 깨진 장독대와 푸른 식물이 한옥과 어우러져 이색 풍경이 펼쳐진다. 태국 유명 쿠킹클래스인 바이파이 출신 셰프가 직접 선보이는 팟타이부터 똠양꿍, 태국식 만두 퉁텅까지 로컬의 맛을 그대로 살렸다. 창밖 아래 풍경을 보면서 식사할 수 있는 2층 좌석을 추천. 종로 3가역에서 걸어서 5분 거리로 위치도 좋다. 팟타이 10,000원, 똠양꿍 12,000원 영업시간은 12:00-22:00	</div>
				<div id="bucketcompany">
					<ul>
						<li>삼성 여행사<button>견적서 작성</button></li>
						<li>LG 식품<button>견적서 작성</button></li>
						<li>아시아나항공 숙박<button>견적서 작성</button></li>
						<li>오리온 과자<button>견적서 작성</button></li>
						<li>오리온 과자<button>견적서 작성</button></li>
						<li>오리온 과자<button>견적서 작성</button></li>
						<li>오리온 과자<button>견적서 작성</button></li>
					</ul>
				</div>
				<div id="bucketcpeventD">
					<button>행사 펼치기</button>
				</div>
			</div>
			<div id="bucketwith">
				<div id="bucketwithCount"><span>14</span>명이 이 버킷 리스트를 함께 합니다.</div>
				<div id="bucketwithPro">
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
					<div id="profile1"></div>
				</div>
				<div id="bucketwithBN">
					<a id="bucketwithBN-a1">이전</a>
					<div id="bucketwithBN-Count">1/2</div>
					<a id="bucketwithBN-a2">다음</a>
				</div>
			</div>
			<div id="bucketcpEvent"></div>
		</div>
		
	</div>
	
	
</body>
<script>
	$(function(){
		// --현재 카테고리 표시
		$('#cssmenu>ul>li:eq(3)>a').css({'color':'#FF7E7E','border-bottom':'2px solid #f861a2'});
		//console.log($(window).width());
		
		$('.searchdiv').css('opacity', '1');
		
		// 카테고리 종류
		$('#categoryImg4').prop('src','resources/layout/images/foodhover.png');
		$('#category4').css('background','#FFCD12');
		$('#category4').unbind('mouseover mouseout');
		
		// --section 버킷들 width에 따라 height변화
		var hg = $('.bucket').css('width');
		$('.bucket').css('height', hg);
		
		$(window).resize(function(){
			var hg = $('.bucket').css('width');
			$('.bucket').css('height', hg);
			var bkhg = $('#bucketDatail').width()/16 * 9;
			$('#bucketimg').css('height', bkhg);
			var bkcphg = $('#bucketimg').width()-411;
			$('#bucketcp').css('width', bkcphg);
		});
		
		// 검색창 나오게 하기
		$('#search-img').click(function(){
			$('body').css('height', '100%');
			$('body').css('overflow', 'hidden');
			$('#searchscreen').show();
			$('#searchresult').show(800);
		});
		$('#searchtextBtn').click(function(){
			$('body').css('height', 'auto');
			$('body').css('overflow', 'visible');
			$('#searchscreen').hide();
			$('#searchresult').hide();
		});
		
		// 좋아요위시버튼 나오게하기
		$('.bucket').hover(function(){
			$('.c-likewish').show();
		}, function(){
			$('.c-likewish').hide();
		});
		
		// 좋아요위시 특수문자 색
		$('.c-likeBtn').hover(function(){
			$('.likehover').css('color', '#10ccc3');
		}, function(){
			$('.likehover').css('color', 'white');
		});
		$('.c-wishBtn').hover(function(){
			$('.wishhover').css('color', '#10ccc3');
		}, function(){
			$('.wishhover').css('color', 'white');
		});
		
		
		// 버킷리스트 상세보기 클릭 종류
		$('.bucket').click(function(e){
			if($(e.target).hasClass('c-likeBtn')){
				
			} else if($(e.target).hasClass('c-wishBtn')){
				
			} else if($(e.target).hasClass('c-addBtn')){
				
			} else{
				$('body').css('height', '100%');
				$('body').css('overflow', 'hidden');
				$('#FullOverLay').show();
				var bkhg = $('#bucketDatail').width()/16 * 9;
				$('#bucketimg').css('height', bkhg);
				var bkcphg = $('#bucketimg').width()-411;
				console.log($('#bucketimg').width());
				console.log(bkcphg);
				$('#bucketcp').css('width', bkcphg);
			}
		});
		
		// 버킷리스트 상세보기 닫기
		$('#bucketexit').click(function(){
			$('#FullOverLay').hide();
			$('body').css('height', 'auto');
			$('body').css('overflow', 'visible');
		});
		
		// 행사 펼치기
		$('#bucketcpeventD>button').click(function(){
			if($('#bucketcpEvent').css('display') == 'none'){
				$('#bucketwith').hide();
				$('#bucketcpEvent').show();
				$('#bucketcpeventD>button').text("행사 접기");
			} else{
				$('#bucketcpEvent').hide();
				$('#bucketwith').show();
				$('#bucketcpeventD>button').text("행사 펼치기");
			}
			
		});
		
	});
</script>
</html>