<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/main/css/searchscreen.css">
</head>
<body>
	<div id="searchscreen">
		<div id="searchdiv">
			<input id="searchtext" type="text" placeholder="검색어를 입력해주세요">
			<button id="searchtextBtn">X</button>
		</div>
		<div id="searchresult">
			<div id="searchTag" class="result4">
				태그<hr>
				<ul>
					<li>#아다리</li>
				</ul>
			</div>
			<div id="searchMem" class="result4">
				회원<hr>
				<ul>
					<li>홍길동</li>
				</ul>
			</div>
			<div id="searchBucket" class="result4">
				버킷리스트<hr>
				<ul>
					<li>사막에서 살아남기</li>
				</ul>
			</div>
			<div id="searchCompany" class="result4">
				기업<hr>
				<ul>
					<li>삼성</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>