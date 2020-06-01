<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#ad_qna {
    margin: 0 auto;
	width: 86%;
    margin-left: 289px;
}

#adw_search{
    text-align: center;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>				
	</header>
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li>
						<a>축제 작성</a>	
					</li>
					<li>
						<a>가입확인</a>
					</li>
					<li>
						<a>결제내역</a>
					</li>
					<li>
						<a>통계</a>
					</li>
					<li>
						<a>신고</a>
					</li>
					<li>
						<a>QnA</a>
					</li>
				</ul>
			</div>
		</nav>
		<div>
			<h2>QnA 게시판</h2>
		</div>
		
		<div>
		<table id="ad_qna">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>아이디</td>
				<td>작성일</td>
				<td>답변여부</td>
			</tr>
			<tr>
				<td>1</td>
				<td>누구게</td>
				<td>cross1</td>
				<td>2020-5</td>
				<td>답변완료</td>
			</tr>
		</table>
	</div>

	<div id="adw_search">
		<select>
			<option>전체보기</option>
			<option>기업</option>
			<option>회원</option>
			<option>미답변</option>
			<option>답변완료</option>
		</select> 
			<input type="text">
			<a href="#">검색</a>
	</div>
		
	</div>

</body>
</html>