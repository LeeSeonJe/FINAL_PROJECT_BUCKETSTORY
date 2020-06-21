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
				<li><a href="getRequest.ex">받은요청 &nbsp</a></li>
				<li><a href="makingRequestView.ex">작성중 &nbsp</a></li>
				<li><h3 style="display: inline;">대기중&nbsp</h3></li>
				<li><a href="completeRequestView.ex">완료요청</a></li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">견적서를 기다리는 버킷리스트</h2>		
		
		<c:if test="${ estimate !=null }">
			<c:forEach var="request" items="${ estimate }" >
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
								${ request.enrollDate }
							</td>
						</tr>
						<tr>
							<td>
								버킷리스트:${ bucket.bkName }
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<div id="bucketListDetail"><a href="estimateView.ex?es_no=${ request.es_no }">견적서 확인</a></div>
							</td>
							<td>
								<c:choose>
									<c:when test="${request.status eq 1 }">
										<h3 style="text-align:center; color:green">수락 대기</h3>
									</c:when>
								</c:choose>
								
							</td>
							
						</tr>
					</table>
				</div>
				<hr style="width:840px">
			</c:forEach>
		</c:if>
		<c:if test="${ estimate eq null }">
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