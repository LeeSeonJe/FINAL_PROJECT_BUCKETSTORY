<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_userEstimate.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>	
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
		<div id="Myheader">
			<table id="table_area">
				<tr>
					<td rowspan="4" style="width: 250px;">
						<img id="profileImg" src="resources/member/images/profiles/123.jpg" alt="프로필 사진" />					
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">Seonxi_l</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">이선제</td>
				</tr>
				<tr>
					<td>게시물수 199</td>
					<td>팔로워 40</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<div id="page" >
				
				<h1 style="text-align:center;">견적서가 도착했어요</h1>
				
				<div id="statusView">
					<div id="status1" class="status">받은 견적서 확인</div>
					<div id="status3" class="status">수락 견적서 확인</div>
				</div>
				<c:if test="${ es != null }">
					<c:forEach var="request" items="${ es }" >
						<div id="requestMember">
							<table style="width: 780px;">
								<tr>
									<td rowspan="3" style="width:100px;">
										<img id="requestImage" src="resources/expert/images/photo.jpg" id="profileImage">
									</td>
									<td>
										<h3 style="display:inline">${ request.coId }</h3>
									</td>
									<td>
										${ request.enrollDate }
									</td>
								</tr>
								<tr>
									<td>
												버킷리스트 : ${ bucket.get(request.bkNo) }
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td>
										<div id="bucketListDetail"><a href="estimateView.ex?es_no=${ request.es_no }">견적서 확인하기</a></div>
									</td>
								</tr>
							</table>
						</div>
						<hr style="width:840px;margin: auto;">
					</c:forEach>
				</c:if>
			</div>
		</section>
	</div>
</body>
</html>