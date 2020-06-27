<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>esrequest</title>
	<link rel="stylesheet" href="resources/expert/css/esrequest.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
		<div id="Myheader">
			<table id="table_area">
				<tr>
					<td rowspan="4" style="width: 250px;">
						<c:if test="${ getMember.prImage != null }">
							<img id="profileImg" src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" />
						</c:if>
						<c:if test="${ getMember.prImage == null }">
							<img id="profileImg" src="resources/expert/images/photo.jpg" />
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">${ getMember.nickName }</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ getMember.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ list }</td>
					<td>팔로워 ${ getMember.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
			<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<form action="insertEsrequest.ex">
				<h1 style="text-align:center;">견적서 작성</h1>
				<br><br>
				<div id="bucketArea">
				   <img src="resources/muploadFiles/${ bkImg.mweb }" id="bkImg">
				
				
				
				<div id="bkContent">
					<h1 id="bkName" style="text-align:center;">${ bucket.bkName }</h1>
					<p>${ bucket.bkContent }</p>
				</div>
				
				</div>
				<br><br>
				<div id="memberInfo">
					<h2 class="subtitle">요청헬퍼 정보</h2>
					<br>
					<div id="helperProfile" style="border:1px solid black;">
						<c:if test="${ empty media }">
							<img src="resources/expert/images/photo.jpg" id="profileImage" >
						</c:if>
						<c:if test="${ not empty media }">
							<img src="resources/muploadFiles/${ media.mweb }" id="profileImage" >
						</c:if>
							<h3 style="margin-top: 40px;"> ${ company.coName } </h3>
							<div id="coIntro">
								${company.coIntro }
							</div>
					</div>
				</div>
				<br><br>
				<div class="subtitle">
					<table id="inputSchedule">
						<tr>
							<td rowspan=2><h2 class="subtitle" style="display:inline;">일정기간</h2></td>
							<td>시작일</td>
							<td>종료일</td>
						</tr>
						<tr>
							<td><input type="date" id="esr_startDate" name="esr_startDate"></td>
							<td><input type="date" id="esr_endDate" name="esr_endDate"></td>
						</tr>
					</table>
					<input type="hidden" name="bkNo" value="${ bucket.bkNo }">
					<input type="hidden" name="coId" value="${ company.coId }">
				</div>
				<br>
				<br>
				<div id="subtitle">
					<h2 class="subtitle">견적 요청사항</h2>
					<c:if test="${ not empty eventTitle  }">
						<textarea rows="10" cols="100" id="precautions" name="precautions">${ eventTitle } : ${eventContent }</textarea>
					</c:if>
					<c:if test="${ empty eventTitle }">
						<textarea rows="10" cols="100" id="precautions" name="precautions"></textarea>
					</c:if>
				</div>
				<br>
				<br>
				<div id="btnarea">
					<input type="submit" id="esrequest" class="btn" onclick=" return check();" value="견적 요청">
					<input type="button" id="cancel"  class="btn" onclick="history.go(-1)" value="취소">
				</div>
			</form>
		</section>
		<script>
			console.log($('#precautions').val().length)
			
			function check(){
				
				if($('#esr_startDate').val() != "" && $('#esr_endDate').val() != ""){
					var startDate = $('#esr_startDate').val(); //2017-12-10
			        var startDateArr = startDate.split('-');
			        
			        var endDate = $('#esr_endDate').val(); //2017-12-09
			        var endDateArr = endDate.split('-');
					
			        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
			        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
			        
			        if(startDateCompare.getTime() > endDateCompare.getTime()){
			            alert("시작날짜와 종료날짜를 확인해 주세요.");
			            return false;
			     	}
				}
				if($('#esr_startDate').val() == ""){
					alert("시작일을 입력하세요.");
					$('#esr_startDate').focus();
					return false;
				}else if($('#esr_endDate').val() == ""){
					alert("종료일을 입력하세요.");
					$('#esr_endDate').focus();
					return false;
				}else if($('#precautions').val()==""){
					alert("요청사항을 입력해주세요.");
					$('#precautions').focus();
					return false;
				}
			         
			        $("#frmSearch").submit();
			}
		</script>
	</div>
</body>
</html>