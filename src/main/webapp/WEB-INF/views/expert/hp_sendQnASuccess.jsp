<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<style>
	div{
		width:960px;
		margin: 0 auto;
	}
	p{
		text-align:center;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<section>
		<div>
		<p>질문에 성공하였습니다.</p>
		<button onclick="goQnA();">다시질문 하기</button>
		</div>
	</section>
	<script>
		function goQnA(){
			location.href ='helperSendQnA.ex';
		}
	</script>
</body>
</html>