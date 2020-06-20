<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_getRequest.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
	<div id="page">
		<div id="submenu">
			<ul>
				<li><h3 style="display: inline;">받은요청 &nbsp</h3></li>
				<li><a href="makingRequestView.ex?coId=${ coId }">작성중 &nbsp</a></li>
				<li><a href="roadingRequestView.ex?coId=${ coId }">대기중&nbsp</a></li>
				<li><a href="completeRequestView.ex?coId=${ coId }">완료요청</a></li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">견적서를 기다리는 버킷리스트</h2>		
		
		<c:if test="${ er != null }">
			<c:forEach var="request" items="${ er }" >
				<div id="requestMember">
					<table style="width: 780px;">
						<tr>
							<td rowspan="3" style="width:100px;">
								<img id="requestImage" src="resources/expert/images/photo.jpg" id="profileImage">
							</td>
							<td>
								<h3 style="display:inline">${ request.userId }</h3>
							</td>
							<td>
								${ request.esr_enrollDate }
							</td>
						</tr>
						<tr>
							<td>
								요청보낸사람의 버킷리스트 카테고리
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<div id="bucketListDetail"><a href="requestDetail.ex?esr_no=${ request.esr_no }">버킷리스트 요청보기</a></div>
							</td>
						</tr>
					</table>
				</div>
				<hr style="width:840px">
			</c:forEach>
		</c:if>
		<c:if test="${ er == null }">
			<h2 style="text-align:center">받은 견적 요청이 없습니다.</h2>
		</c:if>
		
		
		<div id="ListAdd">
			<div id="ListArea">
				<h4 style="display:inline">더보기</h4>
				&nbsp;&nbsp;&nbsp;▼
			</div>
		</div>
	</div>
</body>
</html>