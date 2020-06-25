<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/member/css/ProfileChange.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div>
		<h1>프로필 수정</h1>
		<h4>대표 프로필 사진을 수정하실 수 있습니다.</h4>
		<form id="profile_form" action="profileChange.me" method="post" enctype="multipart/form-data" onsubmit="return go();">
		<table>
			<tr>
				<td>
					<br>
						<input type='file' id="imgInput" name="uploadFile" />
						<div id="img_area">
							<c:if test="${ getMember.prImage == null }">
								<img id="profileImg" src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" />					
							</c:if>
							<c:if test="${ getMember.prImage != null }">
								<img id="profileImg" src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" />					
							</c:if>	
						</div>
					<br><br>
					<input id="img_btn" type="button" value="사진변경"/>
					<button type="button" id="imgDel_btn">사진삭제</button>
					<br>
				</td>
			</tr>
		</table>
		<br>
		<div id="btn_area">
			<button>완료</button>
			<button type="button" onclick="self.close();">취소</button>
		</div><br>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			var status = '${ status }';
			if(status.trim() == '1'){
				window.opener.location.reload();
				self.close();
			} 
		})
		function go() {
			alert('변경이 완료되었습니다.');
			return true;
		}
	
		$('#imgDel_btn').on('click', function(){
			$('#profileImg').attr('src','/BucketStory/resources/member/images/profiles/basicProfile.jpg');
			$('#imgInput').val('');
		});
		
		$('#img_btn').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#img_area>img').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#imgInput").change(function(){
			readURL(this);
		});
	</script>
</body>
</html>