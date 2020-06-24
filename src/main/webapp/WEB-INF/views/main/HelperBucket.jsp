<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬퍼 버킷</title>
	<link rel="stylesheet" href="resources/main/css/HelperBucket.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<div id="section-wrap">
		<section>
			<c:forEach var="b" items="${ bucketList }">
			<div class="bucket ${ b.bkNo }" id="bucket${ b.bkNo }" onclick="bkDetail(${b.bkNo}, ${b.cateNum}, '${b.bkName}', '${b.bkContent}', '${b.tag}', '${b.userId}');">
			
				<!-- 버킷 사진 -->
				<c:forEach var="m" items="${blImg}">
					<c:if test="${ m.bkno == b.bkNo }">
	<script>
		$('.bucket.${ b.bkNo }').css('background-image', 'url("resources/muploadFiles/${m.mweb}")');
	</script>
					</c:if>
				</c:forEach>
				<!-- 버킷 주인 -->
				<c:if test="${ b.userId ne '관리자찡' }">
				<div class="bucketStoryNick">${ b.userId }</div>
				</c:if>
				<c:if test="${ b.userId eq '관리자찡' }">
				<div class="bucketStoryNick">추천</div>
				</c:if>
				
				<c:set var="bCount" value="0"/>
				<c:forEach var="blog" items="${ blogList }">
					<c:if test="${ blog.userid == b.userId && blog.bkNo == b.bkNo}">
						<c:set var="bCount" value="${ bCount + 1 }"/>
					</c:if>
				</c:forEach>
				<div class="bucketStoryStory">${ bCount }</div>
				
				<div class="bucketContent">
					<div class="c-category">
						<c:choose>
							<c:when test="${ b.cateNum == 1 }"><span style="color:#00c5bc;">Travel</span><c:set var="cateName" value="Travel"/></c:when>
							<c:when test="${ b.cateNum == 2 }"><span style="color:#fd8ab1;">Sport</span><c:set var="cateName" value="Sport"/></c:when>
							<c:when test="${ b.cateNum == 3 }"><span style="color:#fd8b42;">Food</span><c:set var="cateName" value="Food"/></c:when>
							<c:when test="${ b.cateNum == 4 }"><span style="color:#c78646;">New Skill</span><c:set var="cateName" value="New Skill"/></c:when>
							<c:when test="${ b.cateNum == 5 }"><span style="color:#9f7ed7;">Culture</span><c:set var="cateName" value="Culture"/></c:when>
							<c:when test="${ b.cateNum == 6 }"><span style="color:#6fc073;">Outdoor</span><c:set var="cateName" value="Outdoor"/></c:when>
							<c:when test="${ b.cateNum == 7 }"><span style="color:#efc648;">Shopping</span><c:set var="cateName" value="Shopping"/></c:when>
							<c:when test="${ b.cateNum == 8 }"><span style="color:#87adf8;">Lifestyle</span><c:set var="cateName" value="Lifestyle"/></c:when>
						</c:choose>
					</div>
					<div class="c-bucket">
						<div class="c-bucket-1">${ b.bkName }</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</section>
	</div>
	<div id="FullOverLay">
		<div id="bucketDatail">
			<div id="bucketexit">X</div>
			<div id="bucketGoBlog" onclick="location.href='login.co'">블로그 가기</div>
			<div id="bucketimg">
				<ul>
				</ul>
				<div id="bucketcate">FOOD</div>
				<div id="buckettitle">리틀 포레스트에 나오는 음식 따라 만들기</div>
				<div id="bucketleft">〈</div>
				<div id="bucketright">〉</div>
				<div id="bucketComAdd"> DELETE </div>
				<div id="bucketComFestival"> 축제 추가 </div>
			</div>
			<div id="bucketcp">
				<div id="bucketTag">
					<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
					<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
					<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
					<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
					<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
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
					<div id="profile-div">
						<div id="profile1"></div>
						<div id="profile2">한호성</div>
					</div>
				</div>
			</div>
			<div id="bucketcpEvent"></div>
		</div>
	</div>
</body>
<script>
	first = 1;
	dataNum = 0;
