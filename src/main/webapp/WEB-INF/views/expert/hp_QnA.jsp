<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel ="stylesheet" href ="resources/expert/css/hp_sendQnA.css">
<link rel ="stylesheet" href ="resources/expert/css/hp_boardList.css">
<style>
/* #background{ */
/* 	 background: url("resources/common/images/Mountain.jpg"); */
/* 	 background-size:cover; */
/* 	 position: absolute; */
/* 	 left: 0; */
/* 	 right: 0; */
/* 	 top: 0; */
/* 	 bottom: 0; */
/* } */

	#inner{
		width:980px;
		height:auto;
		margin:0 auto;
		margin-top:500px;
		padding: 50px;
		background: #fff;
		border-radius: 7px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>`
	<div id ="background"></div>
	<section>
	<div  id ="writeform" class="comb">	
		<div>
			<br>
			<h2 style ="border-bottom: 1px solid black;">QnA 작성하기</h2>
		</div>
		<br>
<!-- 			<form action ="insertQnA.ex" method="POST"> -->
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
<!-- 			</form> -->
		</div>
		
		<div id ="sucessform" class ="comb">
        	<div id ="su-msg">
        	<br>
	        	<p id ="su-title">성공적으로 전송했습니다.</p>
	        	<hr>
	        	<p>고객님의 소중한 문의사항을 남겨주셔서 감사합니다.</p>
	        	<p>관리자가 빠른시간내에 답변해드리겠습니다</p>
	        	<br>
	        	<button id="retry" class="btn">재문의</button>
  			</div>
        </div>
        
        <div id ="errorform" class ="comb" style="display:none">
        	<p>에러 입니다.</p>
        </div>
	</section>
	
	<section class ="p-section background">
 
 	<div id ="inner">
 	<h3>${coId} 님 환영합니다!</h3>
  	<h3>문의 횟수 : ${ pi.listCount }</h3>
        <!-- 게시판 목록 영역-->
        <div id ="board-area">
           
            <table class="board">
                <thead>
                <tr>
                    <th scope="cols" >번호</th>
                    <th scope="cols" >제목</th>
                    <th scope="cols" >작성일</th>
                    <th scope="cols" >답변여부</th>
                </tr>
                </thead>
                <tbody>
        
        		<c:if test ="${empty list }">
					  <tr>
					  	<td colspan="4">문의 내역이 없습니다.</td>
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
        

            <!-- 게시판 페이징 영역-->
            <div id="board-paging">
    
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button id ="prev">이전</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="helperQnaList.ex">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><button id ="prev">이전</button></a> 
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class ="sBtn active">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="helperQnaList.ex">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }"><button class ="sBtn">${ p }</button></a> 
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button id= "next">다음</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="helperQnaList.ex">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button id= "next">다음</button></a>
				</c:if>
            </div>

               <!-- 게시판 필터 영역-->
               <div id="board-filter">
                <div>
                    <select>
                        <option>전체</option>
                        <option>답변</option>
                        <option>미답변</option>
                    </select>
                    <input type="text" placeholder="">
                    <button id ="searchBtn">검색</button>
                </div>
            </div>
        </div>
       </div>
 </section class ="section"> 
 
 
<script src="resources/expert/js/qna.js"></script>

</body>
</html>