<%@page import="org.springframework.http.server.reactive.ContextPathCompositeHandler"%>
<%@page import="com.kh.BucketStory.member.model.vo.MemberMyBucketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketBlog.css">
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
					<td>게시물수 199</td>
					<td>팔로워 ${ loginUser.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<h2>블로그</h2>
			<div id="bucketList-area">
				<table>
					<thead>
						<tr>
							<th>
								<div class="wrap_td">
									<span>글 제목</span>
									<i class="cline"></i>
								</div>
							</th>
							<th>
								<div class="wrap_td">
									<span>작성일</span>
									<i class="cline"></i>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ myBucketList }" var="mbl" >
							<tr>
								<td>
									<input type="hidden" value="${ mbl.bkNo }"/>
									<div class="wrap_td">
										<span class="bkName">${ mbl.bucket.bkName }</span>
									</div>
								</td>
								<td>
									<div class="wrap_td">
										<span class="date">${ mbl.bucket.enrolldate }</span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="div-area">
				<%
					int index = (int) request.getAttribute("index");
					ArrayList<MemberMyBucketList> mbl = (ArrayList<MemberMyBucketList>) request.getAttribute("myBucketList");
				%>
				<div id="bucketTitle">
					<h3>
						<%= mbl.get(index).getBucket().getBkName() %>
					</h3>
				</div>
				<br>
				<div id="bucketImg">
					<img style="max-width: 600px; max-height: 337.5;" src="/BucketStory/resources/muploadFiles/<%= mbl.get(index).getMedia().getMweb() %>" alt="" />
				</div>
				<br>
				<div id="bucketContent">
					<textarea>
						<%= mbl.get(index).getBucket().getBkContent() %>
					</textarea>
				</div>
				<div id="bucketTag"></div>
				
				<input type="hidden" value="<%= mbl.get(index).getBucket().getBkNo() %>" />
				<button id="blogWriteBtn">작성하기</button>
			</div>			
		</section>
	</div>
<script>
	$(function(){
		var length = ${ myBucketList.size() };
		var bucketTitle = $('#bucketTitle').children().val().trim();
		for (var i = 0; i < length; i++) {
			if($('.bkName').eq(i).text().trim() == bucketTitle) {
				$('.bkName').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
			}
		}
		
		var bucketContent = $('#bucketContent').children()
		var content = $('#bucketContent').children().val()
		bucketContent.text(content.trim());
		
		var tag = '<%= mbl.get(index).getBucket().getTag() %>'
		var tags = tag.split(',');
		for(var i = 0; i < tags.length; i++) {
			if(tags[i] == "") {
			} else {
				$tagBtn = $('<button>').text("#" + tags[i])
				console.log(tags[i])
				$('#bucketTag').append($tagBtn)
			}
		}
	})
	$('span.bkName').on('click', function(){
		var bkNo = $(this).parent().prev().val();
		location.href="myBlog.me?bkNo=" + bkNo;
	})
	
	$('#blogWriteBtn').on('click', function(){
		var bkNo = $(this).prev().val();
		location.href="blogWrite.me?bkNo=" + bkNo;
	})
	
	$(function(){
		$('#img_area').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		$('#img_area>img').attr('src', "resources/main/images/loginback.jpg");
		$('#img_area>img').css('width', '100%');
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#img_area>img').css('width', 'auto');
				$('#img_area>img').attr('src', e.target.result);  
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#imgInput").change(function(){
		readURL(this);
	});
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','60.3px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
</script>
</body>
</html>