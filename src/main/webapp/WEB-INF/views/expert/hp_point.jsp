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

<section>
	<div class="point-inner">

		<div class="inner__header">
			<div>
				<br>
				<h2>보유 총 포인트 : ${hp} 포인트 </h2>
			</div>
		</div>

		<div class="inner__content">

			<!-- <br><br>
                 <div class="banner">
                    <p>포인트 충전</p>
                </div>
                <br> -->
			<div class="point-img">
							
				<!--  보너스 포인트 10% -->
				<!--  이벤트배터  할인율 : 30 % 적용 -->
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
						<th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>10,000 point</td>
						<td>+1,000 point</td>
						<td><p class="p-before">10,000원</p>
							<p class="p-after">7,000원</p></td>
						<td><button class="btn btn--primary2" onclick="requestPay(10000);">결제하기</button></td>
					</tr>
					<tr>
						<td>20,000 point</td>
						<td>+2,000 point</td>
						<td><p class="p-before">20,000원</p>
							<p class="p-after">14,000원</p></td>
						<td><button class="btn btn--primary2" onclick="requestPay(20000);">결제하기</button></td>
					</tr>
					<tr>
						<td>30,000 point</td>
						<td>+3,000 point</td>
						<td><p class="p-before">30,000원</p>
							<p class="p-after">21,000원</p></td>
						<td><button class="btn btn--primary2" onclick="requestPay(30000);">결제하기</button></td>
					</tr>
					<tr>
						<td>40,000 point</td>
						<td>+4,000 point</td>
						<td><p class="p-before">40,000원</p>
							<p class="p-after">28,000원</p></td>
						<td><button class="btn btn--primary2" onclick="requestPay(40000);">결제하기</button></td>
					</tr>
				</tbody>
			</table>


			<br>
			<br>
		</div>
	</div>
</section>
	<script>
	
		function test(price){
			
			alert('test')
			 $.ajax({
// 		    	  url:"ptest.ex",
				  url:"pinsert.ex",
		      	  data:{
		      		 pa_no  : 9999,
		      		 pa_pay : price,
		      		 coid   : "KH_ACADEMY",
		      		 status : 'Y',
		      		 pdate  : "1900-01-01",
		      	  },
					success : function(data){
				        var msg = '결제가 완료되었습니다.';
				        alert(msg)
					}		
		      });
		}
		
	  var dc = 0.3; //할인율
	  var IMP = window.IMP; 
	  IMP.init('imp49697884'); 
	  
		function requestPay(price) {
			
			alert(price * (1-dc) +'원을 결제합니다.');
			
			IMP.request_pay({
			    pg : 'inicis', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:포인트충전',
			    amount : price * (1-dc),
			 
// 			    buyer_email : 'iamport@siot.do',
			    buyer_name : '로그인유저',
			  /*   buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
			    
			}, function(rsp) {
			    if ( rsp.success ) {
			      $.ajax({
// 			    	  url:"ptest.ex",
					  url:"pinsert.ex",
// 			    	  method:"POST"
// 			    	  headers:{"Content-Type":"application/json"}
			      	  data:{
			      		 pa_no  : 9999,
			      		 pa_pay : price * 1.1, //보너스 포인트 포함
			      		 coid   : "KH_ACADEMY",
			      		 status : 'Y',
			      		 pdate  : "1900-01-01",
			      	  },
						success : function(data){
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        alert(msg);
						}		
			      });
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}

    </script>


</body>
</html>