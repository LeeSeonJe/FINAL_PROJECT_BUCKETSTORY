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

#ad_declare {
	margin: 0 auto;
	width: 80%;
}

#ad_de_search{
    text-align: center;
}

</style>
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
		<div>
		<h2>신고 게시판</h2>
	</div>
	
	<div>
	<thead>
		<table id="ad_declare">
			<tr>
				<td><input type="checkbox"></td>
				<td>번호</td>
				<td>말머리</td>
				<td>제목</td>
				<td width="220px;">내용</td>
				<td>아이디</td>
				<td>신고일</td>
				<td>상태</td>
				<td>신고자</td>
			</tr>
		</table>
	</thead>
	<tbody>
			<c:forEach var="Notify" items="${ list }">
			<tr>
				<td>${ Notify.no_no }</td>
				<td>${ Notify.no_kind }</td>
				<td>${ Notify.no_check }</td>
				<td>${ Notify.pigouser }</td>
				<td>${ Notify.enrolldata }</td>
				<td>${ Notify.sinuser }</td>
			</tr>
			</c:forEach>
	</tbody>
			<table style=" margin: 0 auto; ">
					<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="6">
						<!-- [이전] --> 
						
						<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="cautionlist.ad">
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
								<c:url var="pagination" value="cautionlist.ad">
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
							<c:url var="after" value="cautionlist.ad">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
	</div>
	<div id="ad_de_search">
		<select>
			<option>전체보기</option>
			<option>게시글</option>
			<option>댓글</option>
		</select> 
			<input type="text">
			<a href="#">검색</a>
		<button>회원 경고</button>
		<button>전체 삭제</button>
	</div>
</div>
</body>
</html>