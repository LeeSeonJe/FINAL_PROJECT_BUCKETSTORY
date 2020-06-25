<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.text.SimpleDateFormat, java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/hp_point.css">
<link rel="stylesheet" href="resources/expert/css/hp_boardList.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.active {
	background: #a53383 linear-gradient(#b83691cc, #a53383);
	color: white;
}

.pbp{
	background:#fff;
}
.paging {
	margin: 0 auto;
	height: 50px;
	width: 100%;
	margin-top:20px;
	text-align: center;
}

.pbtn {
	height: 34px;
	border: 1px solid #d5d5d5;
	border-radius: 6px;
	display: inline-flex;
	align-items: center;
	padding: 0 12px;
	font-size: 14px;
	font-weight: 500;
	line-height: 1.5;
	cursor: pointer;
	box-sizing: border-box;
	position: relative;
}

.pbtn:hover::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.07);
}
.pbtn.btn--primary2 {
	border: 1px solid #b83691;
	color: #fff;
	background: #a53383 linear-gradient(#b83691cc, #a53383);
}

#prev, #next {
	padding: 5px;
	background: #036;
	border-radius: 5px;
	color: white;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
	<section id="hpTop">
		<div class="point-inner background">

			<ul id="pointMenu">
				<li class="on"><a href="#hpTop">포인트 충전</a></li>
				<li><a href="#hpBottom">포인트 내역조회</a></li>
			</ul>
			<div id="pointArea">
				<div class="inner__header">
					<h2>${coId}님환영합니다!</h2>
					<h2>보유 총 포인트 : ${hp} 포인트</h2>
					<br>
				</div>
				<br> <br>

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
								<td><button class="btn btn--primary2"
										onclick='requestPay(10000,"${coId}","<%=today%>");'>결제하기</button></td>
							</tr>
							<tr>
								<td>20,000 point</td>
								<td>+2,000 point</td>
								<td><p class="p-before">20,000원</p>
									<p class="p-after">14,000원</p></td>
								<td><button class="btn btn--primary2"
										onclick='requestPay(20000,"${coId}","<%=today%>");'>결제하기</button></td>
							</tr>
							<tr>
								<td>30,000 point</td>
								<td>+3,000 point</td>
								<td><p class="p-before">30,000원</p>
									<p class="p-after">21,000원</p></td>
								<td><button class="btn btn--primary2"
										onclick='requestPay(30000,"${coId}","<%=today%>");'>결제하기</button></td>
							</tr>
							<tr>
								<td>40,000 point</td>
								<td>+4,000 point</td>
								<td><p class="p-before">40,000원</p>
									<p class="p-after">28,000원</p></td>
								<td><button class="btn btn--primary2"
										onclick='requestPay(40000,"${coId}","<%=today%>");'>결제하기</button></td>
							</tr>
						</tbody>
					</table>

					<br> <br>
				</div>

				<!-- 동의구함 -->
				<div id="checkAgree">
					<!-- 			<input type="file" id="fileInput"> -->
					<div>
						<b>버킷리스트 통신과금 서비스 이용약관</b>
						<textarea name="tos" rows=15 cols=100 id="fileDisplayArea"
							style="overflow-x: hidden;">
제1조 (목적)
이 약관은 통신과금 서비스를 제공하는 주식회사 버킷리스트(이하 '회사'라 합니다)와 통신과금서비스이용자(이하 ‘이용자’라 합니다) 사이의 통신과금 서비스에 관한 기본적인 사항을 정함으로써 통신과금 서비스의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.

제2조 (용어의 정의)
이 약관에서 정하는 용어의 정의는 다음과 같습니다. 
1. '통신과금 서비스'라 함은 정보통신서비스로서 다음 각 목의 업무를 말한다.
가.타인이 판매, 제공하는 재화 또는 용역(이하 “재화 등”이라 한다)의 대가를 자신이 제공하는 전기통신역무의 요금과 함께 청구, 징수하는 업무
나.타인이 판매, 제공하는 재화 등의 대가가 가목의 업무를 제공하는 자의 전기통신역무의 요금과 함께 청구, 징수되도록 거래정보를 전자적으로 송수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 업무
2.'이용자'라 함은 이 약관에 동의하고 회사가 제공하는 통신과금 서비스를 이용하는 자를 말합니다.
3.'접근매체'라 함은 통신과금거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 유무선 전화 및 통신사에 등록된 이용자의 유무선 전화 번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등을 말합니다.
4.'거래지시'라 함은 이용자가 통신과금서비스계약에 따라 회사에게 통신과금서비스의 처리를 지시하는 것을 말합니다.
5.‘가맹점’이라 함은 통신과금서비스를 통하여 이용자에게 재화 또는 용역을 판매, 제공하는 자를 말합니다.
6.‘지정한 기일’이란 이용자가 통신사와 약정한 1항의 전기통신역무의 요금 납입기한을 의미하며, 이는 이동통신사의 기준에 따릅니다.

