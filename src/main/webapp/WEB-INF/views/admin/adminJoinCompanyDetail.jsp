<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<link rel="stylesheet" href="resources/admin/css/adminJoinCompanyDetail.css">
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
		</div>
		<form class="form_class">
			<table class="table_class">
				<tr>
					<td>아이디</td>
					<td><input type="text" value="${ company.coId }" disabled id="read"></td>
				</tr>
				<tr>
					<td>기업명</td>
					<td><input type="text" value="${ company.coName }" disabled id="read"></td>
				</tr>
				<tr>
					<td>기업 인증 사진</td>
					<td><input type="text" value="${ company.checkImg }" disabled id="read"></td>
				</tr>
				<tr>
					<td>대표이사 이름</td>
					<td><input type="text" value="${ company.coName }" disabled id="read"></td>
				</tr>
				<tr>
					<td>신청자 이름</td>
					<td><input type="text" value="${ company.compaName }" disabled id="read"></td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td><input type="text" value="${ company.homePage }" disabled id="read"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" value="${ company.coTel }" disabled id="read"></td>
				</tr>
				<tr>
					<td>기업/전문가</td>
					<td><input type="text" value="${ company.cpCheck }" disabled id="read"></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><input type="text" value="${ company.cateNum }" disabled id="read"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" value="${ company.busiEmail }" disabled id="read"></td>
				</tr>
				
			</table>
			<div id="btn_div">
				<span><button type="submit">승인</button></span>
				<span><button >거절</button></span>
			</div>
		</form>
		
</body>
</html>