<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/expert/hp_pointCon.jsp"/> --%>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
 <section class ="p-section">
<!--         <p id ="title">포인트 내역</p> -->
 
        <!-- 게시판 목록 영역-->
        <div id ="board-area">
           
            <table class="board">
                <thead>
                <tr>
                    <th scope="cols" >번호</th>
                    <th scope="cols" >제목</th>
                    <th scope="cols" >아이디</th>
                    <th scope="cols" >작성일</th>
                    <th scope="cols" >답변여부</th>
                </tr>
                </thead>
                <tbody>
        
                <tr>
                    <td scope="row">3</td>
                    <td>문의사항1</td>
                    <td>KH COMPANY</td>
                    <td>2020.05.14</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td scope="row">2</td>
                    <td>문의사항2</td>
                    <td>KH COMPANY</td>
                    <td>2020.05.08</td>
                    <td>N</td>
                </tr>
                </tbody>
            </table>
        

            <!-- 게시판 페이징 영역-->
            <div id="board-paging">
                <div><button id ="prev">이전</button></div> 

                <div><button class ="sBtn">1</button></div>
                <div><button class ="sBtn">2</button></div>
                <div><button class ="sBtn">3</button></div>

                <div><button id= "next">다음</button></div>
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
       
 </section class ="section"> 
</body>
</html>