<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_completeRequest.css">
		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="EUC-KR">
<title>ex_completeRequest</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
<section>
	<div id="page">
		<div id="submenu" style="position: fixed;">
			<ul>
				<li><a href="getRequest.ex">받은요청 &nbsp</a></li>
				<li><a href="makingRequestView.ex">작성중 &nbsp</a></li>
				<li><a href="roadingRequestView.ex">대기중 &nbsp</a></li>
				<li><h3 style="display: inline;">완료요청</h3></li>
							
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">매칭완료 견적서 화면 입니다.</h2>		
		
		<c:if test="${ not empty es }">
		<c:forEach var="estimate" items="${ es }">
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="4" style="width:100px;">
						<c:if test="${ m.get(estimate.userId).prImage == null }">
									<img id="requestImage" src="resources/expert/images/photo.jpg" id="profileImage">
								</c:if>
								<c:if test="${ m.get(estimate.userId).prImage != null }">
									<img id="requestImage" src="resources/member/images/profiles/${m.get(estimate.userId).prImage }" id="profileImage">
								</c:if>
					</td>
					<td rowspan="2">
						<h3 style="display:inline">${ m.get(estimate.userId).nickName }</h3>
					</td>
					<td>
						요청일 ${estimate.enrollDate }
					</td>
				</tr>
				<tr>
					<td>
					</td>
				</tr>
				<tr>
					<td><h5 style="display:inline;">버킷리스트: ${ bucket.get(estimate.bkNo).bkName }</h5></td>
					<c:if test="${estimate.reviewScore ==0 }">
						<td style="width: 183px;" rowspan="2">
							<h3 style="color:red;">리뷰기다리는중</h3>
						</td>
					</c:if>
					<c:if test="${estimate.reviewScore !=0 }">
						<td style="width: 183px;">
							<h3 style="display: inline;float: left;margin-top: 7px;">별점:</h3>
							<p id="star_grade">
							<c:forEach var="a" begin="1" end="${estimate.reviewScore }">
								<p style="float:left;color:red;font-size: x-large;">★</p>
							</c:forEach>
							<c:forEach var="a" begin="${estimate.reviewScore }" end="4">
								<p style="float:left;font-size: x-large;">☆</p>
							</c:forEach>
							</p>
						</td>
					</c:if>
				</tr>
				<tr>
					<td><h3 style="display:inline;">총 견적 비용: ${ estimate.es_price } 원</h3></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="bucketListDetail" onclick="location.href='estimateView.ex?es_no=${estimate.es_no}'">견적서 확인</div>
					</td>
					<td>
						<div id="delete" style="cursor:pointer;"onclick="del(${estimate.es_no});">삭제</div>
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:840px;margin: auto;">
		</c:forEach>
		</c:if>
		<c:if test="${ empty es }">
			<h2 style="text-align:center">완료된 견적이 없습니다.</h2>
		</c:if>
		</div>
		<%-- <table style="margin: auto;">
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="completeRequestView.ex">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="completeRequestView.ex">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="completeRequestView.ex">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table> --%>
		
		<br><br>
		<div id="ListAdd">
			<div id="ListArea">
				<img style="width: 100px;height: 97px;" src="resources/expert/images/더보기.png">
			</div>
		</div>
		<br><br>
		
		<script>
			function del(val){
				if(confirm("해당 요청을 정말 삭제하겠습니까?") == true){
					location.href='deleteEstimate.ex?es_no='+val;
				}else{
					return false;
				}
			}
			
			
			var page = 2;
			
			$('#ListArea').on("click",function(){
				$.ajax({
					url:'estimateAdd.ex',
					data:{page:page , status:3},
					dataType:'json',
					success(data){
						
						
						var bucket = data.bucket;
						var pi = data.pi;
						page = pi.currentPage +1;
						var er = data.er;
						var m = data.m;
						var div = $('#page')
						var text ="";
						if(er.length >0){
							for(var i =0; i<er.length;i++){
							text+="<div id='requestMember'>"
								+"<table style='width: 780px;'>"
								+"<tr>"
								+"<td rowspan='4' style='width:100px;'>"
								if(er[i].userId == m[er[i].userId].userId){
								text += "<img id='requestImage' src='resources/member/images/profiles/"+m[er[i].userId].prImage+"' id='profileImage'>"
								}else{
								text += "<img id='requestImage' src='resources/expert/images/photo.jpg' id='profileImage'>"
								}
									text += "</td>"
										+"<td rowspan='2'>"
										 +"<h3 style='display:inline'>"+m[er[i].userId].nickName+"</h3>"
								   		+"</td>"
								   		+"<td>요청일 : "+er[i].enrollDate+"<td>"
								   	+"</tr>"
								   	+"<tr>"
								   		+"<td></td>"
								   	+"</tr>"
								   	+"<tr>"
								   		+"<td>"
										   +"<h5 style='display:inline;'>버킷리스트: "+bucket[er[i].bkNo].bkName+"</h5></td>"
										   
									if(er[i].reviewScore == 0){
									   text +="<td style='widt:183px;'>"
												+"<h3 style='color:red;'>리뷰기다리는중</h3>"
											+"</td>"
										 
									 		
									}else if(er[i].reviewScore != 0){
									text +="<td style='width: 183px;'>"
										+"<h3 style='display: inline;float: left;margin-top: 7px;'>별점:</h3>"
										+"<p id='star_grade'>"	
											 for(var j=0;j<er[i].reviewScore;j++){
												text += "<p style='float:left;color:red;font-size: x-large;'>★</p>"
												}
											for(var j=er[i].reviewScore; j < 5 ; j++){
												text += "<p style='float:left;font-size: x-large;'>☆</p>"
												}
										text +="</p>"
											+"</td>"
										 } 
										 console.log(text)
								text +="</tr>"
									+"<tr>"
									 	+"<td><h3 style='display:inline;'>총 견적 비용: "+er[i].es_price+"원</h3></td>"
									 	+"<td></td>"
									 +"</tr>"
									 +"<tr>"
									 	+"<td></td>"
									 	+"<td>"
										 	+"<div id='bucketListDetail'><a href='estimateView.ex?es_no="+er[i].es_no+"'>견적서 확인</a></div>"	
										+"</td>"
										+"<td>"
											+"<div id='delete' style='cursor:pointer;' onclick='del("+er[i].es_no+");'>삭제</div>"
										+"</td>"
									+"</tr>"
							+"</table>"
							+"</div>"
						    +"<hr style='width:840px;margin: auto;' class='line'>"
							}
							console.log(text);
							div.append(text);
						}else{
							$('#ListArea').attr("display","none");
		                    $('#ListAdd').html("<h3 style='text-align:center'>더 불러올 목록이 없습니다</h3>");
						}
					}
				})
				})
		</script>
</section>
</body>
</html>