<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <link rel="stylesheet" href="resources/admin/css/adminDefault.css"> -->
<!-- <link rel="stylesheet" href="resources/admin/css/adminBoardList.css"> -->
<!-- </head> -->
<!-- <style> -->

/* h2{ */
/*    	width: 47%; */
/*     margin: 0 auto; */
/*     margin-bottom: 25px; */
/* } */

/*  a:link{  */
/*   	color: black; text-decoration: none;  */
/*   }  */
/*  a:visited{  */
/*   	 color: black; text-decoration: none;  */
/*  }  */
/*   a:hover{  */
/*  	color: black; text-decoration: none; */
/*   }  */
<!-- </style> -->
<!-- <body> -->
<!-- 	<header> -->
<%-- 		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include> --%>
<!-- 	</header> -->
<!-- 	<div id="adw_body"> -->
<!-- 		<nav> -->
<!-- 			<div id="adw_menu"> -->
<!-- 				<ul> -->
<!-- 					<li> -->
<!-- 						<a href="adminwrite.ad">축제 작성</a>	 -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="adminCompany.ad">가입확인</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="adminBill.ad">결제내역</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="">통계</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="cautionlist.ad">신고</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="adminQnAlist.ad">QnA</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</nav> -->
<!-- 	</div> -->
<!-- 		<div id="board-area"> -->
<!-- 		<div> -->
<!-- 			<h2>QnA 게시판</h2> -->
<!-- 		</div> -->

<!-- 		<div> -->
<!-- 			<table class="board"> -->
<!-- 					<tr> -->
<!-- 						<th>번호</th> -->
<!-- 						<th>기업</th> -->
<!-- 						<th>포인트</th> -->
<!-- 						<th>날짜</th> -->
<!-- 						<th>답변여부</th> -->
<!-- 					</tr> -->
<%-- 						<c:forEach var="" items="${ list }"> --%>
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</table> -->
<!-- 				<div id="board-paging">					 -->
<!-- 				페이징 처리 -->
<!-- 						[이전]  -->
<%-- 						<c:if test="${ pi.currentPage <= 1 }"> --%>
<!-- 						<button id ="prev">이전</button> -->
<%-- 						</c:if>  --%>
<%-- 						<c:if test="${ pi.currentPage > 1 }"> --%>
<%-- 							<c:url var="before" value="adminQnAlist.ad"> --%>
<%-- 								<c:param name="page" value="${ pi.currentPage - 1 }" /> --%>
<%-- 							</c:url> --%>
<%-- 							<a href="${ before }"><button id ="prev">이전</button></a> --%>
<%-- 						</c:if>  --%>
<!-- 						페이지  -->
<%-- 						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> --%>
<%-- 							<c:if test="${ p eq pi.currentPage }"> --%>
<%-- 								<button class ="sBtn active">${ p }</button> --%>
<%-- 							</c:if> --%>

<%-- 							<c:if test="${ p ne pi.currentPage }"> --%>
<%-- 								<c:url var="pagination" value="adminQnAlist.ad"> --%>
<%-- 									<c:param name="page" value="${ p }" /> --%>
<%-- 								</c:url> --%>
<%-- 								<a href="${ pagination }"><button class ="sBtn">${ p }</button></a> --%>
<%-- 							</c:if> --%>
<%-- 						</c:forEach>  --%>
						
<!-- 						[다음]  -->
<%-- 						<c:if test="${ pi.currentPage >= pi.maxPage }"> --%>
<!-- 							<button id= "next">다음</button> -->
<%-- 						</c:if>  --%>
<%-- 						<c:if test="${ pi.currentPage < pi.maxPage }"> --%>
<%-- 							<c:url var="after" value="adminQnAlist.ad"> --%>
<%-- 								<c:param name="page" value="${ pi.currentPage + 1 }" /> --%>
<%-- 							</c:url> --%>
<%-- 							<a href="${ after }"><button id= "next">다음</button></a> --%>
<%-- 						</c:if> --%>
<!-- 					</div> -->
<!-- 				</div>	 -->
<!-- 			</div> -->
		
<!-- </body> -->
<!-- </html> -->