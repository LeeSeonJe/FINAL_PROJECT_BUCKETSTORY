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
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"></jsp:include>				
	</header>
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li><a>축제 작성</a></li>
					<li><a>가입확인</a></li>
					<li><a>결제내역</a></li>
					<li><a>통계</a></li>
					<li><a>신고</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
		</nav>
	</div>
		<div id="board-area">
		<div>
			<h2>QnA 게시판</h2>
		</div>

		<div>
			<table class="board">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>아이디</td>
						<td>작성일</td>
						<td>답변여부</td>
					</tr>
					<c:forEach var="qna" items="${ list }">
						<tr>
							<c:url var="qnadetail" value="qnadetail.ad">
								<c:param name="q_no" value="${ qna.q_no }" />
								<c:param name="page" value="${ pi.currentPage }" />
							</c:url>
							<td>${ qna.q_no }</td>
							<td><a href="${qnadetail}">${ qna.q_title }</a></td>
							<td>${ qna.userid }${ b.coid }</td>
							<td>${ qna.q_date }</td>
							<td>${ qna.answer }</td>
						</tr>
					</c:forEach>
				</table>
				<div id="board-paging">					
				<!-- 페이징 처리 -->
						<!-- [이전] --> 
						<c:if test="${ pi.currentPage <= 1 }">
						<button id ="prev">이전</button>
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="adminQnAlist.ad">
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
								<c:url var="pagination" value="adminQnAlist.ad">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }"><button class ="sBtn">${ p }</button></a>
							</c:if>
						</c:forEach> 
						
						<!-- [다음] --> 
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if> 
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="adminQnAlist.ad">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }"><button id= "next">다음</button></a>
						</c:if>
					</div>
				</div>	
		<div id="ad_search">
			<select>
				<option>전체보기</option>
				<option>기업</option>
				<option>회원</option>
				<option>미답변</option>
				<option>답변완료</option>
			</select> <input type="text"> <a href="#">검색</a>
		</div>
	</div>
		
</body>
</html>