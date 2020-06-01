<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
      <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/expert/css/ex_info.css">
<title>Insert title here</title>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<c:import url="../layout/mainNav.jsp"/>
<c:import url="../layout/mainLeftSide.jsp"/>
<div id="page">
	<div id="page-1">
		<div id="inputPhoto">
			<img src="resources/expert/images/배경-1.jpg" id="mainPhoto" name="mainPoto">
		</div>
		
		<div id="sum-upPage">
			
			<hr>
			
			<table id="helperProfile" style="border:1px solid black; width:600px;height:200px;">
				<tr>
					<td rowspan="2"><img src="resources/expert/images/photo.jpg" id="profileImage" ></td>
					<td><h1>업체이름</h1></td>
					<td><div class="likebtn"><button>♥좋아요</button></div></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
						업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개
						</div>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<h2>업체정보</h2>
			수 있는 것이다 청춘은 인생의 황금시대다 우리는 이 황금시대의 가치를 충분히 발휘하기 위하여 이 황금시대를 영원히

			산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를

			착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다
		
			<hr>
			
			<div>
				<h2>리뷰(개수)</h2>
				<div id="reviewavgview">
					<h4>리뷰 평점</h4>
					<h4>★★★★★</h4>
					<h4>(5.0)</h4>
				</div>
				
				<div id=reviewbox">
					<table style="border:1px solid balck">
						<tr>
							<td style="width:86px; height:77px">
								<img src="resources/expert/images/photo.jpg" id="reviewprofile">
								<h5>닉네임</h5>
							</td>
							<td rowspan="2">
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								2020-02-02
							</td>
						</tr>
					</table>
					<hr>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div id="page-2">
		<ul style="padding-inline-start: 0px;">
			<li><h5>함께하는 버킷리스트</h5></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
		</ul>
		
		<c:url var="estimate" value="estimate.ex">
			<c:param name="coid" value="${ coid }"/>
		</c:url>
		
		<div id="subBtn">
			<button onclick="location.href='${ estimate }'">맞춤견적 신청</button>
		</div>
	</div>
	<script>
	var currentPosition = parseInt($("#page-2").css("top")); $(window).scroll(function() { var position = $(window).scrollTop(); $("#page-2").stop().animate({"top":position+currentPosition+"px"},1000); });

	</script>
</div>
</body>
</html>