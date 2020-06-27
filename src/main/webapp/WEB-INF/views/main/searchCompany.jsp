<%@page import="com.kh.BucketStory.bucket.model.vo.WishList"%>
<%@page import="java.io.File, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신순버킷</title>
	<link rel="stylesheet" href="resources/main/css/mainCompany.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- 카테고리 변경 때 필요 -->
	<c:set var="menuNum" value="4"/>
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
		<c:forEach var="m" items="${mList}">
		<c:forEach var="c" items="${cList}">
		<c:if test="${c.coId eq m.coid }">
		<div id="bucket${c.coId}" class="bucket" onclick="cpDetail('${c.coId}', '${c.coName}', '${c.compaName}', '${c.apName}', '${c.homePage}', '${c.coTel}', '${c.busiEmail}', ${c.cpCheck}, ${c.cateNum}, '${c.coIntro}', '${c.coInfo}', '${m.mweb}');">
			<div class="bucketContent">
				<div class="c-category">
					<c:choose>
						<c:when test="${ c.cateNum == 1 }"><span style="color:#00c5bc;">Travel</span><c:set var="cateName" value="Travel"/></c:when>
						<c:when test="${ c.cateNum == 2 }"><span style="color:#fd8ab1;">Sport</span><c:set var="cateName" value="Sport"/></c:when>
						<c:when test="${ c.cateNum == 3 }"><span style="color:#fd8b42;">Food</span><c:set var="cateName" value="Food"/></c:when>
						<c:when test="${ c.cateNum == 4 }"><span style="color:#c78646;">New Skill</span><c:set var="cateName" value="New Skill"/></c:when>
						<c:when test="${ c.cateNum == 5 }"><span style="color:#9f7ed7;">Culture</span><c:set var="cateName" value="Culture"/></c:when>
						<c:when test="${ c.cateNum == 6 }"><span style="color:#6fc073;">Outdoor</span><c:set var="cateName" value="Outdoor"/></c:when>
						<c:when test="${ c.cateNum == 7 }"><span style="color:#efc648;">Shopping</span><c:set var="cateName" value="Shopping"/></c:when>
						<c:when test="${ c.cateNum == 8 }"><span style="color:#87adf8;">Lifestyle</span><c:set var="cateName" value="Lifestyle"/></c:when>
					</c:choose>
				</div>
				<div class="c-bucket">
					<div class="c-bucket-1">${c.coName}</div>
				</div>
			</div>
		</div>
<script>
	$('#bucket${c.coId}').css('background-image', 'url("resources/muploadFiles/${m.mweb}")');
