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

  a:link{  
   	color: black; text-decoration: none;  
   }  
  a:visited{  
   	 color: black; text-decoration: none;  
   a:hover{ 
  	color: black; text-decoration: none; 
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
						<a href="adminBill.ad">결제내역</a>
					</li>
					<li>
						<a href="">통계</a>
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
			<div>
	            <div id="board-area">
               <table class="board pboard" id="hpBottom">
                  <thead>
                     <tr>
                        <th colspan="4">
                     </tr>
                     <tr>
                        <th scope="cols" width="8%">번호</th>
                        <th scope="cols" width="30%">포인트</th>
                        <th scope="cols" width="30%">아이디</th>
                        <th scope="cols" width="32%">날짜</th>
                        <th scope="cols" width="20%">
<%--                         	<c:if test="${search eq 'all' || search eq 'none'}"> --%>
                              <button class="btn btn--primary2" onclick="goShowAll();">전체</button>
                              <button class="btn" onclick="goShowY();">충전</button>
                              <button class="btn" onclick="goShowN();">사용</button>
<%--                            </c:if> <c:if test="${search eq 'Y'}"> --%>
                              <button class="btn" onclick="goShowAll();">전체</button>
                              <button class="btn btn--primary2" onclick="goShowY();">충전</button>
                              <button class="btn" onclick="goShowN();">사용</button>
<%--                            </c:if> <c:if test="${search eq 'N'}"> --%>
                              <button class="btn" onclick="goShowAll();">전체</button>
                              <button class="btn" onclick="goShowY();">충전</button>
                              <button class="btn btn--primary2" onclick="goShowN();">사용</button>
<%--                            </c:if> --%>
                           </th>
                     </tr>
                  </thead>
                  <tbody>


                     <c:if test="${empty list }">
                        <tr>
                           <td colspan="4">포인트 충전내역이 없습니다.</td>
                        </tr>
                     </c:if>

                     <c:forEach var="b" items="${ list }">
                        <tr>
                           <td class="rowp" scope="row" align="center">${ b.pa_no }</td>
                           <!--                    char 형과 비교 -->
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
			<script>
			function goShowAll(){
				newPaging('all');
				$('.SB').removeClass('btn--primary2');
				$('#allBtn').addClass('btn--primary2');
			}
			function goShowY(){
				newPaging('Y');
				$('.SB').removeClass('btn--primary2');
				$('#yBtn').addClass('btn--primary2');
			}
			function goShowN(){
				newPaging('N');
				$('.SB').removeClass('btn--primary2');
				$('#nBtn').addClass('btn--primary2');
			}
			
		function goShowAll() {
	 		location.href = "adminCautQnaList.ex?search=all";
		}
	 	
	 	function goShowY() {
	 		location.href = "helperQnaList.ex?search=Y";
	 	}
	 	
	 	function goShowN() {
	 		location.href = "helperQnaList.ex?search=N";
	 	}
			</script>

               <!--             게시판 페이징 영역 -->
               	<div id="searchfrom"><input type="hidden" name="search"></div>
               <div id="board-paging">
                  <!--             [이전] -->
                  <c:if test="${ pi.currentPage <= 1 }">
                     <button id="prev">이전</button>
                  </c:if>
                  <c:if test="${ pi.currentPage > 1 }">
                     <c:url var="before" value="point.ex?search=${search }">
                        <c:param name="page" value="${ pi.currentPage - 1 }" />
                     </c:url>
                     <a href="${ before }"><button id="prev">이전</button></a>
                  </c:if>

                  <!--             페이지 -->
                  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                     <c:if test="${ p eq pi.currentPage }">
                        <button class="sBtn active">${ p }</button>
                     </c:if>
                     <c:if test="${ p ne pi.currentPage }">
                        <c:url var="pagination" value="point.ex?search=${search}">
                           <c:param name="page" value="${ p }" />
                        </c:url>
                        <a href="${ pagination }"><button class="sBtn">${ p }</button></a>
                     </c:if>
                  </c:forEach>

                  <!--             [다음] -->
                  <c:if test="${ pi.currentPage >= pi.maxPage }">
                     <button id="next">다음</button>
                  </c:if>
                  <c:if test="${ pi.currentPage < pi.maxPage }">
                     <c:url var="after" value="point.ex?search=${search}">
                        <c:param name="page" value="${ pi.currentPage + 1 }" />
                     </c:url>
                     <a href="${ after }"><button id="next">다음</button></a>
                  </c:if>
               </div>
            </div>
         </div>
</body>
</html>