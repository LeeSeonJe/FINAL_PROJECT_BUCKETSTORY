<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_pointList.css">
<style>
#point-nav ul li:last-child{
	background-color: rgba(0,0,0,0.085);
}
.active{
	background:pink;
}
</style>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/expert/hp_pointCon.jsp"/> --%>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
 <section class ="p-section">
<!--         <p id ="title">포인트 내역</p> -->
 
  	<h3>포인트 내역 : ${ pi.listCount }</h3>
		
        <!-- 게시판 목록 영역-->
        <div id ="board-area">
           
            <table class="board">
                <thead>
                <tr>
                    <th scope="cols" width="10%">번호</th>
                    <th scope="cols" width="10%">충전/사용</th>
                    <th scope="cols" width="25%">포인트</th>
                    <th scope="cols" width="25%">아이디</th>
                    <th scope="cols" width="25%">날짜</th>
                </tr>
                </thead>
                <tbody>
 
<!--                 <tr> -->
<!--                     <td scope="row">3</td> -->
<!--                     <td>사용</td> -->
<!--                     <td>2000 포인트 사용</td> -->
<!--                     <td>KH COMPANY</td> -->
<!--                     <td>2020.05.14</td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td scope="row">2</td> -->
<!--                     <td>충전</td> -->
<!--                     <td>3000 포인트 충전</td> -->
<!--                     <td>KH COMPANY</td> -->
<!--                     <td>2020.05.08</td> -->
<!--                 </tr> -->


					<c:if test="${empty list }">
						<tr>
							<td colspan="5">포인트 충전내역이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="b" items="${ list }">
						<tr>
							<td scope="row" align="center">${ b.pa_no }</td>


							<!--  char 형과 비교 -->
							<c:if test="${b.status eq 'Y'.charAt(0)}">
								<td align="center">충전</td>
							</c:if>
							<c:if test="${b.status eq 'N'.charAt(0)}">
								<td align="center">사용</td>
							</c:if>

							<!-- Y : 충전 , N : 사용 -->
							<%-- 						<td align="center">${ b.status }</td> --%>


							<td align="center">${ b.pa_pay }</td>
							<td align="center">${ b.coid }</td>
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
					<c:url var="before" value="pointList.ex">
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
						<c:url var="pagination" value="pointList.ex">
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
					<c:url var="after" value="pointList.ex">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button id= "next">다음</button></a>
				</c:if>
				
<!--                 <div><button id ="prev">이전</button></div>  -->
<!--                 <div><button class ="sBtn">1</button></div> -->
<!--                 <div><button class ="sBtn">2</button></div> -->
<!--                 <div><button class ="sBtn">3</button></div> -->

<!--                 <div><button id= "next">다음</button></div> -->
            </div>
            
            

               <!-- 게시판 필터 영역-->
               <div id="board-filter">
                <div>
                    <select>
                        <option>전체</option>
                        <option>충전</option>
                        <option>사용</option>
                    </select>
                    <input type="text" placeholder="기업검색">
                    <button id ="searchBtn">검색</button>
                </div>
            </div>


        </div>
       
 </section class ="section"> 
  
</body>
</html>