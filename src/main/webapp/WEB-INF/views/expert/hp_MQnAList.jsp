<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/hp_boardList.css">
<link rel="stylesheet" href="resources/expert/css/hp_QNA.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
     @media screen and (max-width : 1600px) {
         #moba{ display:none;}
         #moba-content{ position: absolute; left:50px; top:100px; width:150px; height:150px;}
     }
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="Myheader">QNA</div>
	
	
	<!-- imac 배경 -->
	<div id="background"></div>
	
	<!-- 우측사이드 안내판 -->
	<div id="moba"><img src ="resources/expert/images/moba.png"></div>
	<div id="moba-content"></div>
	
	<!-- 섹션 영역 -->
	<section class="p-section" id="hpTop">
	
		<!--  Q&A 전송 -->
		 <div id="inner">
			<div id ="writeform" class="comb" style="display:none;">	
				<div>
					<h2 style ="border-bottom: 1px solid black;">QnA 작성하기</h2>
				</div>
				<br>
					<table>
						<tr>
							<td><b class="rowT">제목</b></td>
							<td><input type="text" name="title" id ="title"></td>
						</tr>
						<tr>
							<td><b class="rowT">내용</b></td>
							<td><textarea rows="10px;" cols="80px;" name="content" id="content"></textarea>
						</tr>
					</table>
					<div>
						<ul>
							<li>
								<button type="reset" class="btn" id="cancle">취소</button>
								<button type="submit" class="btn btn--primary2" id="submitQnA">작성</button>
							</li>
						</ul>
					</div>
			</div>
	
			<!-- Q&A 게시판 목록 영역-->
			<div id="board-area">

			<h3>${loginUser.nickName}님 환영합니다!</h3>
			<h3>Count(${search }): ${ pi.listCount }</h3>
			<button id="newQnA" class="btn btn--primary2" onclick ="newQnA();">새로운 문의글 작성하기</button>
			
				<table class="board" id="boardQnA">
					<thead>
						<tr>
							<th colspan="4">
						</tr>
						<tr>
							<th scope="cols">번호</th>
							<th scope="cols">제목</th>
							<th scope="cols">작성일</th>
							<th scope="cols"><c:if test="${search eq 'all'}">
									<button class="btn btn--primary2" onclick="goShowAll();">전체</button>
									<button class="btn" onclick="goShowMY();">답변</button>
									<button class="btn" onclick="goShowMN();">미답변</button>
								</c:if> <c:if test="${search eq 'Y'}">
									<button class="btn" onclick="goShowMAll();">전체</button>
									<button class="btn btn--primary2" onclick="goShowY();">답변</button>
									<button class="btn" onclick="goShowMN();">미답변</button>
								</c:if> <c:if test="${search eq 'N'}">
									<button class="btn" onclick="goShowMAll();">전체</button>
									<button class="btn" onclick="goShowMY();">답변</button>
									<button class="btn btn--primary2" onclick="goShowN();">미답변</button>
								</c:if></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${empty list }">
							<tr>
								<td colspan="4">내역이 없습니다.<input type="hidden" value="true" id="isListNull"></td>
							</tr>
						</c:if>

						<c:forEach var="b" items="${ list }">
							<tr>
								<td scope="row" align="center">${ b.q_no }</td>
								<td align="center">${ b.q_title }</td>
								<td align="center">${ b.q_date }</td>
								<td align="center">${ b.answer }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<!-- Q&A 게시판 페이징 영역-->
				<div id="board-paging">

					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						<button id="prev">이전</button>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="helperMQnaList.ex?search=${search}">
							<c:param name="page" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }"><button id="prev">이전</button></a>
					</c:if>

					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<button class="sBtn active">${ p }</button>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="helperMQnaList.ex?search=${search}">
								<c:param name="page" value="${ p }" />
							</c:url>
							<a href="${ pagination }"><button class="sBtn">${ p }</button></a>
						</c:if>
					</c:forEach>

					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button id="next">다음</button>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="helperMQnaList.ex?search=${search}">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }"><button id="next">다음</button></a>
					</c:if>
				</div>
			</div>
			<br>
			
		<!-- QnA 게시판 상세보기 영역-->
		 <div class ="section" id ="boardDetail">
	        <div class="content">
	            <table>
	                <tr>
	                    <th><label>번호</label></th>
	                    <th><label>제 목</label></th>
	                    <th>&nbsp&nbsp&nbsp&nbsp&nbsp</th>
	                </tr>
	                <tr>
	                    <td><span id ="q_no" style="color:red"></span></td>
	                    <td><input type="text" id="q_title"></td>
	                    <td><input type="hidden" id="answer"></td>
	                </tr>
	                <tr>
	                    <td><label><b>질문내용▶</b><br></label><span id="q_date">(질문날짜)</span></td>
	                    <td><textarea rows="10px;" cols="50px;" name="content" id="q_content"></textarea></td>
	                    <td><button class="btn btn--primary1" onclick="qnaUpdate();" id="qnaEdit">수정</button><br><br>
	                        <button class="btn btn--primary2" onclick="qnaDelete();">삭제</button></td>
	                </tr>
	                <tr>
	                    <td><label><b>답변내용▶</b><br></label><span id="an_date">(답변날짜)</span></td>
	                    <td><textarea rows="10px;" cols="50px;" name="content" id="an_content" readonly></textarea></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td colspan="3">미답변된 글입니다.</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    </div>
	</section>

<script src="resources/expert/js/qnaM.js"></script>

</body>
</html>