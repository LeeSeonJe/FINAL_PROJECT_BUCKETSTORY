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

#ad_declare {
	margin: 0 auto;
	width: 80%;
}

#ad_de_search{
    text-align: center;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"></jsp:include>
	</header>
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li><a>축제 작성</a></li>
					<li><a>가입확인</a></li>
					<li><a>결제내역</a></li>
					<li><a>통계</a></li>
					<li><a>신고</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
		</nav>
		<div>
		<h2>신고 게시판</h2>
	</div>
	
	<div>
		<table id="ad_declare">
			<tr>
				<td><input type="checkbox"></td>
				<td>번호</td>
				<td>말머리</td>
				<td>제목</td>
				<td width="220px;">내용</td>
				<td>아이디</td>
				<td>신고일</td>
				<td>상태</td>
			</tr>
		</table>
	</div>
	<div id="ad_de_search">
		<select>
			<option>전체보기</option>
			<option>게시글</option>
			<option>댓글</option>
		</select> 
			<input type="text">
			<a href="#">검색</a>
		<button>회원 경고</button>
		<button>전체 삭제</button>
	</div>
</div>
</body>
</html>