제3조 (약관의 명시 및 변경)
1.회사는 이용자가 통신과금 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
2.회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다. 
3.회사가 약관을 변경하는 때에는 그 시행일 2주 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.

제4조 (접근매체의 관리 및 이용자의 의무)
1.회사는 통신과금 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
2.이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
3.이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안 되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
4.회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다. 
5.이용자는 '정보통신망 이용촉진 및 정보보호에 관한 법률' 제72조에 의거하여 재화 등을 가장매매, 할인 매입 등의 행위를 하였을 경우 회사는 관계당국에 고소 및 고발, 민사상의 법적 조치를 취할 수 있습니다.

제5조 (모니터링 및 해킹방지 시스템 구축)
1.회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링체계를 갖추어야 합니다.
2.회사는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여야 합니다.
가.침입차단시스템 설치
나.침입탐지시스템 설치
다.그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치

제6조 (바이러스 감염 방지)
회사는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립.운용하여야 합니다.
1.출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것
2.컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것
3.컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것

제7조 (이용자의 정보보호)
1.회사는 이용자의 과실 또는 이용자 장비의 문제로 인해 회사의 정보통신망에 중대한 침해사고가 발생하여 회사의 서비스를 이용하는 이용자의 정보시스템 또는 정보통신망 등에 심각한 장애가 발생할 가능성이 있는 아래 각 호의 경우에는 이용자에 대한 보호조치를 전자우편, 공지사항 등의 방법으로 요청할 수 있습니다. 
가.사용자의 장비가 제3의 사용자에게 이용 당하여 회사의 서비스에 장애를 초래한 경우
나.사용자의 장비의 H/W 혹은 S/W의 문제로 회사의 서비스에 장애를 초래하는 경우
다.사용자가 고의 혹은 실수로 회사의 악의적인 접속을 시도하거나 접속을 한 경우
2.이용자가 취할 보호조치의 내용은 아래 각 호와 같습니다.
가.해당 장비의 네트워크로부터 연결케이블 제거, 서비스 포트 차단, 네트워크 주소 차단 등의 즉각적인 분리
나.해당 장비에 대한 보안점검
다.관련 원인점검 및 패치, OS재설치, 필터링 등의 사후 보안 조치 실시
3.회사는 이용자가 전항의 보호조치를 이행하지 아니할 경우 정보통신망으로의 접속을 5일간 제한할 수 있습니다. 
4.회사가 이용자의 보호조치 불이행에 대하여 부당한 접속 제한을 한 경우 이용자는 제10조 제4항의 담당자에게 이의제기를 할 수 있으며, 회사는 이의제기를 접수 후 2주 이내로 사실을 확인하고, 이용자에게 서면 또는 유선으로 답변을 하여야 합니다. 

제8조 (회사의 권리와 의무)
1.회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다. 
2.회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 
3.회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제2항에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
4.회사는 이용자가 통신과금 서비스 이용 시 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 또는 이용자가 제4조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 통신과금서비스를 이용할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기한 손해에 대하여 배상 책임이 없습니다. 
5.회사와 이용자 사이에 손해배상에 관한 협의가 성립되지 아니하거나 협의를 할 수 없는 경우에는 당사자는 방송통신위원회에 조정을 신청할 수 있습니다.
6.회사는 이용자에게 거래 금액 외에 일정금액의 수수료를 건당 부과할 수 있습니다.
7.회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 통신과금 서비스의 제공을 일시적으로 중단할 수 있습니다.
8.회사는 전항의 사유로 통신과금 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자가 입은 손해에 대하여 배상합니다. 단, 회사가 고의 또는 과실이 없음을 입증한 경우에는 그러하지 아니합니다.
9.회사는 이용자가 전기통신역무의 요금과 함께 청구된 재화 등의 대가를 통신사가 지정한 기일까지 납입하지 아니한 때에는 다음과 같은 가산금을 부과합니다. 
납기일 경과 후 1개월차: 요금의 100분의 4
납기일 경과 2개월부터: 요금의 100분의 5

