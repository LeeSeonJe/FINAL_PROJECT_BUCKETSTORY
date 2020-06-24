function insertPoint(price , coId , today) {
	alert(price * (1 - dc) + '원을 결제합니다.');
	$.ajax({
		url : "pinsert.ex",
		data : {
			pa_no : 9999,
			pa_pay : price * 1.1, //보너스 포인트 포함
			coid : coId,
			status : 'Y',
			pdate : today,
		},
		success : function(data) {
			var msg = '결제가 완료되었습니다.';
			alert(msg);
			location.reload();
		}
	});
}

var dc = 0.3; //할인율
var IMP = window.IMP;
IMP.init('imp49697884');

function requestPay(price , coId , today) {
	var chkbox = document.getElementsByName('agree');

	//console.log(chkbox);

	if (chkbox[0].checked) {
		//console.log('체크');
		alert(price * (1 - dc) + '원을 결제합니다.');

		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:포인트충전',
			amount : price * (1 - dc),

			// 			    buyer_email : 'iamport@siot.do',
			buyer_name : coId

		}, function(rsp) {
			if (rsp.success) {
				$.ajax({
					url : "pinsert.ex",
					data : {
						pa_no : 9999,
						pa_pay : price * 1.1, //보너스 포인트 포함
						coid : coId,
						status : 'Y',
						pdate : today,
					},
					success : function(data) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);
						location.reload();
					}
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});

	} else {
		//console.log('안체크');
		alert('이용약관에 동의해주세요');
	}
}
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

	if ($('#check').val() == 'first') {
		$('html').scrollTop(0);
	} else {
		document.getElementById('board-paging').scrollIntoView();
	}
	//$('.p-section').hide();

});



$(window).scroll(function() {
	var scrolltop = $(document).scrollTop();

	if (scrolltop < 380) {
		$("#pointMenu li").removeClass();
		$("#pointMenu li:nth-child(1)").addClass("on");
	}

	if (scrolltop > 380) {
		$("#pointMenu li").removeClass();
		$("#pointMenu li:nth-child(2)").addClass("on");
	}

});

$(document).ready(function() {
	var vid = $(this).find("video").get(0);
	vid.cureentTime = 0;

	vid.play();
	//consolo.log(vid);
	
	var scrolltop = $(document).scrollTop();

});

$("a[href^='#']").click(function(event){
	event.preventDefault();
	var target = $(this.hash);
	// 헤더가 fixed 이기 떄문에 header만큼 뻄
	//console.log(target.offset().top-108);
	$('html, body').animate({scrollTop:target.offset().top-108},300);
});
