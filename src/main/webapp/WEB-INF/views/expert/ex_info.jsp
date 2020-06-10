<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
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
					<td><h1>${ company.coId }</h1></td>
					<td><div class="likebtn"><button>♥좋아요</button></div></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<c:if test="${ company.coIntro != null }">
								<% pageContext.setAttribute("newLineChar", "\r\n"); %>
								${ fn:replace(company.coIntro, newLineChar, "<br>") }
							</c:if>
							<c:if test="${ company.coIntro eq null }">
								업체 간단 소개가 없습니다.
							</c:if>
						</div>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<h2>업체정보</h2>
				<c:if test="${ company.coInfo != null }">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %>
					${ fn:replace(company.coInfo, newLineChar, "<br>") }
				</c:if>
				<c:if test="${ company.coInfo eq null }">
					업체 정보가 없습니다.
				</c:if>
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
			<c:if test="${ bucket eq null }">
				<li>함께하는 버킷리스트가 없습니다.</li>
			</c:if>
			<c:if test="${ bucket !=null }">
				<c:forEach var="bucket" items="${ bucket }">
					<li>${ bucket.bkName }</li>
				</c:forEach>
			</c:if>
		</ul>
		
		<c:url var="estimate" value="estimate.ex">
			<c:param name="coid" value="${ company.coId }"/>
		</c:url>
		<c:url var="ex_infoUpdate" value="ex_infoUpdateForm.ex">
			<c:param name="coid" value="${ company.coId }"/>
		</c:url>
		<div id="subBtn">
			<button onclick="location.href='${ estimate }'">맞춤견적 신청</button>
			<button onclick="location.href='${ ex_infoUpdate }'">정보수정</button>
		</div>
	</div>
	<script>
	var currentPosition = parseInt($("#page-2").css("top")); $(window).scroll(function() { var position = $(window).scrollTop(); $("#page-2").stop().animate({"top":position+currentPosition+"px"},1000); });

	</script>
</div>
</body>
</html>