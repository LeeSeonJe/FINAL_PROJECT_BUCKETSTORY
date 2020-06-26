<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/layout/css/header.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body style="background: #fafafa">
	<c:url value='/echo' var="url" />
	<header>
		<div id="facebookBtn" class="snsLink"><a href="https://www.facebook.com" target="_blank"><img src="resources/layout/images/facebook.png"></a></div>
		<div id="instaBtn" class="snsLink"><a href="https://www.instagram.com" target="_blank"><img src="resources/layout/images/instagram.png"></a></div>
		<div id="menuBtn" class="Rmenu"></div>
		<div id="alertBtn" class="Rmenu"></div>
		<div id="logoutBtn" class="Rmenu"></div>
		<div id="logo-wrap">
			<div id="logo"><a href="main.ho?menuNum=1&category=0"><img src="resources/layout/images/mainlogo.png"></a></div>
		</div>
	</header>
	
</body>
<script>
	$('#logoutBtn').click(function(){
		var result = confirm("로그아웃 하시겠습니까?");
		if(result){
			location.href='logout.co';
		} else{
			alert("로그아웃 취소");
		}
	});
	//var wsUri = "ws://localhost:9480/BucketStory/count";
	var wsUri = "ws://localhost:9480/BucketStory/count";

	function send_message() {

        websocket = new WebSocket(wsUri);

        websocket.onopen = function(evt) {

            onOpen(evt);

        };

        websocket.onmessage = function(evt) {
        	
        		onMessage(evt);

        };

        websocket.onerror = function(evt) {

            onError(evt);

        };

    }

   

    function onOpen(evt) {
       //websocket.send("${loginUser.userId}");
    }

    function onMessage(evt) {
    	console.log(evt.data);
    		$('#count').append(evt.data);
    }

    function onError(evt) {

    }

    $(document).ready(function(){
    	//setInterval(function(){
    		send_message();
    	//}, 2000);
    });


	


</script>
</html>