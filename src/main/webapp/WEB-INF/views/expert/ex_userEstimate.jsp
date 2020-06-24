<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.BucketStory.expert.model.vo.Estimate"%>
<%@page import="com.kh.BucketStory.bucket.model.vo.BucketList"%>
<%@page import="java.io.File, java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_userEstimate.css">
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>	
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
		<div id="Myheader">
			<table id="table_area">
				<tr>
					<td rowspan="4" style="width: 250px;">
						<img id="profileImg" src="resources/member/images/profiles/123.jpg" alt="프로필 사진" />					
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">Seonxi_l</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">이선제</td>
				</tr>
				<tr>
					<td>게시물수 199</td>
					<td>팔로워 40</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<div id="page" >
				
				<h1 style="text-align:center;">견적서가 도착했어요</h1>
				
				<div id="statusView">
					<div id="status1" class="status" onclick="position(1);">받은 견적서 확인</div>
					<div id="status3" class="status" onclick="position(3);">수락 견적서 확인</div>
				</div>
				<div id="area">
				</div>
				
				<script>
					$(function(){
						$('#status1').trigger("click");
					});
					function position(index){
						if(index == 1){
							$('#status1').css("background","lightgreen");
							$('#status3').css("background","lightgrey");
						}else{
							$('#status3').css("background","lightgreen");
							$('#status1').css("background","lightgrey");
						}
						$.ajax({
							url:"myEstimate.ex",
							data:{
								status:index
								},
							dataType: 'json',
							success : function(data){
								console.log(data);
								console.log(data.list);
								console.log(data.bucket[3]);
								var text;
								if(data.list.length >0){
									$('#area').html("");
									for( var i in data.list)
										 text +=
											"<div id='requestMember'>"
											+"<table style='width: 780px;''>"
											+"<tr>"
											+"<td rowspan='3' style='width:100px;''>"
											+"<img id='requestImage' src='resources/expert/images/photo.jpg' id='profileImage'>"
											+"</td>"
											+"<td>"
												+"<h3 style='display:inline'>"+data.list[i].coId+"</h3>"
											+"</td>"
											+"<td>"
												+data.list[i].enrollDate
											+"</td>"
											+"</tr>"
											+"<tr>"
												+"<td>"
															+"버킷리스트 : "+data.bucket[data.list[i].bkNo]
												+"</td>"
												+"<td>"
												+"</td>"
											+"</tr>"
											+"<tr>"
												+"<td>"
													+"<div id='bucketListDetail'><a href='estimateView.ex?es_no="+data.list[i].es_no+"'>견적서 확인하기</a></div>"
												+"</td>"
											+"</tr>"
										+"</table>"
									+"</div>"
									+"<hr style='width:840px;margin: auto;'>"
								}else{
									text = "<h1 style='text-align:center;'>받은 견적서가 없습니다.</h1>";
								}
								
								$('#area').html(text); 
							},error:function(data){
								console.log("오류");
								console.log(data);
							}
						})
					}
				</script>
		</div>
		</section>
	</div>
</body>
</html>