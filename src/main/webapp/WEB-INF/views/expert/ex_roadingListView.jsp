<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_getRequest.css">
<meta charset="EUC-KR">
<title>ex_roadingListView</title>
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
				<li><h3 style="display: inline;">대기중&nbsp</h3></li>
				<li><a href="completeRequestView.ex">완료요청</a></li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">견적서를 기다리는 버킷리스트</h2>		
		
		<c:if test="${ not empty estimate }">
			<c:forEach var="request" items="${ estimate }" >
				<div id="requestMember">
					<table style="width: 780px;">
						<tr>
							<td rowspan="3" style="width:100px;">
								<c:if test="${m.get(request.userId).prImage == null }">
									<img id="requestImage" src="resources/expert/images/photo.jpg" id="profileImage">
								</c:if>
								<c:if test="${m.get(request.userId).prImage !=null }">
									<img id="requestImage" src="resources/member/images/profiles/${m.get(request.userId).prImage }" id="profileImage">
								</c:if>
							</td>
							<td>
								<h3 style="display:inline">${ m.get(request.userId).nickName }</h3>
							</td>
							<td>
								요청일 : ${ request.enrollDate }
							</td>
						</tr>
						<tr>
							<td>
								버킷리스트:${ bucket.get(request.bkNo).bkName }
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<div id="bucketListDetail"><a href="estimateView.ex?es_no=${ request.es_no }">견적서 확인</a></div>
							</td>
							<td>
								<h3 style="text-align:center; color:green">수락 대기</h3>
							</td>
							
						</tr>
					</table>
				</div>
				<hr style="width:840px;margin: auto;">
			</c:forEach>
		</c:if>
		<c:if test="${ empty estimate }">
			<h2 style="text-align:center">수락대기중인 견적서가 없습니다.</h2>
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
						<c:url var="before" value="roadingRequestView.ex">
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
							<c:url var="pagination" value="roadingRequestView.ex">
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
						<c:url var="after" value="roadingRequestView.ex">
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
			var page = 2;
			
			$('#ListArea').on("click",function(){
				$.ajax({
					url:'estimateAdd.ex',
					data:{page:page , status:1},
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
								+"<td rowspan='3' style='width:100px;'>"
								if(m[er[i].userId].prImage != null){
								text += "<img id='requestImage' src='resources/member/images/profiles/"+m[er[i].userId].prImage+"' id='profileImage'>"
								}else{
								text += "<img id='requestImage' src='resources/expert/images/photo.jpg' id='profileImage'>"
								}
									text += "</td>"
										+"<td>"
										 +"<h3 style='display:inline'>"+m[er[i].userId].nickName+"</h3>"
								   		+"</td>"
								   		+"<td>요청일 : "+er[i].enrollDate+"<td>"
								   	+"</tr>"
								   	+"<tr>"
								   		+"<td>"
										   +"버킷리스트: "+bucket[er[i].bkNo].bkName+"</td>"
										 +"<td>"
										 +"</td>"
									+"</tr>"
									+"<tr>"
										 +"<td>"
										 	+"<div id='bucketListDetail'>"
										 		+"<div id='bucketListDetail'><a href='estimateView.ex?es_no="+er[i].es_no+"'>견적서확인</a>"	
										 	+"</div>"
										 +"</td>"
										 +"<td>"
										 	+"<h3 style='text-align:center; color:green'>수락 대기</h3>"
										 +"</td>"
									+"</tr>"
							+"</table>"
							+"</div>"
						    +"<hr style='width:840px;margin: auto;' class='line'>"
							}
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