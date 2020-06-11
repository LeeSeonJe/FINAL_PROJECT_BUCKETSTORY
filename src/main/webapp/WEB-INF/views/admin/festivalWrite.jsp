<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>
form{
 	border-left: 1px solid gray;
    border-right: 1px solid gray;
    height: 900px;
    margin-top: 45px;
    width: 90%;
    margin: 0 auto;
}

form>adw_formimg>div{
	background-color:black;
	min-width:950px;
	min-height:350px;
	
}

form>#adw_formimg{
	text-align: center;
	margin-bottom: 50px;
    margin-top: 40px;
}

form>div>div>ul>li{
	list-style: none;
	font-size: 15px;
    height: 60px;
}

#adw_formDiv{
    width: 75%;
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
	
}
</style>
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
						<a href="adminwrite.ad">축제 작성</a>	
					</li>
					<li>
						<a href="adminCompany.ad">가입확인</a>
					</li>
					<li>
						<a href="adminBill.ad">결제내역</a>
					</li>
					<li>
						<a href="">통계</a>
					</li>
					<li>
						<a href="adminCaution.ad">신고</a>
					</li>
					<li>
						<a href="adminQnAlist.ad">QnA</a>
					</li>
				</ul>
			</div>
		</nav>
		<form action="feinsert.ad" method="post" id="adw_form" enctype="multipart/form-data">
			<div id="adw_formimg">
				<input type="file" name="feUploadFile">
			</div>
			<div id="adw_formDiv">
				<div class="adw_formdiv">
					<ul>
						<li>
							제목 : <input type="text" name="fetitle">
						</li>
						<li>
							일시 : <input type="text" name="feDate">
						</li>
						<li>
							장소 : <input type="text" name="feplace">
						</li>
					</ul>
				</div>
				<div class="test" id="map"
					style="width: 300px; height: 300px; float: right;">
				</div>
				<div>
					<textarea id="adw_textarea" name="fecontent">내용작성</textarea>
				</div>
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