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
						<img id="profileImg" src="/BucketStory/resources/member/images/${ loginUser.prImage }" />
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">${ loginUser.nickName }</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ loginUser.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ myBucketList.size() }</td>
					<td>팔로워 ${ loginUser.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
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
			<div id="bucketAddBtn"></div>
		</section>
	</div>
</body>
<script>	
	$('#bucketAddBtn').on('click', function(){
		location.href="bucketWrite.me";
	});
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','60.3px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
</script>
</html>