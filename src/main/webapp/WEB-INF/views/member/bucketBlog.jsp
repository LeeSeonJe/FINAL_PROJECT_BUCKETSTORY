<%@page import="org.springframework.http.server.reactive.ContextPathCompositeHandler"%>
<%@page import="com.kh.BucketStory.member.model.vo.MemberMyBucketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int index = (int) request.getAttribute("index");
	ArrayList<MemberMyBucketList> mbl = (ArrayList<MemberMyBucketList>) request.getAttribute("myBucketList");
%>
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
					<td>게시물 ${ pi.listCount }</td>
					<td>팔로워 ${ loginUser.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<h2>블로그</h2>
			<div class="bucketList-area"><br>
				<div id="list_header">
					<span>버킷리스트 ${ pi.listCount }개의 글</span>
					<button id="listBtn" onclick="listSH()">목록열기</button>
				</div>
				<br>
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
				<div class="pagingBtn-area">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myBlog.me">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<b>${ p }</b> &nbsp;
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="myBlog.me">
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
						<c:url var="after" value="myBlog.me">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a> &nbsp;
					</c:if>
				</div>
			</div>
			
			<div id="div-area">
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
					<textarea readonly="readonly">
						<%= mbl.get(index).getBucket().getBkContent() %>
					</textarea>
				</div>
				<div id="bucketTag"></div>
				
				<input type="hidden" value="<%= mbl.get(index).getBucket().getBkNo() %>" />
				<button id="blogWriteBtn">작성하기</button>
			</div>		
			<c:if test="${ !empty bList }">
				<c:forEach items="${ bList }" var="bl" varStatus="status">
					<div class="blogBucket">
						<input type="hidden" value="${ bl.bNo }" />
						<h3>${ bl.bTitle }</h3>
						<div>
							${ bl.bContent }
						</div>
						<div class="reply">
							등록된 댓글이 없습니다.
						</div>
					</div>	
				</c:forEach>
			</c:if>
			<c:if test="${ empty bList }">
				<div class="blogBucket">
					<h4>등록된 글이 없습니다.</h4>
					<h4>멋진 내용을 등록해보세요.</h4>
				</div>
			</c:if>
		</section>
	</div>
<script>
	$(function(){
		var length = ${ myBucketList.size() };
		var bucketTitle = $('#bucketTitle').children().text().trim();
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
				$tagBtn = $('<button class="tagBtn">').text("#" + tags[i])
				console.log(tags[i])
				$('#bucketTag').append($tagBtn)
			}
		}
		
		var list_table = $('.bucketList-area>table').hide()
		var list_page = $('.pagingBtn-area').hide();
	})
	
	function listSH() {
		if($('#listBtn').text() == '목록열기'){
			var list_table = $('.bucketList-area>table').show()
			var list_page = $('.pagingBtn-area').show();	
			$('#listBtn').text("목록닫기")
		} else if($('#listBtn').text() == '목록닫기') {
			var list_table = $('.bucketList-area>table').hide()
			var list_page = $('.pagingBtn-area').hide();	
			$('#listBtn').text("목록열기")			
		}
	}
	
	$('span.bkName').on('click', function(){
		var bkNo = $(this).parent().prev().val();
		var page = ${ pi.currentPage }
		location.href="myBlog.me?bkNo=" + bkNo + "&page=" + page;
	})
	
	$('#blogWriteBtn').on('click', function(){
		var page = ${ pi.currentPage }
		var bkNo = $(this).prev().val();
		location.href="blogWrite.me?bkNo=" + bkNo + "&page=" + page;
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