제9조 (고지사항)
회사는 재화 등의 판매ㆍ제공의 대가를 청구할 때 이용자에게 다음 각 호의 사항을 고지하여야 합니다.
1.통신과금서비스 이용일시
2.가맹점의 상호와 연락처
3.통신과금서비스를 통한 구매ㆍ이용 금액과 그 명세
4.이의신청 방법 및 연락처

제10조 (거래내용의 확인)
1.회사는 이용자가 구매ㆍ이용 내역을 확인할 수 있는 방법을 제공하여야 하며, 이용자가 구매.이용 내역에 관한 서면(전자문서를 포함한다. 이하 같다)을 요청하는 경우에는 그 요청을 받은 날부터 2주 이내에 이를 제공하여야 합니다.
2.회사는 다음 각 호의 사항에 관한 기록을 해당 거래를 한 날부터 1년간 보존하여야 합니다. 다만, 건당 거래 금액이 1만원을 초과하는 거래인 경우에는 5년간 보존하여야 합니다. 
가.통신과금서비스를 이용한 거래의 종류
나.거래 금액
다.가맹점
라.거래 일시
마.대금을 청구ㆍ징수하는 전기통신역무의 가입자번호
바.회사가 통신과금 서비스 제공의 대가로 수취한 수수료에 관한 사항
사.해당 거래와 관련한 전기통신역무의 접속에 관한 사항
아.거래의 신청 및 조건의 변경에 관한 사항
자.거래의 승인에 관한 사항
차.그 밖에 방송통신위원회가 정하여 고시하는 사항
3.전항에 따른 거래기록은 서면, 마이크로필름, 디스크, 자기테이프, 그 밖의 전산정보처리조직에 의하여 보존하여야 합니다. 다만, 디스크, 자기테이프, 그 밖의 전산정보처리조직에 의하여 보존하는 경우에는 전자거래기본법 제5조 제1항 각 호의 요건을 모두 갖추어야 합니다.
4.이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다. 
주소: 경기도 성남시 분당구 대왕판교로 660(삼평동, 유스페이스 1A동 5층) 
이메일 주소: cs@inicis.com
전화번호: 1588-4954

제11조 (정정 요구) 
이용자는 통신과금서비스가 자신의 의사에 반하여 제공되었음을 안 때에는 회사에게 이에 대한 정정을 요구할 수 있으며(이용자의 고의 또는 중과실이 있는 경우는 제외한다), 회사는 그 정정 요구를 받은 날부터 2주 이내에 처리 결과를 알려 주어야 한다. 

제12조 (통신과금정보의 제공금지)
1.회사는 통신과금 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 통신과금의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.
2.회사는 정보통신망이용촉진및정보보호등에관한법률 (제7장 통신과금서비스)의 관련규정에 의거하여 “미래창조과학부장관 또는 방송통신위원회”가 이용자 보호를 위해 통신과금서비스 관련 정보를 요청하면 다음 각 호의 경우에는 관련 정보를 제공할 수 있습니다. 
가.휴대폰깡, 대포폰, 복제폰 등 시장 질서를 교란시키는 불법업체 혹은 불법행위자에 의한 민원발생의 경우
나.지인 사용 등 제3자 결제로 인한 민원발생의 경우
다.기타 통신과금서비스를 통한 불법행위가 발생하여 이용자 보호가 필요한 경우

제13조 (이의신청 및 권리구제)
목적 : 고객서비스 담당 책임	
담당자 :조명수 팀장
전화번호 :02-3430-5823
전자메일주소 : khh94@inicis.com
1.이용자는 다음의 연락처를 통하여 이의신청 및 권리구제를 요청할 수 있습니다. 
2.이용자는 서면(전자문서를 포함한다), 전화, 모사전송 등을 통하여 회사에게 통신과금서비스와 관련된 이의신청을 할 수 있습니다.
3.회사는 제2항에 따른 이의신청을 받은 날부터 2주일 이내에 그 조사 또는 처리 결과를 이용자에게 알려야 합니다. 

