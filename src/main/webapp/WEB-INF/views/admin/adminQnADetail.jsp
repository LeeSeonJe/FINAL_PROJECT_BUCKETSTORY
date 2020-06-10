<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>
.ad_Detail {
	width: 60%;
	margin: 0 auto;
}

h2 {
	border-bottom: 1px solid black;
}

.ad_Detail>div>table {
	margin: 0 auto;
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
					<li><a>축제 작성</a></li>
					<li><a>가입확인</a></li>
					<li><a>결제내역</a></li>
					<li><a>통계</a></li>
					<li><a>신고</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
		</nav>
		<div class="ad_Detail">
			<div>
				<h2>QnA 상세보기</h2>
			</div>
			<div>
				<table id="table_one">
					<tr>
						<td colspan="4" style="text-align: center;">제목 :</td>
						<td>문의 날짜 :</td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td>회원 아이디 :</td>
					</tr>
					<tr>
						<td>내용 :</td>
						<td colspan="4"><textarea rows="10" cols="80"></textarea></td>
					</tr>
					<tr>
						<td>답변 :</td>
						<td colspan="3"><textarea rows="10" cols="80"></textarea></td>
						<td style="display: block;">답변 날짜 :</td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td>
							<button>답변하기</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>