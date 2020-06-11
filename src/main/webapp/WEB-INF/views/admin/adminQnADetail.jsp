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
span.answer:after {
    position: absolute;
    bottom: -12px;
    left: 0;
    display: inline-block;
    background: #3a8afd;
    content: "";
    width: 100%;
    height: 2px;
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
				<div style="text-align: center;"><b> ${ adminQnA.q_title }</b></div>
				<div style="float: right;">
				<span>[이미지 넣기] ${ adminQnA.userid }</span>
				<span>[이미지 넣기] ${ adminQnA.q_date }</span>
				</div>
				<br clear="all">
				<div style="height: 350px; padding-top: 2%;">${ adminQnA.q_content }</div>
				<div style=" border-bottom: 1px solid #d2d1d1; font-size: 15px;"><span class="answer"style="position: relative;
    display: inline-block;
    width:10%;
    margin: 10px 0;
    margin-right: 5px;
    font-size: 1em;
    color: #3a8afd;"><b style="color: black;">답변</b></span></div>
				<div style="margin-top: 2%; display: inline-block;"><textarea rows="50" cols="1000" style="width: 90%;
    height: 100px; "></textarea>
				<button>답변하기</button></div>
			</div>
		</div>
	</div>

</body>
</html>