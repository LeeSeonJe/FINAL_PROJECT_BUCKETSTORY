<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/estimateView.css">
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>


	<div id="page">
		<h1 style="text-align:center;">요청 대기중인 견적서</h1>
		<br><br>
		<h3 style="text-align:center;">버킷리스트:${ bucket.bkName }</h3>
		
		<div id="memberInfo">
			<h2 class="subtitle">요청회원 정보</h2>
			<br>
			<table id="helperProfile" style="border:1px solid black;">
				<tr>
					<td rowspan="3" style="width: 185px;"><img src="resources/expert/images/photo.jpg" id="profileImage" ></td>
					<td>닉네임:${ member.nickName } </td>
					<td>견적발송일:${ es.enrollDate }</td>
				</tr>
				<tr>
					<td>성별:${ member.gender }	</td>
					<td></td>
					
				</tr>
				<tr>
					<td>연락처:${ member.phone}</td>
					<td></td>
				</tr>
			</table>
		</div>
		<br><br>
		<div class="subtitle">
			<table id="inputSchedule">
				<tr>
					<td rowspan=2><h2 class="subtitle" style="display:inline;">일정기간</h2></td>
					<td>시작일</td>
					<td>종료일</td>
				</tr>
				<tr>
					<td>${ er.esr_startDate }</td>
					<td>${ er.esr_endDate }</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<div id="subtitle">
			<h2 class="subtitle">견적 요청사항</h2>
			<div id="Precautions">${ er.precautions }</div>
		</div>
		<br>
		<br>
		
	
		<div id="estimate">
		<form id="send" action="updateEstimate.ex" enctype="Multipart/form-data">
			<h2>견적내용</h2>
			<div id="estimateContent">${ es.es_content }</div>
		<input type="hidden" name="es_no" value="${ es.es_no }">
		<input type="hidden" name="es_content" value="${es.es_content }">
		<input type="hidden" name="coId" value="${ es.coId }">
		<input type="hidden" id="es_price" name="es_price" value="">
			
			<table id="costTable">
				<tr>
					<td><h3 style="display:inline;float:left;">견적금액</h3></td>
					<td colspan="3"><b id="price">${ es.es_price }</b>원</td>
				</tr>
				
				<c:forEach var="op" items="${ option }" varStatus="status" >
					<tr class="optionAdd">
						<td>
							<c:if test="${ sessionScope.loginUser.userId == member.userId }">
								<input type="checkbox" id="optionCheck" name="${op[0] }" onclick="totalprice(this,this.value,this.name);" value="${ op[1] }">
							</c:if>
						</td>
						<td>${ op[0] }</td>
						<td></td>
						<td>${ op[1] } 원</td>
						<td></td>
					</tr>
				</c:forEach>
				<c:if test="${ media ne null }">
					<c:forEach var="file" items="${ media }">
						<tr class="fileAdd">
							<td><h3 style="display:inline;float:left;width: 75px;">첨부파일</h3></td>
							<td colspan="3">
								<a href="${ contextPath }/resources/muploadFiles/${ file.mweb }" download="${ file.morigin }">${ file.morigin }</a>
							</td>
							<td></td>
							<!--  <td>x</td>-->
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</form>
			<c:if test="${ sessionScope.loginUser.userId == member.userId }">
				<c:if test="${es.status ==1 }">
					<div id="status">
								<button onclick="sendstatus(3);" style="margin-left: 77px;margin-top: 33px;cursor:pointer">수락</button>
								<button type="button" onclick="sendstatus(4);" style="cursor:pointer">거절</button>
					</div>
				</c:if>
				<c:if test="${es.status ==3 && es.reviewScore == 0 && es.reviewContent == null}">
					<div id="status">
						<h2>리뷰작성</h2>
						<h3 style="float:left;">별점</h3>
						<p id="star_grade">
								        <a href="#" id="1star" style="font-size: x-large;">★</a>
								        <a href="#" id="2star" style="font-size: x-large;">★</a>
								        <a href="#" id="3star" style="font-size: x-large;">★</a>
								        <a href="#" id="4star" style="font-size: x-large;">★</a>
								        <a href="#" id="5star" style="font-size: x-large;">★</a>
						</p>
					<form action="insertReview.ex">						
						<button style="float:right;">리뷰작성</button>
						<input type="hidden" name="es_no" value="${ es.es_no }">
						<input type="hidden" id="score" name="reviewScore" value="">
						<textarea rows="10" cols="70" name="reviewContent"></textarea>
					</form>
					</div>
				</c:if>
				<c:if test="${es.status ==3 && (es.reviewScore != 0 || es.reviewContent != null)}">
					<div id="status">
						<h2>작성한 리뷰</h2>
						<h3 style="float:left;">별점</h3>
						<p id="star_grade">
							<c:forEach var="a" begin="1" end="${es.reviewScore }">
								<p style="float:left;color:red;font-size: x-large;margin-top: 12px;">★</p>
							</c:forEach>
							<c:forEach var="a" begin="${es.reviewScore }" end="4">
								<p style="float:left;font-size: x-large;margin-top: 12px;">☆</p>
							</c:forEach>
						</p>
						<div id="recontent" style="">${es.reviewContent}</div>
					</div>
				</c:if>
			</c:if>
			<c:if test="${ sessionScope.loginUser.userId != member.userId }">
				<c:if test="${ es.status == 1 }">
					<div id="status">
							<h3 style="text-align:center;color:green;">승낙 대기중입니다.</h3>
					</div>
				</c:if>
					<c:if test="${ es.status == 3 && es.reviewScore ==0}">
						<div id="status">
								<h3 style="text-align:center;color:green;">상대방의 리뷰를 기다리고 있습니다.</h3>
						</div>
					</c:if>
					<c:if test="${ es.status == 3 && es.reviewScore !=0}">
						<div id="status">
						<h2>받은 리뷰</h2>
						<h3 style="float:left;">별점</h3>
						<p id="star_grade">
							<c:forEach var="a" begin="1" end="${es.reviewScore }">
								<p style="float:left;color:red;font-size: x-large;margin-top: 12px;">★</p>
							</c:forEach>
							<c:forEach var="a" begin="${es.reviewScore }" end="4">
								<p style="float:left;font-size: x-large;margin-top: 12px;">☆</p>
							</c:forEach>
						</p>
						<div id="recontent" style="">${es.reviewContent}</div>
						</div>
					</c:if>
			</c:if>
			<script>
			function sendstatus(val){
				if(val ==3){
					if (confirm("견적서를 수락하시겠습니까?") == true){    //확인
						var input = $("<input>") .attr("type", "hidden") .attr("name", "status").val(val); 
						$('#send').append($(input));
						$('#send').submit();
					}else{
						return false;
					}
				}else if(val==4){
						if(confirm("해당 견적을 거절하시겠습니까?") == true){
							var input = $("<input>") .attr("type", "hidden") .attr("name", "status").val(val); 
							$('#send').append($(input));
							$('#send').submit();
						}else{
							return false;
						}
					}

				}

			$('#star_grade a').click(function(){
	            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	            return false;
	        });
	        
	        $('#1star').click(function(){
	        	$('#score').val(1);
	        	$('[name:reviewScore]').val(1);
	        });
	        $('#2star').click(function(){
	        	$('#score').val(2);
	        	$('[name:reviewScore]').val(2);
	        });
	        $('#3star').click(function(){
	        	$('#score').val(3);
	        });
	        $('#4star').click(function(){
	        	$('#score').val(4);
	        });
	        $('#5star').click(function(){
	        	$('#score').val(5);
	        });
				
				jQuery(document).ready(function($){
					$('#cost').on('focus',function(){
						var val =$('#cost').val();
						if(!isEmpty(val)){
							val= val.replace(/,/g,'');
							$('#cost').val(val);
						}
					});
					
					$('#cost').on('blur',function(){
						var val=$('#cost').val();
						if(!isEmpty(val)&& isNumeric(val)){
							val= currencyFormatter(val);
							$('#cost').val(val);
						}
					});
				});
				
				//NULL check
				function isEmpty(value){
					if(value.length == 0 || value==null){
						return true;
					}else{
						return false;
					}
				}
				
				function isNumeric(value){
					var regExp =/^[0-9]+$/g;
					return regExp.test(value);
				}
				function currencyFormatter(amount){
					return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
				}
				
				function totalprice(t,value,name){
					var price = $('#price').text()
					
					if($("input:checkbox[name="+name+"]").is(":checked") == true) {
						price= price.replace(/,/g,'');
						price=parseInt(price);
						value=parseInt(value);
						
						var val= price+value; 
						var optionName = $("<input>") .attr("type", "hidden") .attr("name", "optionName").val(name); 
						var optionPrice = $("<input>") .attr("type", "hidden") .attr("name", "optionPrice").val(value); 
						
						console.log(t);
						console.log($(t));
						$(t).parent().append(optionName);
						$(t).parent().append(optionPrice);
						
						val = currencyFormatter(val);
						$('#price').text(val);
						$('#es_price').val(val)
					}else{
						price= price.replace(/,/g,'');
						price=parseInt(price);
						value=parseInt(value);
						var val= price-value; 
						
						val = currencyFormatter(val);
						
						$(t).next().next().remove();
						$(t).next().remove();
						console.log($(t).next());
						$('#price').text(val);
						$('#es_price').val(val);

					}
				}
				
			</script>
		</div>		
	</div>
</body>
</html>