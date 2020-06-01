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

#adw_declare {
	margin: 0 auto;
	width: 80%;
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
			<h2>기업 승인</h2>
		</div>
		<div>
			<table id="adw_declare">
				<tr>
					<td><input type="checkbox"></td>
					<td>번호</td>
					<td>카테고리</td>
					<td>기업</td>
					<td>신청 날짜</td>
					<td>승인 여부</td>
				</tr>
			</table>
		</div>
		<div id="adw_search">
			<select>
				<option>전체보기</option>
				<option>승인</option>
				<option>거절</option>
			</select> <input type="text"> <a href="#">검색</a>
			<button>승인</button>
			<button>거절</button>
		</div>
	</div>

</body>
</html>