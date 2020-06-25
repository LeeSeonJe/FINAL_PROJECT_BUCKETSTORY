<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 행사</title>
</head>
	<link rel="stylesheet" href="resources/main/css/myInfo.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="Myheader">MY INFO</div>
	<section>
		<div id="body-wrap">
				<div class="f-div">
					<div class="f-one">
						<form class="formDiv" action="updateMember.ho" method="post" onsubmit="return update();">
							폰번호 : <input class="phone1" value="010" disabled="disabled">-<input id="phone" class="phone2" value="${fn:substring(loginUser.phone, 4, 8)}">-<input id="phone2" class="phone2" value="${fn:substring(loginUser.phone, 9, 13)}"><br><br>
							이메일 : <input class="EN" id="email" type="email" value="${loginUser.email}"><br><br>
							닉네임 : <input class="EN" onchange="nickCheck();" id="nickName" name="nickName" value="${loginUser.nickName}"><span>X</span><br><br>
							<button type="button">비밀번호 변경</button><input id="submitBtn" type="submit" value="수정">
						</form>
						<form class="formDiv2" action="updatePassword.ho" method="post">
							현재 비밀번호 : <input class="EN" type="password"><br><br>
							변경 비밀번호 : <input class="EN" type="password"><br><br>
							비밀번호 확인 : <input class="EN" type="password"><br><br>
							<button type="button">개인정보 수정</button><input id="submitBtn" type="submit" value="변경">
						</form>
					</div>
				</div>
		</div>
	</section>
</body>
<script>
	submitCheck = false;
	$('.formDiv button').click(function(){
		$('.formDiv2').show();
		$('.formDiv').hide();
	});
	$('.formDiv2 button').click(function(){
		$('.formDiv').show();
		$('.formDiv2').hide();
	});
	function nickCheck(){
		var chk = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
		var nickName = $('#nickName').val();
		console.log(nickName);
		if(nickName.length < 2 || nickName.length > 10){
			submitCheck = false;
			alert("2~10자의 한글, 영문, 숫자만 사용할 수 있습니다.");
			$('#nickName').val('');
			$('#nickName').focus();
			$('.formDiv span').text('X');
			return;
		}
		for(var i=0;i<=nickName.length-1;i++){
			if(!chk.test(nickName.charAt(i))){
				submitCheck = false;
				alert("2~10자의 한글, 영문, 숫자만 사용할 수 있습니다.");
				$('#nickName').val('');
				$('#nickName').focus();
				$('.formDiv span').text('X');
				return;
			} else{
				submitCheck = true;
			}
		}
		$.ajax({
			url:'nickCheck.ho',
			type: 'POST',
			data:{
				nickName:nickName
			},
			async : false,
			success:function(data){
				if(data == 'success'){
					submitCheck = true;
					$('.formDiv span').text('O');
					return;
				} else if(data == 'fail'){
					submitCheck = false;
					alert('중복된 닉네임입니다.');
					$('#nickName').val('');
					$('#nickName').focus();
					$('.formDiv span').text('X');
					return;
				}
			}
		});
	}
	function update(){
		var nickName = $('#nickName').val().trim();
		var email = $('#email').val().trim();
		var phone = $('#phone').val().trim();
		var phone2 = $('#phone2').val().trim();
		
		if(phone == ""){
			alert('전화번호을 채워주세요');
			$('#phone').focus();
			return false;
		}
		if(phone2 == ""){
			alert('전화번호2을 채워주세요');
			$('#phone2').focus();
			return false;
		}
		if(email == ""){
			alert('이메일을 채워주세요');
			$('#email').focus();
			return false;
		}
		
		if(submitCheck){
			var result = confirm('이 정보로 수정하시겠습니까?');
			if(result){
				alert('수정이 완료되었습니다.');
				return true;
			} else{
				alert('취소');
				return false;
			}
			
		} else{
			alert('입력 형식을 다시확인해주세요');
			return false;
		}
	}
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','56px');
	$('.gnb_menu .gnb_menu_ul li a.gnb2').css('background','url("resources/layout/images/bg02_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb2 .ico').css('background', 'url("resources/layout/images/ico02_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb2 .text span').css('color','#fff');
	$('.gnb_menu .gnb_menu_ul li a .text:eq(1)').css('color', '#fff');
	$('.gnb_menu a').css('text-decoration','none');
</script>
</html>