</script>
		</c:if>
		</c:forEach>
		</c:forEach>
	</section>
	<div id="FullOverLay">
		<div id="bucketDatail">
			<div id="bucketexit">X</div>
			<div id="bucketimg">
				<img>
				<div id="bucketcate">FOOD</div>
				<div id="buckettitle">기업 명</div>
				<div id="upjong">업종 명</div>
				<div id="depho">대표자 : <label>대표자</label></div>
				<div id="cpcheck">전문가기업여부</div>
			</div>
			<div id="bucketcp">
				<div id="compHomepage">
					홈페이지 : <label>홈페이지</label>
				</div>
				<div id="compPhone">
					전화번호 : <label>전화번호</label>
				</div>
				<div id="compEmail">
					이메일 : <label>이메일</label>
				</div>
				<div id="bucketexplain">한옥에서 즐기는 타이푸드 식당 동남아. 요즘 핫한 동네 익선동에 들어서면 '동남아' 세 글자가 쓰여진 정직한 간판이 반겨준다. 내부에는 깨진 장독대와 푸른 식물이 한옥과 어우러져 이색 풍경이 펼쳐진다. 태국 유명 쿠킹클래스인 바이파이 출신 셰프가 직접 선보이는 팟타이부터 똠양꿍, 태국식 만두 퉁텅까지 로컬의 맛을 그대로 살렸다. 창밖 아래 풍경을 보면서 식사할 수 있는 2층 좌석을 추천. 종로 3가역에서 걸어서 5분 거리로 위치도 좋다. 팟타이 10,000원, 똠양꿍 12,000원 영업시간은 12:00-22:00	</div>
				<div id="coinformation">업체정보</div>
				<div id="bucketcpeventD">
					<button>지원버킷보기</button>
				</div>
			</div>
			<div id="cpestimate">
				<div id="coSupport">지원하는 버킷리스트</div>
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
			</div>
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
	$('#categoryImg1').prop('src','resources/layout/images/allhover.png');
	$('#category1').css('background','silver');
	$('#category1').unbind('mouseover mouseout');
	
	// --section 버킷들 width에 따라 height변화
	var hg = $('.bucket').css('width');
	$('.bucket').css('height', hg);
	
	$(window).resize(function(){
		var hg = $('.bucket').css('width');
		$('.bucket').css('height', hg);
		var bkhg = $('#bucketDatail').width()/16 * 9;
		$('#bucketimg').css('height', bkhg);
	});
	
	//검색text항시보여줌
	$('#searchscreen').show();
	$('#searchscreen').css('height', '0');
	$('#searchtext').val('${searchValue}');
	
	$('#searchtext').focus(function(){
		$('body').css('height', '100%');
		$('body').css('overflow', 'hidden');
		$('#searchscreen').css('height', '100%');
		$('#searchresult').show(800);
	});
	$('#searchtextBtn').click(function(){
		$('body').css('height', 'auto');
		$('body').css('overflow', 'visible');
		$('#searchresult').hide();
		$('#searchscreen').css('height', '0');
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
		}
	});
	// 버킷리스트 상세보기 닫기
	$('#bucketexit').click(function(){
		$('#FullOverLay').hide();
		$('body').css('height', 'auto');
		$('body').css('overflow', 'visible');
	});
	// 견적서 관련 펼치기
	$('#bucketcpeventD>button').click(function(){
		if($('#cpestimate').css('display') == 'none'){
			$('#cpestimate').show();
		} else{
			$('#cpestimate').hide();
		}
	});

});
//				 기업아이디,기업명, 업종명,       대표자이름, 홈페이지, 전화번호,  이메일,    기업전문가여부, 카테고리, 업체소개, 업체정보, 사진 
function cpDetail(coId, coName, compaName, apName, homePage, coTel, busiEmail, cpCheck, cateNum, coIntro, coInfo, mweb){
	switch(cateNum){
	case 1: $('#bucketcate').html('<span style="color:#00c5bc;">Travel</span>'); break;
	case 2: $('#bucketcate').html('<span style="color:#fd8ab1;">Sport</span>'); break;
	case 3: $('#bucketcate').html('<span style="color:#fd8b42;">Food</span>'); break;
	case 4: $('#bucketcate').html('<span style="color:#c78646;">New Skill</span>'); break;
	case 5: $('#bucketcate').html('<span style="color:#9f7ed7;">Culture</span>'); break;
	case 6: $('#bucketcate').html('<span style="color:#6fc073;">Outdoor</span>'); break;
	case 7: $('#bucketcate').html('<span style="color:#efc648;">Shopping</span>'); break;
	case 8: $('#bucketcate').html('<span style="color:#87adf8;">Lifestyle</span>'); break;
	}
	$('#buckettitle').text(coName);
	$('#upjong').text(compaName);
	$('#depho>label').text(apName);
	if(cpCheck == 1){
		$('#cpcheck').text('기업');
	} else{
		$('#cpcheck').text('전문가');
	}
	$('#compHomepage>label').text(homePage);
	$('#compPhone>label').text(coTel);
	$('#compEmail>label').text(busiEmail);
	$('#bucketexplain').html(coIntro);
	$('#coinformation').text(coInfo);
	$('#bucketimg>img').attr('src', 'resources/muploadFiles/'+mweb);
	// 지원하는 버킷리스트 가져오기
	$.ajax({
		url:'cpDetailSup.ho',
		data:{
			coId:coId
		},
		async:false,
		success:function(data){
			$('#bucketcompany>ul').html('');
			for(var key in data){
				var $value = $('<li>');
				$value.text(data[key].bkName);
				$value.attr('onclick', 'searchBk("'+data[key].bkName+'");');
				$('#bucketcompany>ul').append($value);
			}
		}
	});
}
// 지원하는 버킷 선택해서 검색하기
function searchBk(bkName){
	location.href="searchbucket.ho?b="+bkName;
}
// 검색어 자동완성
function searchReset(){
	$('#searchMem>ul').html('');
	$('#searchBucket>ul').html('');
	$('#searchTag>ul').html('');
}
$(function(){
	var searchSource = new Array();
	$.ajax({
		url:'autosearch.ho',
		dataType: "json",
		success: function(data){
			for(var key in data){
				searchSource[key] = data[key];
			}
		}
	});
	$("#searchtext").autocomplete({  //오토 컴플릿트 시작
        source : searchSource,    // source 는 자동 완성 대상
        select : function(event, ui) {    //아이템 선택시
        },
        focus : function(event, ui) {    //포커스 가면
            return false;//한글 에러 잡기용도로 사용됨
        },
        minLength: 1,// 최소 글자수
        autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
        classes: {    //잘 모르겠음
            "ui-autocomplete": "highlight"
        },
        delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" },    //잘 모르겠음
        close : function(event){    //자동완성창 닫아질때 호출
        }
    }).autocomplete('instance')._renderItem = function(ul, item){
    	$('#ui-id-1').css('opacity', '0');
    	if(item.label.charAt(0) == 'm'){
    		$( "<li>" )
            .append(item.label.substring(2))    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
            .attr('onclick', 'searchMember("'+item.label.substring(2)+'");')
           	.appendTo( $('#searchMem>ul') );
    	} else if(item.label.charAt(0) == 'b'){
    		$( "<li>" )
            .append(item.label.substring(2))    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
            .attr('onclick', 'searchBucket("'+item.label.substring(2)+'");')
           	.appendTo( $('#searchBucket>ul') );
    	} else if(item.label.charAt(0) == 't'){
    		$( "<li>" )
            .append('#'+item.label.substring(2))    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
            .attr('onclick', 'searchTag("'+item.label.substring(2)+'");')
           	.appendTo( $('#searchTag>ul') );
    	} else if(item.label.charAt(0) == 'c'){
    		$( "<li>" )
    		.append(item.label.substring(2))
    		.attr('onclick', 'searchCompany("'+item.label.substring(2)+'");')
    		.appendTo( $('#searchCompany>ul') );
    	}
    	
    	return $('<li>').appendTo(ul);
    };
});
//검색내용클릭
function searchMember(m){
	location.href="myBucket.me?nickName="+m;
}
function searchBucket(b){
	location.href="searchbucket.ho?b="+b;
}
function searchTag(t){
	location.href="searchTag.ho?t="+t;
}
function searchCompany(c){
	location.href="searchCompany.ho?c="+c;
}
</script>
</html>