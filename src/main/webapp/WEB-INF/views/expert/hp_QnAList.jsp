<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_boardList.css">
<style>

	.background{
		 background: url("resources/common/images/Mountain.jpg");
	 background-size:cover;
	}
	#inner{
		width:980px;
		height:auto;
		margin:0 auto;
		padding: 50px;
		background: #fff;
		border-radius: 7px;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
 
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
</body>
</html>