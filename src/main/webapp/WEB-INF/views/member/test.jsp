<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
</head>
<body>
	<div id="ttt"></div>
	<script>
		$(function(){
			$('#ttt').html('${ blogContent }');
		})
	</script>
	<br>
	<c:url value="/update.me" var="update">
		<c:param name="ir1" value="${ ir1 }"></c:param>
	</c:url>
	<button id="updateBtn">수정하기</button>
	<script>
		var update = '${ update }';
		$('#updateBtn').on('click',function(){
			location.href = update;
		})
	</script>
</body>
</html>