제14조 (회사의 안정성 확보 의무)
회사는 통신과금 서비스의 안전성과 신뢰성을 확보할 수 있도록 통신과금 서비스의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 통신과금업무에 관하여 방송통신위원회가 정하는 기준을 준수합니다. 

제15조 (약관 외 준칙 및 관할)
1.이 약관에서 정하지 아니한 사항에 대하여는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다. 
2.회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.

부칙 
1.본 약관은 2013년 12월 11일부터 적용합니다. 
2.기존에 적용되던 약관(2008.6.30~2013.12.10 적용)은 본 약관으로 대체합니다.					
</textarea>

						<div id="agreeCheck">
							<label>동의</label> <input type="checkbox" name="agree">
						</div>
					</div>

				</div>
			</div>

<script>
var dc = 0.3; //할인율
var IMP = window.IMP;
IMP.init('imp49697884');
function requestPay(price , coId , today) {
	var chkbox = document.getElementsByName('agree');
	if (chkbox[0].checked) {
		alert(price * (1 - dc) + '원을 결제합니다.');
		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:포인트충전',
			amount : price * (1 - dc),
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
		});
	} else {
		alert('이용약관에 동의해주세요');
	}
}
</script>

			<div class="p-section">
				<!--         <p id ="title">포인트 내역</p> -->

				<div id="board-top">
					<video loop="loop" preload="auto">
						<source src="resources/expert/video/vd1.mp4" type="video/mp4">
					</video>
				</div>

				<br>
				<!--  	<img src ="resources/expert/images/moon.jpg"> -->
				<%--     <h3>${coId} 님 환영합니다!</h3> --%>

			
				<h3><span id="PT1">포인트 충전/사용</span>(<input style="border: none; background:whitesmoke;width:25px; font-weight: 600; color:#036; border-radius:4px; font-size:24px" type="text" id='search' readonly="readonly">) 횟수 : 
							<input style="border: none; width:30px; font-weight: 600; background:whitesmoke;font-size:24px; color:#036;  border-radius:4px;" type='text' id='listCount' readonly="readonly"></h3>
				<h3><span id="PT2">총 충전 포인트 : </span><input style="border: none; background:whitesmoke; width:100px; font-weight: 400; font-size:22px; border-radius:4px; color:#333;" type='text' id='point' readonly="readonly">Point</h3>
				<!--         게시판 목록 영역 -->
				<div id="board-area">
						<table class="board pboard" id="hpBottom">
							<tr>
								<th scope="cols" width="8%">번호</th>
								<th scope="cols" width="30%">포인트</th>
								<th scope="cols" width="32%">날짜</th>
								<th scope="cols" width="20%">
									<button class="SB btn btn--primary2" id="allBtn"
										onclick="goShowAll();">전체</button>
									<button class="SB btn" id="yBtn" onclick="goShowY();">충전</button>
									<button class="SB btn" id="nBtn" onclick="goShowN();">사용</button>
								</th>
							</tr>
						</table>
						<table class="board bp" id="payData"></table>
						<div class="paging"></div>
						<input type='hidden' id='currPage'><input type='hidden' id='pageLimit'>
						<input type='hidden' id='maxPage'><input type='hidden' id='nth'>	
				
						<script>
						function goShowAll(){
							newPaging('all');
							$('.SB').removeClass('btn--primary2');
							$('#allBtn').addClass('btn--primary2');
							$('#PT1').text("포인트 충전/사용");
							$('#PT2').text("총 보유 포인트 : ");
						}
						function goShowY(){
							newPaging('Y');
							$('.SB').removeClass('btn--primary2');
							$('#yBtn').addClass('btn--primary2');
							$('#PT1').text("포인트 충전");
							$('#PT2').text("총 충전 포인트 : ");
						}
						function goShowN(){
							newPaging('N');
							$('.SB').removeClass('btn--primary2');
							$('#nBtn').addClass('btn--primary2');
							$('#PT1').text("포인트 사용");
							$('#PT2').text("총 사용 포인트 : ");
						}
						
						$(function(){
								$('#nth').val(0);
								$('#currPage').val(1);
								newPaging('all');	
						});
						function newPaging(key){
							$('#search').val(key);
							$.ajax({
						        url :'pointCountAjax.ex?search='+ key,
				 		        dataType:'json',
						        	success:function(data){
						        		$('#maxPage').val(data.pi.maxPage);
						        		$('#pageLimit').val(data.pi.pageLimit);
						        		console.log(data.pi.listCount);
						        		$('#listCount').val(data.pi.listCount);
						        		$('#point').val(data.point);
						        		paging(0);
						        		$('.paging button').removeClass('active').eq(1).addClass('active');
						        },
						        error:function(data){
						        	$('#maxPage').val(1);
						        	$('#pageLimit').val(1);
						        	$('#listCount').val(0);
						        	$('#point').val(0);
						        }		
						    });
							buildBoard(1);
						}
						
						function paging(nth){
							
							const pageLimit = Number($('#pageLimit').val());
							const maxPage = Number($('#maxPage').val());
							const start = Number(pageLimit*nth) + 1;
							var search = $('#search').val();
							
							var count = 0;
							
							if(((pageLimit*nth) + pageLimit) > maxPage){
								count = maxPage;
							}else{
								count = pageLimit*nth + pageLimit;
							}
						
							$text = "<button class ='pbtn' id='prev' onclick='preBoard();'>이전</button>";
				    		for(var i = start; i <= count ; i++){
				    			
				    			$text += "<button class ='pbtn' onclick='buildBoard(" + i + ");'>" + i + "</button>";
				    		}
				    		$text += "<button class ='pbtn' id='next' onclick='nextBoard();'>다음 </button>";
				    		$('.paging').html($text);
				    		
						}
						
						function preBoard(){
							var num = Number($('#currPage').val());		
							if((num - 1) < 1){
								$('#currPage').val(1);
								buildBoard(1)
							}else{
								const pageLimit = $('#pageLimit').val();
								var nth = Number($('#nth').val());
								if((num -1) <= pageLimit*nth){
									$('#nth').val(nth-1);
									paging(nth-1);	
									$('#currPage').val(num-1);
									buildBoard(num-1);
								}else{
									$('#currPage').val(num-1);
									buildBoard(num-1);
								}
							}
						}
						function nextBoard(){
							var num = Number($('#currPage').val());
							var max = Number($('#maxPage').val());
							if(num + 1 > max){
								$('#currPage').val(max);
								buildBoard(max);
							}else{
								const pageLimit = $('#pageLimit').val();
								var nth = Number($('#nth').val());
								if(pageLimit*(nth+1) < num + 1){
									$('#nth').val(nth+1);
									paging(nth+1);
									$('#currPage').val(num+1);
									buildBoard(num+1);
								}else{
									$('#currPage').val(num+1);
									buildBoard(num+1);
								}	
							}	
						}
						function buildBoard(num){

							const pageLimit = Number($('#pageLimit').val());
							const nth = Number($('#nth').val());
							var search = $('#search').val();
							var select = num - pageLimit*nth;
							
							console.log(num);	
							
							$('#currPage').val(num);
							$('.paging button').removeClass('active').eq(select).addClass('active');

							$.ajax({
						        url :'pointListAjax.ex?page='+num,
						        data :{
						        	search : search
						        },
						        dataType:'json',
						        success:function(data){
						            $text ="";
						            for(var i in data){
						                $text += "<tr><td>" + data[i].pa_no + "</td>"
						                      + "<td>" + data[i].pa_pay + "</td>"
						                      + "<td>" + data[i].pdate + "</td>"
						                      + "<td>" + data[i].status + "</td></tr>";
						            }
						        
						            
						            if($text==""){
						            	$('#payData').html("<tr><td>내역이 없습니다.</td></tr>")
						            }else{
						                $('#payData').html($text);
						            }
						        }		
						    });

						}
						</script>
				</div>
			</div>

		</div>

		<input type="hidden" value="${check }" id="check"> <input
			type="hidden" id="search" value="${search }">
	</section>


	<jsp:include page="/WEB-INF/views/expert/hp_upper.jsp" />
<!-- 	<script src="resources/expert/js/point.js"></script> -->

<script>
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
</script>
</body>
</html>