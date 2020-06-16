<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_completeRequest.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
	<div id="page">
		<div id="submenu">
			<ul>
				<li><a href="getRequest.ex?coId=${ coId }">받은요청 &nbsp</a></li>
				<li><a href="makingRequestView.ex?coId=${ coId }">진행중 &nbsp</a></li>
				<li><h3 style="display: inline;">완료요청</h3></li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">매칭완료 견적서 화면 입니다.</h2>		
		
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="4" style="width:100px;">
						<img id="requestImage" src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage">
					</td>
					<td>
						<h3 style="display:inline">요청보낸사람 닉네임</h3>
					</td>
					<td>
						요청일 2020-05-06
					</td>
				</tr>
				<tr>
					<td>
						요청보낸사람의 버킷리스트 카테고리
					</td>
					<td>
						마감일 2020-05-10
					</td>
				</tr>
				<tr>
					<td><h3 style="display:inline;">버킷리스트: 버킷리스트이름</h3></td>
					<td style="width: 183px;"><h3>평점: ★★★★★(5.0)</h3></td>
				</tr>
				<tr>
					<td><h3 style="display:inline;">총 견적 비용: 1,200,000 원</h3></td>
					<td></td>
				</tr>
					<td></td>
					<td>
						<div id="bucketListDetail">작성중인 견적서 조회</div>
					</td>
					<td>
						<div id="delete">삭제</div>
					</td>
				<tr>
				</tr>
			</table>
		</div>
		<hr style="width:840px">
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="4" style="width:100px;">
						<img id="requestImage" src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage">
					</td>
					<td>
						<h3 style="display:inline">요청보낸사람 닉네임</h3>
					</td>
					<td>
						요청일 2020-05-06
					</td>
				</tr>
				<tr>
					<td>
						요청보낸사람의 버킷리스트 카테고리
					</td>
					<td>
						마감일 2020-05-10
					</td>
				</tr>
				<tr>
					<td><h3 style="display:inline;">버킷리스트: 버킷리스트이름</h3></td>
					<td style="width: 183px;"><h3>평점: ★★★★★(5.0)</h3></td>
				</tr>
				<tr>
					<td><h3 style="display:inline;">총 견적 비용: 1,200,000 원</h3></td>
					<td></td>
				</tr>
					<td></td>
					<td>
						<div id="bucketListDetail">작성중인 견적서 조회</div>
					</td>
					<td>
						<div id="delete">삭제</div>
					</td>
				<tr>
				</tr>
			</table>
		</div>
		<hr style="width:840px;">
		
		<div id="ListAdd">
			<div id="ListArea">
				<h4 style="display:inline">더보기</h4>
				&nbsp;&nbsp;&nbsp;▼
			</div>
		</div>
	</div>
	
</body>
</html>