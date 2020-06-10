<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 게시판 테이블 */
.divbody {
    width: 60%;
    margin: 0 auto;
}

h2{
	border-bottom: 1px solid black;
}

.divbody>div>ul>li{
	text-align: center;
    list-style: none;	
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<section>
	<div class="divbody">	
		<div>
			<h2>QnA 작성하기</h2>
		</div>
		
		<table>
			<tr>
				<td>제목 :</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td><textarea rows="10px;" cols="80px;"></textarea>
			</tr>
		</table>
		
		<div>
			<ul>
				<li>
					<button type="reset">취소</button>
					<button type="submit">작성</button>
				</li>
			</ul>
		</div>
				
	</div>
	</section>
</body>
</html>