<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketWrite.css">
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
						<img id="profileImg" src="resources/member/images/123.jpg" alt="프로필 사진" />					
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">Seonxi_l</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">이선제</td>
				</tr>
				<tr>
					<td>게시물수 199</td>
					<td>팔로워 40</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<h2>버킷리스트 작성</h2>
			<form action="" method="post" enctype="multipart/form-data">
				<input type='file' id="imgInput"/>
				<div id="img_area">
					<img/>
				</div>
				<div id="content_area">
					제목<br>
					<input type="text" /><br><br>
					카테고리
					<select name="" id="">
						<option value="1">Travel</option>
						<option value="2">Sport</option>
						<option value="3">Food</option>
						<option value="4">New Skill</option>
						<option value="5">Culture</option>
						<option value="6">Outdoor</option>
						<option value="7">Shopping</option>
						<option value="8">Lifestyle</option>
					</select><br><br>
					설명<br>
					<textarea type="text"></textarea><br><br>
					태그<br>
					<span>#</span><input type="text" class="tag_input" />
					<span>#</span><input type="text" class="tag_input" />
					<span>#</span><input type="text" class="tag_input" />
					<span>#</span><input type="text" class="tag_input" />
					<span>#</span><input type="text" class="tag_input" />
					<br><br><br><br>
				</div>
			</form>
		</section>
	</div>
<script>
	$(function(){
		$('#img_area').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		$('#img_area>img').attr('src', "resources/main/images/loginback.jpg");
		$('#img_area>img').css('width', '100%');
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#img_area>img').css('width', 'auto');
				$('#img_area>img').attr('src', e.target.result);  
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#imgInput").change(function(){
		readURL(this);
	});
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','60.3px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
</script>
</body>
</html>