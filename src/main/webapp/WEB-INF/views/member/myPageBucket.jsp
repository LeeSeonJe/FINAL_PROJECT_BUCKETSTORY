<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.BucketStory.bucket.model.vo.BucketList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/myPageBucket.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<!-- 			<div id="follower-area" class="followList">팔로워</div> -->
<!-- 			<div id="following-area" class="followList">팔로잉</div> -->
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<c:if test="${ empty myBucketList }">
				<div>등록된 버킷이 없습니다.</div>
			</c:if>
			<c:if test="${ !empty myBucketList }">
				<c:forEach var="b" items="${ myBucketList }" varStatus="status">
					<div class="bucket">
					<script>
						$('.bucket').eq(${ status.index }).css('background-image', 'url(resources/muploadFiles/${ b.media.mweb })');
					</script>
						<div class="bucketContent">
							<div class="c-category">${ b.cateName }</div>
							<div class="c-bucket">
								<div class="c-bucket-1">${ b.bucket.bkName }</div>
							</div>
							<div class="c-Add">
								<div class="c-addBtn"> + ADD</div>
							</div>
							<div class="c-likewish">
								<div class="c-likeBtn"><span class="likehover" style="font-size:20px">♡ </span>좋아요</div>
								<div class="c-wishBtn"><span class="wishhover" style="font-size:20px">☆ </span>위시 등록</div>
							</div>
						</div>
					</div>			
				</c:forEach>
			</c:if>
			<c:if test="${ flag eq 'true' }">
				<div id="bucketAddBtn"></div>
			</c:if>
			<c:if test="${ flag eq 'false' }">
			</c:if>
		</section>
<%-- 		${ followerList } --%>
<%-- 		${ followingList } --%>
	</div>
</body>
<script>	
// 	var isPopup = false;
	
// 	$(function(){
// 		$('#follower-area').hide();
// 		$('#following-area').hide();
// 	})
// 	function follower(f) {
// 		$('#follower-area').toggle();
// 		isPopup = true;
// 	}
	
// 	function following(f) {
// 		$('#following-area').toggle();
// 		isPopup = true;	
// 	}
	
// 	$(".follow-td").on("mouseleave", function(){
// 		if(!isPopup){
// 			$('#follower-area').hide();
// 			$('#following-area').hide();			
// 		}
// 	})
	
	$(".followList").on("mouseenter", function(){
		event.stopPropagation();
  		event.preventDefault();
	})
	
	$(".followList").on("mouseleave", function(){
		event.stopPropagation();
  		event.preventDefault();
  		$('#follower-area').hide();
		$('#following-area').hide();
  		isPopup=false;
	})
	
	function follow(f) {
		var following = '${ loginUser.userId }';
		var follower = '${ getMember.userId }';
		var followCount = $('#follower').text();
		$.ajax({
			url: "follow.me",
			data: {
				following:following,
				follower:follower
			}, success: function(data) {
				$(f).text("팔로우 취소");
				$(f).attr("id", "unFollowBtn");
				$(f).attr("onclick", "unfollow(this);")
				$('#follower').text(parseInt(followCount)+1);
			}
		})
	}
	
	function unfollow(f) {
		var following = '${ loginUser.userId }';
		var follower = '${ getMember.userId }';
		var followCount = $('#follower').text();
		$.ajax({
			url: "unfollow.me",
			data: {
				following:following,
				follower:follower
			}, success: function(data) {
				$(f).text("팔로우");
				$(f).attr("id", "followBtn");
				$(f).attr("onclick", "follow(this);")
				$('#follower').text(followCount-1);
			}
		})
	}
	
	$('#bucketAddBtn').on('click', function(){
		location.href="bucketWrite.me?nickName=${ getMember.nickName }";
	});
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','60.3px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	
	
	
</script>
</html>