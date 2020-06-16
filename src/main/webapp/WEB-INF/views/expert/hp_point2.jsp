<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/hp_point.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
#point-nav ul li:first-child {
	background-color: rgba(0, 0, 0, 0.085);
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />

	<%-- <jsp:include page="/WEB-INF/views/expert/hp_pointCon.jsp"/>  --%>

	<div class="point-inner">

		<div class="inner__header">
			<!--                <div><p>Point 충전</p></div>  -->

			<!--              <div><p>Point 내역</p></div>  -->
		</div>

		<div class="inner__content">

			<!-- <br><br>
                 <div class="banner">
                    <p>포인트 충전</p>
                </div>
                <br> -->
			<div class="point-img">
				<img src="resources/expert/images/sale2.PNG" alt=" " />
			</div>
			<table class="point">
				<thead>
					<tr>
						<th scope="cols">충전 포인트
						</td>
						<th scope="cols">보너스 포인트
						</td>
						<th scope="cols">금액
						</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>11,000 point</td>
						<td>+11,000 point</td>
						<td><p class="p-before">11,000원</p>
							<p class="p-after">7,000원</p></td>
					</tr>
					<tr>
						<td>22,000 point</td>
						<td>+22,000 point</td>
						<td><p class="p-before">22,000원</p>
							<p class="p-after">11,000원</p></td>
					</tr>
					<tr>
						<td>33,000 point</td>
						<td>+33,000 point</td>
						<td><p class="p-before">33,000원</p>
							<p class="p-after">27,000원</p></td>
					</tr>
					<tr>
						<td>44,000 point</td>
						<td>+44,000 point</td>
						<td><p class="p-before">44,000원</p>
							<p class="p-after">37,000원</p></td>
					</tr>
				</tbody>
			</table>


			<br>
			<br>
			<div class="content-m banner">
				<p>결제수단</p>
			</div>
			<br>
			<br>

			<div id="payfrom-outer">

				<form id="payform">
					<div id="payform-img">
						<!-- <img src ="../image/credit.png" alt=""> -->
						<img src="resources/expert/images/phone.png" alt="">
					</div>

					<div id="payform-select">
						<div class="payform-radio">
							<input type="radio" name="pay" value="card" checked>
							<p>신용/체크 카드</p>
						</div>
						<div class="payform-radio">
							<input type="radio" name="pay" value="phone">
							<p>휴대폰</p>
						</div>
					</div>
					<div id="payform-bottom">
						<button class="btn btn--primary2" onclick="requestPay();">결제하기</button>
					</div>
				</form>

			</div>

		</div>

		<br> <br> <br>
	</div>
<button class="btn btn--primary2" onclick="requestPay();">결제하기</button>

	<script>

	  var IMP = window.IMP; 
	  IMP.init('imp49697884'); 
	  
		function requestPay() {
			alert('안녕');
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}


//         function setDisplay(){
//             if($('input:radio[id=aaa]').is(':checked')){
//                 $('#divId').hide();
//             }else{
//                 $('#divId').show();
//             }
//         }
        
    </script>


</body>
</html>