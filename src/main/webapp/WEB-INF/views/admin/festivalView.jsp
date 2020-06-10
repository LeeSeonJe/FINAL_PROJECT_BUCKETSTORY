<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
			<div id="adw_choyears">
				@2020
			</div>

		<form action="finsert.ad" method="post" id="adw_table">
			<div>
				<div id="adw_years">
					2020년
				</div>
				
				<div id="adw_formimg">
					<img src="${ contextPath} ">
				</div>
			</div>
			<div id="adw_formDiv">
				<div class="adw_formdiv">
					<ul>
						<li>
							<span>제목:</span> 
							<span>${ festival.fetitle }</span>
						</li>
						<li>
							<span>일시:</span> 
							<span>${ festival.feDate }</span>
						</li>
						<li>
							<span>장소:</span> 
							<!-- <span>장소:</span> -->
						</li>
					</ul>
				</div>
				<div class="test" id="map"
					style="width: 300px; height: 300px; float: right;"></div>
				<div>
					<span>내용작성</span> 
					<span>${ festival.fecontent }</span>
				</div>
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