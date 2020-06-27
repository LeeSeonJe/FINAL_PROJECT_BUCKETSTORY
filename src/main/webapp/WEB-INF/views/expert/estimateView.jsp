<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>estimateView</title>
<link rel="stylesheet" href="resources/expert/css/estimate.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>

<section>
	<div id="page">
		<h1 style="text-align:center;">견적서</h1>
		<br><br>
		<br><br>
				<div id="bucketArea">
				   <img src="resources/muploadFiles/${ bkImg.mweb }" id="bkImg">
				
				
				
				<div id="bkContent">
				<br>
					<h1 id="bkName" style="text-align:center;">${ bucket.bkName }</h1>
					<br>
					<p>${ bucket.bkContent }</p>
				</div>
				
				</div>
		<br><br>
		
		<c:if test="${ not empty sessionScope.loginUser }">
			<div id="memberInfo">
				<h2 class="subtitle">요청헬퍼 정보</h2>
				<br>
				<div id="helperProfile" style="border:1px solid black;">
					<c:if test="${ comImg.coid == company.coId }">
						<img src="resources/muploadFiles/${ comImg.mweb }" id="profileImage" >
					</c:if>
					<c:if test="">
						<img src="resources/expert/images/photo.jpg" id="profileImage" >
					</c:if>
						<h3 style="margin-top: 16px;"> ${ company.coName } </h3>
						<div id="coIntro">
							${company.coIntro }
						</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.loginCompany}">
			<div id="memberInfo">
				<h2 class="subtitle">요청회원 정보</h2>
				<br>
				<div id="helperProfile" style="border:1px solid black;">
					<c:if test="${ member.prImage != null }">
						<img src="resources/member/images/profiles/${ member.prImage }" id="profileImage" >
					</c:if>
					<c:if test="${ member.prImage == null }">
						<img src="resources/expert/images/photo.jpg" id="profileImage" >
					</c:if>
						<h1 style="margin-top: 40px;"> ${ member.nickName } </h1>
						<div id="coIntro">
							<table>
								<tr>
									<th class="ppp">성별 :</th>
									<c:if test="${ member.gender == 'M' }">
										<td class="ppp">남자</td>
									</c:if>
									<c:if test="${ member.gender == 'F' }">
										<td class="ppp">여자</td>
									</c:if>
									<td colspan="2" class="ppp"><a href="myBlog.me?nickName=${ member.nickName }&page=1">블로그바로가기</a></td>
								</tr>
								<tr>
									<th class="ppp">생일 : </th>
									<td class="ppp">${member.birth }</td>
									<th class="ppp">경고 : </th>
									<td class="ppp">${member.caution }</td>
								</tr>				
								<tr>
									<th class="ppp">팔로우 : </th>
									<td class="ppp">${ member.fwCount }</td>
									<th class="ppp">연락처</th>
									<td class="ppp" style="width:130px">${ member.phone }</td>
								</tr>
								
							</table>
						</div>
				</div>
			</div>
		</c:if>
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
							<c:if test="${ not empty sessionScope.loginUser }">
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
		</div>
			<c:if test="${ not empty sessionScope.loginUser }">
				<c:if test="${es.status ==1 }">
					<div id="ynbtn">
								<button onclick="sendstatus(3);" style="margin-left: 77px;margin-top: 33px;cursor:pointer">수락</button>
								<button type="button" onclick="sendstatus(4);" style="cursor:pointer">거절</button>
					</div>
				</c:if>
				<c:if test="${es.status ==3 && es.reviewScore == 0 && es.reviewContent == null}">
					<form action="insertReview.ex">	
					<input type="hidden" name="es_no" value="${ es.es_no }">
					<input type="hidden" id="score" name="reviewScore" value="">
					<table id="review">
							<tr>
								<th colspan="3" style="text-align:left;">리뷰작성</th>
							</tr>
							<tr>
								<td style="width: 40px;"><h3 style="float:left;">별점</h3></td>
								<td>
									<p id="star_grade">
								        <a href="#" id="1star" style="font-size: x-large;">★</a>
								        <a href="#" id="2star" style="font-size: x-large;">★</a>
								        <a href="#" id="3star" style="font-size: x-large;">★</a>
								        <a href="#" id="4star" style="font-size: x-large;">★</a>
								        <a href="#" id="5star" style="font-size: x-large;">★</a>
									</p>
								</td>
								<td  style="text-align:right;"><button>리뷰작성</button></td>
							</tr>
							<tr>
								<td colspan="3"><textarea rows="10" cols="113" name="reviewContent"></textarea></td>
							</tr>
						</table>
						</form>
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
			<c:if test="${ sessionScope.loginCompany != null }">
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
						<table id="review">
							<tr>
								<th colspan="3" style="text-align:left;">받은 리뷰</th>
							</tr>
							<tr>
								<td style="width: 40px;"><h3 style="float:left;">별점</h3></td>
								<td>
									<p id="star_grade">
										<c:forEach var="a" begin="1" end="${es.reviewScore }">
											<p style="float:left;color:red;font-size: x-large;">★</p>
										</c:forEach>
										<c:forEach var="a" begin="${es.reviewScore }" end="4">
											<p style="float:left;font-size: x-large;">☆</p>
										</c:forEach>
									</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3"><div id="recontent" style="">${es.reviewContent}</div></td>
							</tr>
						</table>
					</c:if>
			</c:if>
			<br><br>
			<div id="buttonArea" style="text-align:center;">
				<button type="button" onclick="history.go(-1);">뒤로</button>
			</div>
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
						
						$(t).parent().append(optionName);
						$(t).parent().append(optionPrice);
						
						val = currencyFormatter(val);
						$('#price').text(val);
						$('#es_price').val(val)
					}else if($("input:checkbox[name="+name+"]").is(":checked") == false){
						price= price.replace(/,/g,'');
						price=parseInt(price);
						value=parseInt(value);
						var val= price-value; 
						
						val = currencyFormatter(val);
						
						$(t).next().next().remove();
						$(t).next().remove();
						$('#price').text(val);
						$('#es_price').val(val);

					}
				}
				
			</script>
	</div>
	</section>
</body>
</html>