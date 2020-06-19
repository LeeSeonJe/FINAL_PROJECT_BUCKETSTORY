<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_boardList.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.pboard{
		font-size: large;
	}
	.rowp{
		background:#fff;
	}
	#select{
		
	}
</style>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/expert/hp_pointCon.jsp"/> --%>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
 <section class ="p-section">
<!--         <p id ="title">포인트 내역</p> -->
 
    <h3>${coId} 님 환영합니다!</h3>
    
  	<c:if test = "${search eq 'Y'}">
  		<h3>포인트 충전(${search}) 횟수 : ${ pi.listCount }</h3>
  		<h3>총 충전 포인트 : ${hp }</h3>
  	</c:if>
  	<c:if test = "${search eq 'N'}">
  		<h3>포인트 사용(${search}) 횟수 : ${ pi.listCount }</h3>
  		<h3>총 사용 포인트 : ${hp }</h3>
  	</c:if>
  	<c:if test = "${search eq 'all'}">
  		<h3>포인트 충전/사용(${search}) 횟수 : ${ pi.listCount }</h3>
  		<h3>총 보유 포인트 : ${hp }</h3>
  	</c:if>
  	

        <!-- 게시판 목록 영역-->
        <div id ="board-area">
           
     
            <table class="board pboard">
                <thead>
                <tr>
                	<th colspan="4">
                </tr>
                <tr>
                    <th scope="cols" width="8%">번호</th>
                    <th scope="cols" width="20%">
                    
                    <c:if test = "${search eq 'all'}">
                       <button class ="btn btn--primary2" onclick="goShowAll();">전체</button>
                    </c:if>
                    
                    <c:if test = "${search ne 'all'}">
                       <button class ="btn" onclick="goShowAll();">전체</button>
                    </c:if>
                    
            		<c:if test = "${search eq 'Y'}">
		               <button class ="btn btn--primary2" onclick="goShowY();">충전</button>
		            </c:if>
		            <c:if test = "${search ne 'Y'}">
		               <button class ="btn" onclick="goShowY();">충전</button>
		            </c:if>
		            
		            <c:if test = "${search eq 'N'}">
		               <button class ="btn btn--primary2" onclick="goShowN();">사용</button> 
		            </c:if>
		              <c:if test = "${search ne 'N'}">
		               <button class ="btn" onclick="goShowN();">사용</button> 
		            </c:if>
		            
                    </th>
                    <th scope="cols" width="30%">포인트</th>
                    <th scope="cols" width="32%">날짜</th>
                </tr>
                </thead>
                <tbody>


					<c:if test ="${empty list }">
					  <tr>
					  	<td colspan="4">포인트 충전내역이 없습니다.</td>
					  </tr>
					</c:if>
					
					<c:forEach var="b" items="${ list }">
						<tr>
							<td class ="rowp" scope="row" align="center">${ b.pa_no }</td>
						<!--  char 형과 비교 -->
						<c:if test="${b.status eq 'Y'.charAt(0)}"> 
						      <td align="center">충전</td>
						</c:if>
						<c:if test="${b.status eq 'N'.charAt(0)}"> 
						      <td align="center">사용</td>
						</c:if>
					
							<td align="center">${ b.pa_pay }</td>
							<td align="center">${ b.pdate }</td>
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
					<c:url var="before" value="pointListYN.ex?search=${search }>">
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
						<c:url var="pagination" value="pointListYN.ex?search=${search}">
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
					<c:url var="after" value="pointListYN.ex?search=${search}">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button id= "next">다음</button></a>
				</c:if>
            </div>
        </div>
       
 </section class ="section"> 
   <script>
	$(function() {
		$('.board td').mouseenter(function() {
			$(this).parent().css({
				'background' : 'beige',
				'cursor' : 'pointer'
			})
		}).mouseout(function() {
			$(this).parent().css({
				'background' : 'whitesmoke'
			})
		})
		
		
	});
	
	function goShowAll(){
		location.href="pointListYN.ex?search=all";
	}
	
	function goShowY(){
		location.href="pointListYN.ex?search=Y";
	}
	function goShowN(){
		location.href="pointListYN.ex?search=N";
	}
	
 </script>
</body>
</html>