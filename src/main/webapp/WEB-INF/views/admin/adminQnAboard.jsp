<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>
	div > h2 {
    margin-left: 70px;
    margin-top: 50px;
    width: 90%;
    border-bottom: 1px solid black;
}

#ad_qna {
    margin: 0 auto;
	width: 86%;
    margin-left: 289px;
}

#adw_search{
    text-align: center;
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
					<li><a>축제 작성</a></li>
					<li><a>가입확인</a></li>
					<li><a>결제내역</a></li>
					<li><a>통계</a></li>
					<li><a>신고</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
		</nav>
		<div>
			<h2>QnA 게시판</h2>
		</div>

		<div>
			<table id="ad_qna">
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>아이디</td>
						<td>작성일</td>
						<td>답변여부</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
						<tr>
							<c:url var="qnadetail" value="qnadetail.ad">
								<c:param name="q_no" value="${ b.q_no }" />
								<c:param name="page" value="${ pi.currentPage }" />
							</c:url>
							<td>${ b.q_no }</td>
							<td><a href="${qnadetail}">${ b.q_title }</a></td>
							<td>${ b.userid }${ b.coid }</td>
							<td>${ b.q_date }</td>
							<td>${ b.answer }</td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="6">
						<!-- [이전] --> 
						<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="adminQnAlist.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if> 
						<!-- 페이지 --> 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>

							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="adminQnAlist.ad">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
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
							<a href="${ after }">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div id="adw_search">
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