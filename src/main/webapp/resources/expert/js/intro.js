(function() {
	$('pwdCheck').hide();
	var result = $('#insertResult').val();
	console.log(result);
	if (result == 'ok') {
		alert('정보가 성공적으로 변경되었습니다.')
	}

	$('#intro_content').fadeIn(500);
	$('#intro_background').fadeIn(500);

})();

// HelperEdit1 사진넣기
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#foo').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$("#imgInp").change(function() {
	readURL(this);
});

// F5 키보드 키를 눌러서 새로고침시 GET 파라미터 제거 후 새로고침 하기
// kcode 아스키코드 116 : F5
window.onkeydown = function() {
	var kcode = event.keyCode;
	if (kcode == 116) {
		history.replaceState({}, null, location.pathname);
	}
}

//select 에서 DB에서 cateNum 을 가지고 기본으로 option selected 된것을 정한다.
$(document).ready(function() {
	$('#cateNum option').each(function() {
		if ($(this).val() == "${com.cateNum}") {
			$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
		}
	});

});

var oldPwd = document.getElementById('oldPwd');
var newPwd = document.getElementById('newPwd');
var isEqualsOldCheck = false;

// 기존비밀번호 일치 확인
oldPwd.onchange = function() {

	//		if(oldPwd.value == '${com.coPwd}'){
	//			$('#pwdCheck1').show();
	//			$('#pwdCheck2').hide();
	//		}else{
	//			$('#pwdCheck2').show();
	//			$('#pwdCheck1').hide();
	//		}
	$.ajax({ //현재 아이디 보내서 비교해서 값을 받아오기
		url : 'helperPwdCheck.ex',
		data : {
			oldPwd: oldPwd.value
		},
		success : function(data) {
			console.log(data);

			if (data == 'ok') {
				$('#pwdCheck1').show();
				$('#pwdCheck2').hide();
				isEqualsOldCheck = true;
			} else {
				$('#pwdCheck2').show();
				$('#pwdCheck1').hide();
			}

		},
		error:function(request,status,errorData){
		console.log("error code :" + request.status + "\n"
			+ "message : " + request.responseText + "\n"
			+ "error : "  + errorData);
			}
	});

}

// 비밀번호 규칙 : 비밀번호는 영문 숫자 7~11자리 
var re4 = /^[a-zA-Z\d]{7,11}$/;
var isCanPwdCheck = false;

newPwd.onchange = function() {

	if (re4.test(newPwd.value)) {
		// alert('비밀번호는 영문 숫자7~11자리 ');
		$('#pwdCheck3').show();
		$('#pwdCheck4').hide();
		//   console.log(newPwd.value);
		isCanPwdCheck = true;
	} else {
		$('#pwdCheck4').show();
		$('#pwdCheck3').hide();
		
	}
};

/*
 * 유효성을 체크한다.
 */
function submitCheck(form){
	console.log(canSubmit);
	
	if(!isEqualsOldCheck){
		alert('입력한 현재 비밀번호가 일치하지 않습니다.다시 확인해주세요');
		return false;
	}
	if(!isCanPwdCheck){
		alert('비밀번호는 영문 숫자조합 7~11자리만 가능합니다.');
		return false;
	}
	if(isCanPwdCheck && isCanPwdCheck){
		alert('전송합니다.');
		return true;
	}
	
}

// 스크롤 이벤트
$(window).scroll(function() {
	var scrolltop = $(document).scrollTop();

	if (scrolltop < 640) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(2)").addClass("on");
	}
	if (scrolltop < 720) {

		$("#navigation img").css("transform", "translate(-100px,50px)");
		//		$("#HelperEdit div").hide();
		//		$("#HelperEdit2 div").hide();
		$('#intro_content').fadeIn(800);
		$('#intro_background').fadeIn(800);

		$('#submitform').removeClass('submitAreaOn1');
		$('#submitform').addClass('submitAreaOff1');
	}

	if (scrolltop > 880) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(3)").addClass("on");
		$("#navigation img").css("transform", "translate(10px,-5px)");
		//	   $("#HelperEdit div").show();
		$('#intro_content').fadeOut(500);
		$('#intro_background').fadeOut(500);

		$('#submitform').removeClass('submitAreaOff1');
		$('#submitform').addClass('submitAreaOn1');

		$('#submitform2').removeClass('submitAreaOn2');
		$('#submitform2').addClass('submitAreaOff2');
	}

	if (scrolltop > 1600) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(4)").addClass("on");
		$("#navigation img").css("transform", "translateX(15px,-10px)");

		// $("#HelperEdit2 div").show();

		$('#submitform2').removeClass('submitAreaOff2');
		$('#submitform2').addClass('submitAreaOn2');
	}

});

$("a[href^='#']").click(function(event){
	event.preventDefault();
	var target = $(this.hash);
	// 헤더가 fixed 이기 떄문에 header만큼 뻄
	console.log(target.offset().top-108);
	$('html, body').animate({scrollTop:target.offset().top-108},300);
});

