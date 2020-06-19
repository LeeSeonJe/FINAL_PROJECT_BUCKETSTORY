<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_helperEdit.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
	<!-- 기업소개 변경 -->
	<section>
		<div class="inner">
			<h1 align="center">Helper Edit</h1>
			<br>
			<form id="submitform" action="comUpdate.ex" method="post" enctype="Multipart/form-data"> 
				<table class="et th2">
					<tr>
						<th colspan="3" class="title">기업소개 변경</th>
					</tr>
					<tr>
						<th colspan="3"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td class="rown"><p>업체사진</p></td>
						<td><div id="igm-area">
								<img id="foo" src="resources/muploadFiles/${com.checkImg }" /></div></td>
						<td><input type="file" name="uploadFile" id="imgInp"></td>
					</tr>
					<tr>
						<td class="rown"><p>업체이름</p></td>
						<td><input type="text" value="${com.coName }" name="coName"></td>
					</tr>

					<tr>
						<td class="rown"><p>업종명</p></td>
						<td><input type="text" value="${com.compaName }"
							name="compaName"></td>
					</tr>

					<tr>
						<td class="rown"><p>카테고리</p></td>
						<td><input type="text" value="${com.cateNum }" readonly></td>
						<td>변경 <select id="cateNum" name="cateNum">
								<option value="1">Travel</option>
								<option value="2">Sport</option>
								<option value="3">Food</option>
								<option value="4">New Skill</option>
								<option value="5">Culture</option>
								<option value="6">Outdoor</option>
								<option value="7">Shopping</option>
								<option value="8">LifeStyle</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="rown"><p>업체소개</p></td>
						<td colspan="2"><textarea id="textArea" name="coIntro">${com.coIntro}</textarea></td>
					</tr>
					<tr>
						<th colspan="3"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td colspan="3" id="submitBtn-Area">
							<button type="submit" class="btn btn--primary2" id="submitBtn">클릭하시면
								정보를 변경합니다.</button>
						</td>
					</tr>
				</table>
				<br>
 			</form> 
		</div>
		<input type="hidden" id ="insertResult" value ="${result }">
	</section>
	<script type="text/javascript">
		(function(){
			
			var result = $('#insertResult').val();
			console.log(result);
			if(result == 'ok'){
				alert('기업소개가 성공적으로 변경되었습니다.')
			}
			
		})();
		
// 		$('#submitBtn').click(function(){
// 			colsole.log('진입');
// 			$.ajax({
// 				url : "comUpdate.ex",
// 				date :{
// 					coName :coName,
// 					compaName:compaNaem,
// 					checkImg: checkImg,
// 					cateNum: cateNum,
// 					coIntro: coIntro
// 				}
// 			},
// 			success: function(data){
// 				console.log(data);
// 				if(data == 'ok'){
// 					console.log('전송성공');
// 					// 성공 로직
// 				}else{
// 					console.log('전송실패');
					
// 					// 실패 로직			
// 					}
// 				}
// 			});
// 		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#foo').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>