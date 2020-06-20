<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a style="display:scroll;position:fixed;bottom:10px;right:10px;" href="#hpTop">
	<img src ="resources/expert/images/top.png" alt ="맨 위로" style="width:80px; height:80px;" >
 </a> 
 

<script>
$("a[href^='#']").click(function(event){
	event.preventDefault();
	var target = $(this.hash);
	// 헤더가 fixed 이기 떄문에 header만큼 뻄
	console.log(target.offset().top-108);
	$('html, body').animate({scrollTop:target.offset().top-108},300);
});
</script>
</body>
</html>