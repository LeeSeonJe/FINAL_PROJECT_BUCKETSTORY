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
		<div id="alertDiv">
			<div></div>
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
	
	// 웹소켓 실행
	var wsUri = "ws://localhost:9480/BucketStory/count";
	var websocket = null;

	function send_message(data) {

        websocket = new WebSocket(wsUri);

        websocket.onopen = function(evt) {

            onOpen(evt, data);

        };

        websocket.onmessage = function(evt) {
        	
        		onMessage(evt);

        };

        websocket.onerror = function(evt) {

            onError(evt);

        };

    }

   

    function onOpen(evt, data) {
    	if(data != null){
    		websocket.send(data);
    	}
    }

    function onMessage(evt) {
    	console.log(evt.data);
    	if(evt.data == 'reload'){
    		alarm();
    	}
    }

    function onError(evt) {

    }
    
    // 알람창 불러오기
    function alarm(){
    	$.ajax({
    		url:'selectAlert.ho',
    		async:false,
    		success:function(data){
    			$('#alertDiv').html('');
    			for(var key in data){
    				console.log(data);
    				var $div = $('<div>');
    				$div.text(data[key].aContent);
    				$div.attr('onclick', 'alertLink('+data[key].aNum+',"'+data[key].aLink+'");');
    				if(data[key].aCheck == 'Y'){
    					$div.css('background', 'rgba(0,0,0,0.2)');
    				}
    				$('#alertDiv').append($div);
    			}
    		}
    	});
    }
    
    function alertLink(aNum, aLink){
    	location.href=aLink;
    	$.ajax({
    		url:'alertCheck.ho',
    		data:{
    			aNum:aNum
    		},
    		async:false,
    		success:function(){
    			alarm();
    		}
    	});
    }
    

    $(document).ready(function(){
    	send_message();
    	alarm();
    });


	


</script>
</html>