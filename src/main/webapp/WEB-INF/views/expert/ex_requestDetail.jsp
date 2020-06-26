<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/expert/css/ex_requestDetail.css">
</head>
<body>
	<c:import url="/WEB-INF/views/layout/header.jsp"/>
	<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
	<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
	<section>
			<form action="estimate.ex">
				<h1 style="text-align:center;">견적서 작성</h1>
				<br><br>
				<h3 style="text-align:center;">제목: ${ bucket.bkName }</h3>
				
				<c:if test="${ sessionScope.loginUser.userId == er.userId }">
					<div id="memberInfo">
						<h2 class="subtitle">요청헬퍼 정보</h2>
						<br>
						<div id="helperProfile" style="border:1px solid black;">
								<img src="resources/expert/images/photo.jpg" id="profileImage" >
								<h3 style="margin-top: 40px;"> ${ company.coId } </h3>
								<div id="coIntro">
									${company.coIntro }
								</div>
						</div>
					</div>
				</c:if>
				<c:if test="${ sessionScope.loginCompany.coId == er.coId }">
					<div id="memberInfo">
						<h2 class="subtitle">요청회원 정보</h2>
						<br>
						<div id="helperProfile" style="border:1px solid black;">
							<c:if test="${ member.prImage != null }">
								<img src="resources/member/images/profiles/${ member.prImage }" id="profileImage" >
							</c:if>
							<c:if test="${ member.prImage == null }">
								<img src="resources/expert/images/photo.jpg" id="profileImage" >
							</c:if>
								<h1 style="margin-top: 40px;"> ${ member.nickName } </h1>
								<div id="coIntro">
									<table>
										<tr>
											<th class="ppp">성별 :</th>
											<c:if test="${ member.gender == 'M' }">
												<td class="ppp">남자</td>
											</c:if>
											<c:if test="${ member.gender == 'F' }">
												<td class="ppp">여자</td>
											</c:if>
											<td colspan="2" class="ppp"><a href="myBlog.me?nickName=${ member.nickName }&page=1">블로그바로가기</a></td>
										</tr>
										<tr>
											<th class="ppp">생일 : </th>
											<td class="ppp">${member.birth }</td>
											<th class="ppp">경고 : </th>
											<td class="ppp">${member.caution }</td>
										</tr>				
										<tr>
											<th class="ppp">팔로우 : </th>
											<td class="ppp">${ member.fwCount }</td>
											<th class="ppp">연락처</th>
											<td class="ppp" style="width:130px">${ member.phone }</td>
										</tr>
										
									</table>
								</div>
						</div>
					</div>
				</c:if>
				<br><br>
				<div class="subtitle">
					<table id="inputSchedule">
						<tr>
							<td rowspan=2><h2 class="subtitle" style="display:inline;">일정기간</h2></td>
							<td>시작일</td>
							<td>종료일</td>
						</tr>
						<tr>
							<td><input type="date" id="esr_startDate" name="esr_startDate" value="${ er.esr_startDate }" readonly></td>
							<td><input type="date" id="esr_endDate" name="esr_endDate" value="${ er.esr_endDate }" readonly></td>
						</tr>
					</table>
					<input type="hidden" name="bkNo" value="${ bucket.bkNo }">
					<input type="hidden" name="coId" value="${ company.coId }">
					<input type="hidden" name="esr_no" value="${ er.esr_no}">
				</div>
				<br>
				<br>
				<div id="subtitle">
					<h2 class="subtitle">견적 요청사항</h2>
					<textarea rows="10" cols="100" id="precautions" name="precautions" readonly>${ er.precautions }</textarea>
				</div>
				<br>
				<br>
				<div id="btnarea">
					<input type="submit" id="esrequest" class="btn" value="견적서 작성">
					<input type="button" id="cancel"  class="btn" value="거절">
				</div>
			</form>
		</section>
	</div>
</body>
</html>