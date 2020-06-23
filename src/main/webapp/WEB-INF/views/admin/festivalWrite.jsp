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
	height:50px;
	
}

.ad_table{
    margin-left: 30px;
	
}

.ad_table>tbody>tr,
.ad_table>tbody>tr>td{
	height: 45px;
	width: 150px;
}

.btn{
	margin-right: 10px;
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
						<a href="cautionlist.ad">신고</a>
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
					<table class="ad_table">
						<tr>
							<td>제목 </td>
							<td><input type="text" name="fetitle"></td>						
						</tr>
						<tr>
							<td>일시</td>
							<td><input type="text" name="feDate"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post" class="postcodify_postcode5" value="" size="6">
								<button type="button" class="btn" id="postcodify_search_button">검색</button></td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address1" class="postcodify_address" value=""></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
						</tr>
					</table>
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
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script>
			// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
			$(function(){
				$("#postcodify_search_button").postcodifyPopUp();
			});
		</script>
	<script>	
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('서울특별시 용산구 청파로47나길 4', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
	</script>
	
</body>
</html>