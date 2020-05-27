<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/expert/css/ex_infoUpdateForm.css">
<title>Insert title here</title>
</head>
<body>
<c:import url="../common/header.jsp"/>
<c:import url="../common/mainNav.jsp"/>
<c:import url="../common/mainLeftSide.jsp"/>
<div id="page">
	<div id="page-1">
		<div id="inputPhoto">
			<img src="<%=request.getContextPath() %>/views/배경-1.jpg" id="mainPhoto" name="mainPoto">
		</div>
		
		<div id="sum-upPage">
			<ul id="submenubar">
				<li>요약 &nbsp</li>
				<li>소개 &nbsp</li>
				<li>리뷰</li>
			</ul>
			
			<hr style="clear:left;">
			
			<table id="helperProfile" style="border:1px solid black; width:600px;height:200px;">
				<tr>
					<td rowspan="2"><img src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage" ></td>
					<td><input type="text" id="helperName" placeholder="업체이름 입력"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
						<textarea style="width: 396px;height: 100px;"placeholder="간단소개 입력"></textarea>
						</div>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<h2><input type="text" name="helperInfo" placeholder="업체정보"></h2>
			<textarea style="width: 600px;height: 100px;"placeholder="상세소개 입력"></textarea>
			<hr>
			
			<div id="categorybar">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
				<img class="category" src="">
			</div>
			<br clear="left">
			<div class="bucketList" style="margin-top:30px;">
				<table>
					<tr>
						<td rowspan="2"><img style="width: 90px;"id="bucketListImage" src="<%=request.getContextPath()%>/views/프로필.png"></td>
						<td>버킷리스트 이름</td>
					</tr>
					<tr>
						<td>버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
						</td>
					</tr>
				</table>
			</div>
			<div class="bucketList" style="margin-top:30px;">
				<table>
					<tr>
						<td rowspan="2"><img style="width: 90px;"id="bucketListImage" src="<%=request.getContextPath()%>/views/프로필.png"></td>
						<td>버킷리스트 이름</td>
					</tr>
					<tr>
						<td>버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
						</td>
					</tr>
				</table>
		</div>
		<div class="bucketList" style="margin-top:30px;">
				<table>
					<tr>
						<td rowspan="2"><img style="width: 90px;"id="bucketListImage" src="<%=request.getContextPath()%>/views/프로필.png"></td>
						<td>버킷리스트 이름</td>
					</tr>
					<tr>
						<td>버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
						</td>
					</tr>
				</table>
		</div>
		<div class="bucketList" style="margin-top:30px;">
				<table>
					<tr>
						<td rowspan="2"><img style="width: 90px;"id="bucketListImage" src="<%=request.getContextPath()%>/views/프로필.png"></td>
						<td>버킷리스트 이름</td>
					</tr>
					<tr>
						<td>버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
						</td>
					</tr>
				</table>
		</div>
		<div class="bucketList" style="margin-top:30px;">
				<table>
					<tr>
						<td rowspan="2"><img style="width: 90px;"id="bucketListImage" src="<%=request.getContextPath()%>/views/프로필.png"></td>
						<td>버킷리스트 이름</td>
					</tr>
					<tr>
						<td>버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
							버킷리스트 간단 설명 버킷리스트 간단 설명 버킷리스트 간단 설명
						</td>
					</tr>
				</table>
		</div>
	</div>
</div>
	<div id="page-2">
		<ul style="padding-inline-start: 0px;">
			<li><h5>함께하는 버킷리스트</h5></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
		</ul>
		
		<div id="subBtn">
			맞춤견적 신청
		</div>
	</div>
		<div id="modal">
					   
			<div class="modal_content">
				<img id="bucketImage" src="<%=request.getContextPath()%>/views/배경-1.jpg">
					       
				<div id="area1">
					<h2 style="display:inline;">버킷리스트 이름</h2>
					<textarea id="bucketContent" readonly>
						버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트
						버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트
					</textarea>
				</div>
					       
				<button type="button" id="modal_close_btn">모달 창 닫기</button>
					       
			</div>
					   
		<div class="modal_layer"></div>
		</div>
	<script>
	var currentPosition = parseInt($("#page-2").css("top")); $(window).scroll(function() { var position = $(window).scrollTop(); $("#page-2").stop().animate({"top":position+currentPosition+"px"},1000); });

	$(".bucketList").on('click', function() {
    	$('#modal').css({"top":(($(window).height()-$('#modal').outerHeight())/2+$(window).scrollTop()+80)+"px",
						 "left":(($(window).width()-$('#modal').outerWidth())/2+$(window).scrollLeft())+"px"})
       $('#modal').show();
    });
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
	</script>
</div>
</body>
</html>