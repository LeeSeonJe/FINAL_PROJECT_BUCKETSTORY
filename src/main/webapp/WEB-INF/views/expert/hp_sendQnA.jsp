<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<link rel ="stylesheet" href ="resources/expert/css/hp_sendQnA.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<section>
	<div  id ="writeform" class="comb">	
		<div>
			<br>
			<h2 style ="border-bottom: 1px solid black;">QnA 작성하기</h2>
		</div>
		<br>
<!-- 			<form action ="insertQnA.ex" method="POST"> -->
				<table>
					<tr>
						<td><b class="rowT">제목</b></td>
						<td><input type="text" name="title" id ="title"></td>
					</tr>
					<tr>
						<td><b class="rowT">내용</b></td>
						<td><textarea rows="10px;" cols="80px;" name="content" id="content"></textarea>
					</tr>
				</table>

				<div>
					<ul>
						<li>
							<button type="reset" class="btn" id="cancle">취소</button>
							<button type="submit" class="btn btn--primary2" id="submitQnA">작성</button>
						</li>
					</ul>
				</div>
<!-- 			</form> -->
		</div>
		
		<div id ="sucessform" class ="comb">
        	<div id ="su-msg">
        	<br>
	        	<p id ="su-title">성공적으로 전송했습니다.</p>
	        	<hr>
	        	<p>고객님의 소중한 문의사항을 남겨주셔서 감사합니다.</p>
	        	<p>관리자가 빠른시간내에 답변해드리겠습니다</p>
	        	<br>
	        	<button id="retry" class="btn">재문의</button>
  			</div>
        </div>
        
        <div id ="errorform" class ="comb" style="display:none">
        	<p>에러 입니다.</p>
        </div>
	</section>
	
	
	<script>
	
	$('#cancle').click(function(){
		history.go(0);
	});
	
	// 페이지 리로드 : 재문의
	$('#retry').click(function(){
		history.go(0);
	});
	
	$('#submitQnA').click(function(){
		var title = $('#title').val();
		var content = $('#content').val();
		
		if(title ==""){
			alert('제목을 입력하세요');
		}else if(content == ""){
			alert('내용을 입력하세요');
		}else{
			$.ajax({
				url: "insertQnAjax.ex",
				data : 
				{
					title: title,
					content:content
				},
				
				success: function(data){
					console.log(data);
					if(data == 'ok'){
						console.log('전송성공');
						// 성공 로직
						
// 						$('#writeform').hide();
// 						$('#sucessform').show();
						
						$('#writeform').fadeOut(600);
						setTimeout(function() {
						$('#sucessform').fadeIn(600);
						}, 600);
						
					}else{
						console.log('전송실패');
						
						// 실패 로직
						$('#writeform').hide();
						$('#errorform').show();
					}
				}
			});
		}
	});
	</script>
</body>
</html>