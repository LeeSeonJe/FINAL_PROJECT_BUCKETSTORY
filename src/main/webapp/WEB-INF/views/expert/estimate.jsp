<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/estimate.css">
</head>
<body>
<c:import url="../layout/header.jsp"/>
<c:import url="../layout/mainNav.jsp"/>
<c:import url="../layout/mainLeftSide.jsp"/>
	<div id="page">
		<h1 style="text-align:center;">견적서 작성</h1>
		<br><br>
		<h3 style="text-align:center;">제목:버킷리스트 이름</h3>
		
		<div id="memberInfo">
			<h2 class="subtitle">요청회원 정보</h2>
			<br>
			<table id="helperProfile" style="border:1px solid black;">
				<tr>
					<td rowspan="2"><img src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage" ></td>
					<td><h3>업체이름</h3></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
						업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개업체 소개
						</div>
					</td>
				</tr>
			</table>
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
					<td><input type="date" id="startDate"></td>
					<td><input type="date" id="endDate"></td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<div id="subtitle">
			<h2 class="subtitle">견적 요청사항</h2>
			<textarea rows="10" cols="100" id="Precautions" name="Precautions"></textarea>
		</div>
		<br>
		<br>
		<div id="estimate">
			<h2>견적내용</h2>
			<textarea rows="15" cols="40" id="contents" name="contents"  placeholder="견적서 간략소개 작성"></textarea>
			<table id="costTable">
				<tr>
					<td><h3 style="display:inline;float:left;">견적금액</h3></td>
					<td colspan="3"><input type="text" name="cost" id="cost" style="width:90%; height:35px;">원</td>
				</tr>
				<tr class="optionAdd">
					<td></td>
					<td><input type="text" id="optionName" name="optionName" style="width:100%;" placeholder="옵션이름"></td>
					<td></td>
					<td><input type="number" id="optionCost" name="optionCost" style="width:100%;" placeholder="옵션가격"></td>
					<td></td>
				</tr>
				<tr class="optionAdd">
					<td></td>
					<td><input type="text" id="optionName" name="optionName" style="width:100%;" placeholder="옵션이름"></td>
					<td></td>
					<td><input type="number" id="optionCost" name="optionCost" style="width:100%;" placeholder="옵션가격"></td>
					<td><b class="deleteOption">&nbsp;x</b></td>
				</tr>
				<tr class="optionAdd">
					<td></td>
					<td><input type="text" id="optionName" name="optionName" style="width:100%;" placeholder="옵션이름"></td>
					<td></td>
					<td><input type="number" id="optionCost" name="optionCost" style="width:100%;" placeholder="옵션가격"></td>
					<td><b class="deleteOption">&nbsp;x</b></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td><div id="addOption" style="float:right; cursor:pointer;">옵션추가</div></td>
				</tr>
				<tr>
					<td><h3 style="display:inline;float:left;">파일첨부</h3></td>
					<td colspan="3"><input type="file" name="estimateFile"></td>
				</tr>
				<tr>
					<td colspan="2"><button>견적보내기</button></td>
					<td colspan="2"><button>취소</button></td>
				</tr>
			</table>
			
			<script>
				$('#addOption').on('click',function(){
					var optionTr = '<tr class="optionAdd">'
								   +'<td></td>'
								   +'<td><input type="text" id="optionName" name="optionName" style="width:100%;" placeholder="옵션이름"></td>'
								   +'<td></td>'
					               +'<td><input type="number" id="optionCost" name="optionCost" style="width:100%;" placeholder="옵션가격"></td>'
								   +'<td><b class="deleteOption">&nbsp;x</b></td>'
					               +'</tr>';
				
					var lastTr =$('.optionAdd:last');
					lastTr.after(optionTr);
				});
				
				$(document).on('click',".deleteOption",function(){
					var trHtml = $(this).parent().parent();
			        
			        trHtml.remove();
				});
			
			</script>
		</div>		
	</div>
</body>
</html>