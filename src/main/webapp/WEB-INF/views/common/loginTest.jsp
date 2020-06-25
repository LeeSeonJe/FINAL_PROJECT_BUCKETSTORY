<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" http-equiv="refresh" content="2; url=/BucketStory/main.ho?menuNum=1&category=0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/common/css/loginTest.css">

<title>LOGIN TEST</title>
<style>
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<section>
	<!-- 	<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="SmokeFire.mp4">
	</video> -->
	<div id="back">
        <h1>
            <span>B</span>
            <span>U</span>
            <span>C</span>
            <span>K</span>
            <span>E</span>
            <span>T</span>
            <span>S</span>
            <span>T</span>
            <span>O</span>
            <span>R</span>
            <span>Y</span>
        </h1>
    </div>
    </section>
    
	<%-- <!-------------------- 오른쪽 로그인폼 -------------------->
		<div id="rightForm">
			<!-- 회원 로그인, 기업 로그인 변경 스위치 -->
			<div id="toggle" style="float:right; margin-top:-30px;">
		    	<label class="switch" >
					<input type="checkbox" id="loginSwt">
					<span class="slider round"></span>
				</label>
				<p id="ctp" style="color: white;">회원</p> 
			</div>	
			<!-- 유저 로그인 -->
			<form id="login" action="memberlogin.co" method="post"> 
				<div id="idPwdInput">
					<div id="loginlogo">
						<img id="loginlogo" src="resources/common/images/LogoWhite.png" width="500px" height="90px" style='margin-left:-90px; margin-height:"0"'/>
					</div>
					<input name="userId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input name="userPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<button id="subbtn" style='cursor:pointer;margin-left:8px;margin-top:95px'>LOGIN</button>
				</div>
			</form>
			
			<!-- 컴퍼니 로그인 -->
			<form id="Clogin" action="companylogin.co" method="post"> 
				<div id="idPwdInput">
					<div id="loginlogo" style="color: white">
						<img id="loginlogo3" src="resources/common/images/LogoBlack.png" width="500px" height="90px" style="margin-left:-90px;"/>
					</div>
					<input name="coId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input name="coPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<button id="subbtn" style='cursor:pointer;margin-left:8px;margin-top:95px'>LOGIN</button>
				</div>
			</form>
			
			<div id="join">
				<button class="joinBtn3" style='cursor:pointer; float:left; margin-top:2px'>아이디 찾기</button>
			</div>
			<div id="join2">
				<button class="joinBtn4" style='cursor:pointer; float:left; margin-top:2px; margin-left:14px'>비밀번호 찾기</button>
			</div>
			<div class="page-wrapper" style='margin-top:10px;'>
				<button class="joinBtn2" id="joinBtn2" style='cursor:pointer;'>회원가입</button>
				<!-- <a class="joinBtn2" id="joinBtn2" href="#" style='cursor:pointer' >회원가입</a> -->
				<!-- <button class="joinBtn2" href="leftForm" style='cursor:pointer'>회원가입</button> -->
			</div>
			<!-- <hr color="white" width="325px" align="left"> -->
			<div>
				<a href="${facebook_url}"> 
				<button id="facebookBtn" style='cursor:pointer' data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="true" onclick="fbLogin();"> <img src="resources/common/images/facebook.png" width="24px" height="24px" >&ensp;Facebook으로 로그인</button>
				</a>
			</div>
			<div id="fb-root"></div>
		</div> --%>
	
</body>
<script type="text/javascript" src="resources/common/js/loginTest.js"></script>
</html>