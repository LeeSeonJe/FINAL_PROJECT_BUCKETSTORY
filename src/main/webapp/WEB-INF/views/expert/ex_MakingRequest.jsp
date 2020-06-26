<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_MakingRequest.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
<section>
	<div id="page">
		<div id="submenu">
			<ul>
				<li><a href="getRequest.ex">받은요청 &nbsp</a></li>
				<li><h3 style="display: inline;">진행중 &nbsp</h3></li>
				<li><a href="roadingRequestView.ex">대기중 &nbsp</a></li>
				<li><a href="completeRequestView.ex">완료요청</a></li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">작성중인 견적서 화면입니다.</h2>		
		<c:if test="${ not empty estimate }">
		<c:forEach var="es" items="${estimate }">
			<div id="requestMember">
			
				<table style="width: 780px;">
				
					<tr>
						<td rowspan="3" style="width:100px;">
							<c:if test="${es.userId != m.get(es.userId).userId }">
									<img id="requestImage" src="resources/expert/images/photo.jpg" id="profileImage">
								</c:if>
								<c:if test="${es.userId == m.get(es.userId).userId }">
									<img id="requestImage" src="resources/member/images/profiles/${m.get(es.userId).prImage }" id="profileImage">
								</c:if>
						</td>
						<td>
							<h3 style="display:inline">${ es.userId }</h3>
						</td>
						<td>
							요청일 : ${ es.enrollDate }
						</td>
					</tr>
					<tr>
						<td>
							버킷리스트:${ bucket.get(es.bkNo).bkName } 
						</td>
						<td>
							마감일 2020-05-10
						</td>
					</tr>
					<tr>
						<td>
							<div id="bucketListDetail"><a href="makingEstimate.ex?es_no=${ es.es_no }">견적서 완성하기</a></div>
						</td>
						<td>
							<div id="delete" style="cursor:pointer;" onclick="del(${es.es_no});">삭제</div>
						</td>
					</tr>
				</table>
			</div>
			<hr style="width:840px;margin: auto;">
			</c:forEach>
		</c:if>
		<c:if test="${ empty estimate }">
			<h2 style="text-align:center">작성중인 견적서가 없습니다.</h2>
		</c:if>
		<table style="margin: auto;">
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="makingRequestView.ex">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="makingRequestView.ex">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="makingRequestView.ex">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
		<br><br>
		<script>
			function del(val){
				if(confirm("해당 요청을 정말 삭제하겠습니까?") == true){
					location.href='deleteEstimate.ex?es_no='+val;
				}else{
					return false;
				}
			}
		</script>
		<!-- <div id="ListAdd">
			<div id="ListArea">
				<h4 style="display:inline">더보기</h4>
				&nbsp;&nbsp;&nbsp;▼
			</div>
		</div> -->
	</div>
</section>
</body>
</html>