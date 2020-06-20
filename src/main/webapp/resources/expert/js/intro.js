(function(){
	var result = $('#insertResult').val();
	console.log(result);
	if (result == 'ok') {
		alert('기업소개가 성공적으로 변경되었습니다.')
	}
	
})();

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
	if(kcode == 116) {
		history.replaceState({}, null, location.pathname);
		}
	}
