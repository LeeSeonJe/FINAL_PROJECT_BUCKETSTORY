(function() {
	$('pwdCheck').hide();
	var result = $('#insertResult').val();
	console.log(result);
	if (result == 'ok') {
		alert('정보가 성공적으로 변경되었습니다.')
	}
	$('#intro_content').fadeIn(1000);
	$('#intro_background').fadeIn(1000);
})();

function goHome(){
	var target = $("#hpTop");
	$('html, body').animate({scrollTop : target.offset().top - 108}, 500);
//	setTimeout(function() {
//		location.reload();	
//		}, 520);
}

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

// select 에서 DB에서 cateNum 을 가지고 기본으로 option selected 된것을 정한다.
$(document).ready(function() {
	$('#cateNum option').each(function() {
		if ($(this).val() == "${com.cateNum}") {
			$(this).attr("selected", "selected"); // attr적용안될경우 prop으로
		}
	});

});


// 스크롤 이벤트
$(window).scroll(function() {
	var scrolltop = $(document).scrollTop();
	if (scrolltop < 640) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(2)").addClass("on");
	}
	if (scrolltop < 720) {
		$("#dal img").css("transform", "translate(-100px,50px)");
		$('#intro_content').fadeIn(800);
		$('#intro_background').fadeIn(800);
		$('#submitform').removeClass('submitAreaOn1').addClass('submitAreaOff1');
	}
	if (scrolltop > 880) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(3)").addClass("on");
		$("#dal img").css("transform", "translate(10px,-5px)");
		$('#intro_content').fadeOut(500);
		$('#intro_background').fadeOut(500);
		$('#submitform').removeClass('submitAreaOff1').addClass('submitAreaOn1');
		$('#submitform2').removeClass('submitAreaOn2').addClass('submitAreaOff2');
	}
	if (scrolltop > 1600) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(4)").addClass("on");
		$("#dal img").css("transform", "translate(15px,-10px)");
		$('#submitform2').removeClass('submitAreaOff2').addClass('submitAreaOn2');
	}
	if (scrolltop > 2200) {
		$("#navigation li").removeClass();
		$("#navigation li:nth-child(5)").addClass("on");
		$("#dal img").fadeOut(1200);
		$('.helperEdit3 p').fadeIn(2000);
	}
	if(scrolltop < 2000){
		$("#dal img").show();
		$('.helperEdit3 p').fadeOut(500);
	}
});

$("a[href^='#']").click(function(event) {
	event.preventDefault();
	var target = $(this.hash);
	// 헤더가 fixed 이기 떄문에 header만큼 뻄
	console.log(target.offset().top - 108);
	$('html, body').animate({
		scrollTop : target.offset().top - 108
	}, 500);
});
