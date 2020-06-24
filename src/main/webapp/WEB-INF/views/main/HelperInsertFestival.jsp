<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬퍼 버킷</title>
	<link rel="stylesheet" href="resources/main/css/HelperBucket.css">
	<link rel="stylesheet" href="resources/expert/css/insert_festival.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<div id="section-wrap">
		<div class="inner_content4" id="insert_festival">
	  <div class ="helperEdit4">
		<h1 align="center">3</h1>
		<br>
		<form id="festival" action="insertCevent.ex" method="POST" enctype="multipart/form-data">
			<table class="et th2">
					<tr>
						<th colspan="4" class="title">기업 행사 등록(헬퍼)</th>
					</tr>
					<tr>
						<th colspan="4"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td colspan="4">버킷제목:${ bkName }<input type="hidden" name="bkNo" value="${bkNo}"></td>
					</tr>
					<tr>
						<td class="rownp">사진</td>
						<td class="data" colspan="2">
							<img id="evimg" style="width:290px;height:226px;" src="#">
							<input type="file" id="evfile"name="feUploadFile" style="display:none;">
						</td>
						<td>
							<button type="button" id="photo">사진변경</button><br><br><br>
							<button type="button">사진삭제</button>
						</td>
					</tr>
					<tr>
						<td class="rownp">제목</td>
						<td colspan="3" class="data"><input type="text" name="eventTitle" style="width: 491px;"></td>
						<td></td>
					</tr>
					<tr>
						<td class="rownp">시작일</td>
						<td class="data"><input type="text" name="eventDate" style="width:158px;"></td>
					</tr>
					<tr>
						<td class="rownp">이벤트 내용</td>
						<td class="data" colspan="3"><textarea id="adw_textarea" name="eventContent">내용작성</textarea></td>
                    </tr>
                    
                    <tr>
                        <th colspan="3"><p class="op">&nbsp;</p></th>
                    </tr>
                    <tr>
                        <td colspan="4" id="submitBtn-Area">
                    <button type="submit" class="btn btn--primary2">축제 등록</button>
                        </td>
                    </tr>
			</table>
		</form>
	  	</div>
		</div>
	</div>

</body>
<script>
function readURL2(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
               $('#evimg').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#evfile").change(function() {
       readURL2(this);
   });
   
   $('#photo').click(function(){
   	$('#evfile').trigger('click');
   })
</script>
</html>