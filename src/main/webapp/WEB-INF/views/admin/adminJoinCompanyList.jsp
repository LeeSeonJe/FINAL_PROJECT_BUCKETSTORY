<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<link rel="stylesheet" href="resources/admin/css/adminBoardList.css">
</head>
<style>
h2{
   	width: 47%;
    margin: 0 auto;
    margin-bottom: 25px;
}
</style>
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
						<a href="adminBill.ad?search=all">결제내역</a>
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
		</div>
		<div id="board-area">
		<div>
			<h2>기업 승인</h2>
		</div>
			<form>
				<table class="board">
					<tr>
						<th>아이디</th>
						<th>카테고리</th>
						<th>기업</th>
						<th>신청자</th>
						<th>신청 날짜</th>
						<th>승인 여부</th>
					</tr>
					<c:forEach var="company" items="${ list }">
						<tr>
							<c:url var="companyDetail" value="companyDetail.ad">
								<c:param name="coId" value="${ company.coId }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<td><a href="${ companyDetail }">${ company.coId }</a></td>
							<td>${ company.status }</td>
							<td>${ company.coName }</td>
							<td>${ company.apName }</td>
							<td>${ company.enrollDate }</td>
							<td><c:if test="${ company.approval eq 'N' }">승인대기중</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</form>
				<div id="board-paging">
					<!-- 페이징 처리 -->
						<c:if test="${ pi.currentPage <= 1 }">
						<button id ="prev">이전</button>
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="adminCompany.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }"><button id ="prev">이전</button></a>
						</c:if>
						 
						<!-- 페이지 --> 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button class ="sBtn active">${ p }</button>
							</c:if>

							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="adminCompany.ad">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }"><button class ="sBtn">${ p }</button></a>
							</c:if>
						</c:forEach> 
						
						<!-- [다음] --> 
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button id= "next">다음</button>
						</c:if> 
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="adminCompany.ad">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }"><button id= "next">다음</button></a>
						</c:if>
				</div>
			</div>
<!-- 		<div id="ad_search"> -->
<!-- 			<select> -->
<!-- 				<option>전체보기</option> -->
<!-- 				<option>승인</option> -->
<!-- 				<option>거절</option> -->
<!-- 			</select> <input type="text"> <a href="#">검색</a> -->
<!-- 			<button>승인</button> -->
<!-- 			<button>거절</button> -->
<!-- 		</div> -->
		

</body>
</html>