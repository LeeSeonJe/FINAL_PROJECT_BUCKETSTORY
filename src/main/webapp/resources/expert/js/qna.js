$('#cancle').click(function() {
	history.go(0);
});

// 페이지 리로드 : 재문의
$('#retry').click(function() {
	history.go(0);
});

$('#submitQnA').click(function() {
	var title = $('#title').val();
	var content = $('#content').val();

	if (title == "") {
		alert('제목을 입력하세요');
	} else if (content == "") {
		alert('내용을 입력하세요');
	} else {
		$.ajax({
			url : "insertQnAjax.ex",
			data : {
				title : title,
				content : content
			},

			success : function(data) {
				console.log(data);
				if (data == 'ok') {
					console.log('전송성공');
					// 성공 로직

					// $('#writeform').hide();
					// $('#sucessform').show();

					$('#writeform').fadeOut(600);
					setTimeout(function() {
						$('#sucessform').fadeIn(600);
					}, 600);
					//history.go(0);

				} else {
					console.log('전송실패');

					// 실패 로직
					$('#writeform').hide();
					$('#errorform').show();
				}
			}
		});
	}
});

$(function() {
	$('.board td').mouseenter(function() {
		$(this).parent().css({
			'background' : 'beige',
			'cursor' : 'pointer'
		})
	}).mouseout(function() {
		$(this).parent().css({
			'background' : 'whitesmoke'
		})
	})

	$('.board').click(function() {
		console.log('클릭했다');
	});
});
