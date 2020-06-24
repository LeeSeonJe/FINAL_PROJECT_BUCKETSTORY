<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_completeRequest.css">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
				<li><a href="makingRequestView.ex">작성중 &nbsp</a></li>
				<li><a href="roadingRequestView.ex">대기중 &nbsp</a></li>
				<li><h3 style="display: inline;">완료요청</h3></li>
							
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">매칭완료 견적서 화면 입니다.</h2>		
		
		<c:if test="${ not empty es }">
		<c:forEach var="estimate" items="${ es }">
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="4" style="width:100px;">
						<img id="requestImage" src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage">
					</td>
					<td rowspan="2">
						<h3 style="display:inline">${ estimate.userId }</h3>
					</td>
					<td>
						요청일 ${estimate.enrollDate }
					</td>
				</tr>
				<tr>
					
					<td>
						마감일 2020-05-10
					</td>
				</tr>
				<tr>
					<td><h5 style="display:inline;">버킷리스트: ${ bucket.get(estimate.bkNo).bkName }</h5></td>
					<c:if test="${estimate.reviewScore ==0 }">
						<td style="width: 183px;">
							<h3 style="color:red;">리뷰기다리는중</h3>
						</td>
					</c:if>
					<c:if test="${estimate.reviewScore !=0 }">
						<td style="width: 183px;">
							<h3 style="display: inline;float: left;margin-top: 7px;">별점:</h3>
							<p id="star_grade">
							<c:forEach var="a" begin="1" end="${estimate.reviewScore }">
								<p style="float:left;color:red;font-size: x-large;">★</p>
							</c:forEach>
							<c:forEach var="a" begin="${estimate.reviewScore }" end="4">
								<p style="float:left;font-size: x-large;">☆</p>
							</c:forEach>
							</p>
						</td>
					</c:if>
				</tr>
				<tr>
					<td><h3 style="display:inline;">총 견적 비용: ${ estimate.es_price } 원</h3></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="bucketListDetail" onclick="location.href='estimateView.ex?es_no=${estimate.es_no}'">견적서 확인</div>
					</td>
					<td>
						<div id="delete" style="cursor:pointer;"onclick="del(${estimate.es_no});">삭제</div>
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:840px;margin: auto;">
		</c:forEach>
		</c:if>
		<c:if test="${ empty es }">
			<h2 style="text-align:center">완료된 견적이 없습니다.</h2>
		</c:if>
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