$(function(){
	// --section 버킷들 width에 따라 height변화
	$('section').css('top', '105px');
	$('section').css('position', 'relative');
	var hg = $('.bucket').css('width');
	$('.bucket').css('height', hg);
	
	
	$(window).resize(function(){
		var hg = $('.bucket').css('width');
		$('.bucket').css('height', hg);
		var bkhg = $('#bucketDatail').width()/16 * 9;
		$('#bucketimg').css('height', bkhg);
		var bkcphg = $('#bucketimg').width()-411;
		$('#bucketcp').css('width', bkcphg);
		$('#bucketleft').css('top', bkhg/2);
		$('#bucketright').css('top', bkhg/2);
		$('#bucketimg img').css('width', $('#bucketimg').width());
		$('#bucketimg img').css('height', bkhg);
	});
	
	// 버킷리스트 상세보기 클릭 종류
	$('.bucket').click(function(e){
		if($(e.target).hasClass('c-likeBtn') || $(e.target).hasClass('likehover') || $(e.target).hasClass('likelabel')){
			
		} else if($(e.target).hasClass('c-addBtn')){
			
		} else if($(e.target).hasClass('c-wishBtn') || $(e.target).hasClass('wishhover') || $(e.target).hasClass('wishlabel')){
			
		} else{
			$('body').css('height', '100%');
			$('body').css('overflow', 'hidden');
			$('#FullOverLay').show();
			var bkhg = $('#bucketDatail').width()/16 * 9;
			$('#bucketimg').css('height', bkhg);
			$('#bucketleft').css('top', bkhg/2);
			$('#bucketright').css('top', bkhg/2);
			var bkcphg = $('#bucketimg').width()-411;
			$('#bucketcp').css('width', bkcphg);
			$('#bucketimg img').css('width', $('#bucketimg').width());
			$('#bucketimg img').css('height', bkhg);
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
function bkDetail(bkNo, cateNum, bkName, bkContent, tag, userId){
	first = 1;
	dataNum = 0;
	$('#bucketimg>ul').css('left', 0);
	$('#bucketimg>ul').html('');
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
	$('#buckettitle').text(bkName);
	$('#bucketexplain').text(bkContent);
	$('#bucketlike').attr('onclick', 'blLikeUp('+bkNo+');');
	$('#bucketAdd').attr('onclick', 'sharebl('+bkNo+',"'+userId+'");');
	$('#bucketwish').attr('onclick', 'wishRegist('+bkNo+',"'+userId+'");');
	$('#bucketleft').attr('onclick', 'left('+bkNo+',"'+userId+'","'+bkName+'");');
	$('#bucketright').attr('onclick', 'right('+bkNo+',"'+userId+'");');
	var tags = tag.split(',');
	$('#bucketTag').html('');
	for(var i in tags){
		$('#bucketTag').append('<div id="bucketTag1"><span>#</span>'+tags[i]+'</div>');
	}
	$('#bucketAdd').show();
	$('#bucketComAdd').attr('onclick', 'deletecobucket('+bkNo+')');
	$('#bucketComFestival').attr('onclick', 'coFestival('+bkNo+',"'+bkName+'")');
	if($('.c-wishBtn.'+bkNo+'>label').text() == '취소'){
		$('#bucketwish').css('color', '#10ccc3');
	}
	// 버킷사진 가져오기
	if(1<=bkNo&&bkNo<=10){
		$.ajax({
			url:'bkDetailMedia.ho',
			data:{
				bkNo:bkNo
			},
			async : false,
			success:function(data){
				var value = data.substring(0,5);
				var $li = '<li><img src="http://images.hwlife.hscdn.com//library/'+value+'_view_01.jpg"></li>';
				$('#bucketimg>ul').append($li);
			}
		});
	} else{
		$.ajax({
			url:'bkDetailMedia.ho',
			data:{
				bkNo:bkNo
			},
			async : false,
			success:function(data){
				var $li = '<li><img src="resources/muploadFiles/'+data+'"></li>';
				$('#bucketimg>ul').append($li);
			}
		});
	}
	// 블로그 사진 가져오기
	$('#bucketGoBlog').show();
	$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'"');
	if(userId == '관리자찡'){
		$('#bucketGoBlog').hide();
	}
	$.ajax({
		url:'blogMedia.ho',
		data:{
			bkNo:bkNo,
			nickName:userId
		},
		async : false,
		success:function(data){
			if(data.length > 0){
				$('#bucketright').show();
				for(var key in data){
					var $li = '<li><img src="resources/member/images/blogUploade/'+data[key]+'"></li>';
					$('#bucketimg>ul').append($li);
				}
			} else{
				$('#bucketright').hide();
			}
		}
	});
	// 공유한 사람
	$.ajax({
		url:'bkDetailShare.ho',
		data:{
			bkNo:bkNo
		},
		async : false,
		success:function(data){
			if(data.length > 0){
				$('#bucketwithPro').html('');
				$('#bucketwithCount>span').text(data.length);
				for(var key in data){
					if('${loginUser}' != ""){
						if(data[key].nickName == '${loginUser.nickName}'){
							$('#bucketAdd').hide();
						}
					}
					if(data[key].userId != 'admin'){
						if(data[key].prImage != null){
							var $div = '<a href="myBucket.me?nickName='+data[key].nickName+'"><div id="profile-div"><div id="profile1"><img src="resources/muploadFiles/'+data[key].prImage+'" style="width:100%;height:100%"></div><div id="profile2">'+data[key].nickName+'</div></div></a>';
							$('#bucketwithPro').append($div);
						} else{
							var $div = '<a href="myBucket.me?nickName='+data[key].nickName+'"><div id="profile-div"><div id="profile1"></div><div id="profile2">'+data[key].nickName+'</div></div></a>';
							$('#bucketwithPro').append($div);
						}
					} else{
						$('#bucketwithCount>span').text(data.length-1);
					}
				}
			} else{
				$('#bucketwithPro').html('');
				$('#bucketwithCount>span').text('0');
			}
		}
	});
}
// 축제 작성 하러가기
function coFestival(bkNo, bkName){
	var result = confirm('이 버킷에 행사를 추가하시겠습니까?');
	if(result){
		location.href="coEventView.ex?bkNo="+bkNo+"&bkName="+bkName;
	} else{
		alert('취소');
	}
}
// 마이 버킷 삭제하기
function deletecobucket(bkNo){
	var result = confirm('이 버킷을 삭제하시겠습니까?');
	if(result){
		location.href="deleteCoBucket.ho?bkNo="+bkNo;
	} else{
		alert('취소');
	}
}
function left(bkNo, userId, bkName){
	first--;
	$.ajax({
		url:'blogMedia.ho',
		data:{
			bkNo:bkNo,
			nickName:userId
		},
		async : false,
		success:function(data){
			if(data.length > 0){
				dataNum = data.length+2;
			}
		}
	});
	$.ajax({
		url:'bloginfo.ho',
		data:{
			bkNo:bkNo,
			nickName:userId
		},
		async : false,
		success:function(data){
			if(first==1){
				$('#buckettitle').text(bkName);
				$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'"');
			} else{
				$('#buckettitle').text(data[first-2].bTitle);
				$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'&bNo='+data[first-2].bNo+'"');
			}
		}
	});
	var val1 = $('#bucketimg>ul').css('left').replace('px', '');
	var val2 = $('#bucketimg li').width();
	var leftval = parseInt(val1) + val2;
	if(first > 0){
		$('#bucketimg>ul').animate({
			left:leftval
		});
		if(first == 1){
			$('#bucketleft').hide();
		} else{
			$('#bucketleft').show();
		}
		if(first == dataNum-1){
			$('#bucketright').hide();
		} else{
			$('#bucketright').show();
		}
	}
}
function right(bkNo, userId){
	first++;
	$.ajax({
		url:'blogMedia.ho',
		data:{
			bkNo:bkNo,
			nickName:userId
		},
		async : false,
		success:function(data){
			if(data.length > 0){
				dataNum = data.length+2;
			}
		}
	});
	$.ajax({
		url:'bloginfo.ho',
		data:{
			bkNo:bkNo,
			nickName:userId
		},
		async : false,
		success:function(data){
			$('#buckettitle').text(data[first-2].bTitle);
			$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'&bNo='+data[first-2].bNo+'"');
		}
	});
	var val1 = $('#bucketimg>ul').css('left').replace('px', '');
	var val2 = $('#bucketimg li').width();
	var leftval = val1 - val2;
	if(first < dataNum){
		$('#bucketimg>ul').animate({
			left:leftval
		});
		if(first == 1){
			$('#bucketleft').hide();
		} else{
			$('#bucketleft').show();
		}
		if(first == dataNum-1){
			$('#bucketright').hide();
		} else{
			$('#bucketright').show();
		}
	}
}
</script>
</html>