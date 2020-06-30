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
<title>ex_userEstimate</title>
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
					<td id="profile_td" rowspan="4" style="width: 250px;">
						<c:if test="${ loginUser != null && getMember.userId eq loginUser.userId }">
							<i class="fa fa-cog" aria-hidden="true" style="display: none;"></i>
						<script type="text/javascript">
// 							$('#profile_td').mouseenter(function(){
// 								$('i.fa.fa-cog').css('display','block');
// 								$(this).find('img').css('cursor','pointer').css('border','2px solid')
// 								$(this).on('click',function(){
// 								    var url = "profileChangeGo.me";
// 						            var name = "profile change popup";
// 						            var option = "width = 400, height = 500, top = 100, left = 200, location = no"
// 						            window.open(url, name, option);
// 								})
// 							})
							
// 							$('#profile_td').mouseleave(function(){
// 								$('i.fa.fa-cog').css('display','none');
// 								$(this).find('img').css('cursor','pointer').css('border','none')
// 							})
						</script>
						</c:if>
						<c:if test="${ getMember.prImage == null }">
							<img id="profileImg" src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" />					
						</c:if>
						<c:if test="${ getMember.prImage != null }">
							<img id="profileImg" src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" />					
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 30px;">${ getMember.nickName }</td>
					<td>
						<c:if test="${ loginUser != null && getMember.userId ne loginUser.userId}">
							<c:if test="${ followCheck == 1 }">
								<button type="button" id="unFollowBtn" onclick="unfollow(this);">팔로우 취소</button>
							</c:if>
							<c:if test="${ followCheck == 0 }">
								<button type="button" id="followBtn" onclick="follow(this);">팔로우</button>
							</c:if>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ getMember.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ list }</td>
					<td class="follow-td" onclick="follower(this);" style="cursor: pointer;" >팔로워 <span id="follower">${ followerList.size() }</span></td>
					<td class="follow-td" onclick="following(this);" style="cursor: pointer;">팔로잉 ${ followingList.size() }</td>
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

						$('#overlay').css('top','-2px');
					  	$('#sidewrap').css('top','56px');
						$('nav>a:eq(3)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
						
						$('.gnb_menu .gnb_menu_ul li a .text:eq(0)').css('color', '#fff');
						$('.gnb_menu .gnb_menu_ul li a.gnb1').css('background','url("resources/layout/images/bg01_on.jpg") no-repeat 0 center #f3f3f2');
						$('.gnb_menu .gnb_menu_ul li a.gnb1 .ico').css('background', 'url("resources/layout/images/ico01_on.png") no-repeat 0 0');
						$('.gnb_menu .gnb_menu_ul li a.gnb1 .text span').css('color','#fff');
						$('#status1').trigger("click");
					});
					function position(index){
						if(index == 1){
							$('#status1').css("background","lightgreen");
							$('#status3').css("background","lightgrey");
							$('#area').css({"background":"#f5f5f5","border":"0.5px solid gray"});
						}else{
							$('#status3').css("background","lightgreen");
							$('#status1').css("background","lightgrey");
							$('#area').css({"background":"#e8eef3","border":"0.5px solid gray"});
						}
						$.ajax({
							url:"myEstimate.ex",
							data:{
								status:index
								},
							dataType: 'json',
							success : function(data){
								console.log(data.list.length)
								var text ="";
								
								$('#area').html("  ");
								
								if(data.list.length >0){
									console.log(data.prImg)
									console.log(data.prImg)
									for( var i in data.list){
										
										 text +="<div id='requestMember'>"
											+"<table style='width: 780px;''>"
											+"<tr>"
											+"<td rowspan='3' style='width:100px;''>"
											if(data.prImg[data.list[i].coId] != null){
												text += "<img id='requestImage' src='resources/muploadFiles/"+data.prImg[data.list[i].coId].mweb+"' id='profileImage'>"
											}else{
												text += "<img id='requestImage' src='resources/expert/images/photo.jpg' id='profileImage'>"
											}
											text += "</td>"
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
												if(data.list[i].status == 1){
													text += "<div id='bucketListDetail'><a href='estimateView.ex?es_no="+data.list[i].es_no+"'>견적서 확인하기</a></div></td>"
												}else{
													if(data.list[i].status == 3 && data.list[i].reviewScore == 0){
														text += "<div id='bucketListDetail'><a href='estimateView.ex?es_no="+data.list[i].es_no+"'>리뷰작성하기</a></div></td>"
													}else{
														text += "<div id='reviewScore'>평점("+data.list[i].reviewScore+")<br> 리뷰내용:  "+data.list[i].reviewContent+"</div></td>"
																+"<td><a href='estimateView.ex?es_no="+data.list[i].es_no+"'>견적서 확인</a></td>"
													}
												}
											
												text +="</td>"
											text +="</tr>"
										+"</table>"
									+"</div>"
									+"<hr style='width:840px;margin: auto;'>"
									+"<br>"
								}
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