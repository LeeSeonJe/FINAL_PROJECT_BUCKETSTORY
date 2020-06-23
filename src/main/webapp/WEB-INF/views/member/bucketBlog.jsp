<%@page import="org.springframework.http.server.reactive.ContextPathCompositeHandler"%>
<%@page import="com.kh.BucketStory.member.model.vo.MemberMyBucketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	int index = (int) request.getAttribute("index");
	ArrayList<MemberMyBucketList> mbl = (ArrayList<MemberMyBucketList>) request.getAttribute("myBucketList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketBlog.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
		#draggable { width: 150px; height: 150px; padding: 0.5em; }
	</style>
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
					<td onclick="follower(this);" style="cursor: pointer;" >팔로워 <span id="follower">${ followerList.size() }</span></td>
					<td onclick="following(this);" style="cursor: pointer;">팔로잉 ${ followingList.size() }</td>
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
						<c:if test="${ empty myBucketList }">
						</c:if>
						<c:if test="${ !empty myBucketList }">
							<c:forEach items="${ myBucketList }" var="mbl" >
								<tr>
									<td>
										<input type="hidden" class="hidden_BKNO" value="${ mbl.bkNo }"/>
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
						</c:if>
					</tbody>
				</table>
				<div class="pagingBtn-area">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
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
								<c:param name="nickName" value="${ getMember.nickName }"></c:param>
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
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a> &nbsp;
					</c:if>
				</div>
			</div>
			
			<!-- 블로그 리모컨 -->
			<div id="mydiv" style="top: 428px; left: 1400px;">
				<!-- Include a header DIV with the same name as the draggable DIV, followed by "header" -->
				<div id="mydivheader">Bucket Blog</div>
				<table>
					<tr>
						<td colspan="4">
							<br>
							<img id="prev2Btn" src="resources/member/images/prev2.png" alt="" style="width:30px; height: 30px;" onclick="prev2Btn();"/>
							<img id="prevBtn" src="resources/member/images/prev.png" alt="" style="width:30px; height: 30px;" onclick="prevBtn();"/>
							<img id="nextBtn" src="resources/member/images/next.png" alt="" style="width:30px; height: 30px;" onclick="nextBtn();"/>
							<img id="next2Btn" src="resources/member/images/next2.png" alt="" style="width:30px; height: 30px;" onclick="next2Btn();"/>			
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<br>
							<c:if test="${ !empty bList }">
								<input id="goElement" type="text" value="1" style="width: 30px; height: 20px; border: 1px solid gray;"/>&nbsp;/&nbsp;${ bList.size() }&nbsp;<a onclick="goBucket()">이동</a>
							</c:if>
							<c:if test="${ empty bList }">
								<input type="text" value="0" style="width: 30px; height: 20px; border: 1px solid gray;" readonly="readonly"/>&nbsp;/&nbsp;${ bList.size() }&nbsp;<a>이동</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<img src="resources/member/images/top.png" alt="" style="width:20px; height: 20px;"/>
						</td>
						<td>
							<br>
							<img src="resources/member/images/bottom.png" alt="" style="width:20px; height: 20px;"/>						
						</td>
						<td>
							<br>
							<img src="resources/member/images/list.png" alt="" style="width:20px; height: 20px;"/>						
						</td>
					</tr>
					<tr>
						<td>
							<a href="#extra">맨위로</a>
						</td>
						<td>
							<a href="#bottom_scroll">아래로</a>
						</td>
						<td>
							<a href="myBucket.me?nickName=${ nickName }">&nbsp;목록&nbsp;</a>
						</td>
					</tr>
				</table>
				<c:if test="${ !empty bList }">
					<script>
						function prev2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(0).children('input').next().focus();
							$('#goElement').val(1);
						}
						
						function prevBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(go > 1) {
								go--;
								$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
								$('#goElement').val(go);																													
							} else {
								console.log(go)
								prev2Btn();
							}
						}
						
						function nextBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(last > go) {
								go++;
								$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
								$('#goElement').val(go);																													
							} else {
								console.log(go)
								next2Btn();
							}
						}

						function next2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(last)-1).children('input').next().focus();
							$('#goElement').val(last)
						}
						
						function goBucket() {
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
						}
					</script>
				</c:if>			
			</div>
			
			<div id="div-area">
				<c:if test="${ empty myBucketList }">
				</c:if>
				<c:if test="${ !empty myBucketList }">
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
						<script>
							var bucketContent = $('#bucketContent').children()
							var content = $('#bucketContent').children().val()
							bucketContent.text(content.trim());
						</script>
					</div>
					<div id="bucketTag"></div>
					<script>
						var tag = '<%= mbl.get(index).getBucket().getTag() %>'
						var tags = tag.split(',');
						for(var i = 0; i < tags.length; i++) {
							if(tags[i] == "") {
							} else {
								$tagBtn = $('<button class="tagBtn">').text("#" + tags[i])
								$('#bucketTag').append($tagBtn)
							}
						}
					</script>
					<input type="hidden" value="<%= mbl.get(index).getBucket().getBkNo() %>" />
					<c:if test="${ flag eq 'true' }">
						<button id="blogWriteBtn" style="width: 100px;">스토리 작성하기</button>
					</c:if>
				</c:if>
			</div>		
			<c:if test="${ !empty bList }">
				<c:forEach items="${ bList }" var="bl" varStatus="status">
					<!-- 블로그 내용 -->
					<div class="blogBucket">
						<input type="hidden" value="${ bl.bNo }" />
						<input type="text" readonly="readonly" value="${ status.index }" style="width:0px; height:0px; font-size: 0px; border: none;">
						<br><span id="story_index">'${ getMember.nickName }'님의 ${ status.index + 1 }번째 이야기</span>
						<h3>${ bl.bTitle }</h3>
						<div class="profile-area">
							<img src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
							<span>${ getMember.nickName }</span>
							<span style=" margin-left: 70%;">${ bl.enrollDate }</span>
						</div>
						<div>
							${ bl.bContent }
						</div>
						<div class="etc-area">
							<input type="hidden" class="hidden_BKNO" value="${ bl.bNo }"/>
							<c:if test="${ loginUser != null && loginUser.nickName eq getMember.nickName }">
								<button>수정하기</button>
								<button>삭제하기</button>
							</c:if>
							<c:if test="${ loginUser != null && loginUser.nickName ne getMember.nickName }">
								<span style="cursor: pointer;" onclick="boardReport(this);">신고</span>
							</c:if>
						</div>
						<!-- 댓글 쓰기 -->
						<c:if test="${ loginUser != null }">
							<div class="comment">
								<div class="write_comment_profile_area">
									<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
									<span>${ loginUser.nickName }</span>
								</div>
								<div class="write_comment_content">
									<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" style="width: 98%; padding: 7px;"></textarea>
									<div class="write_comment_submit">
										<label><input type="checkbox" name="secret" value="1">비밀댓글 </label>
										<label class="counter">0/300</label>
										<input type="hidden" value="${ bl.bNo }" />
										<button type="button" onclick="comment_btn(this);">등록</button>
									</div>
								</div>
							</div>			
						</c:if>
						<div class="comment_list">
							<c:forEach items="${ bl.boardCommnet }" var="bl_bc">
								<c:set var="bcSum" value="0"/>
								<!-- 댓글 -->
								<c:if test="${ bl_bc.cmNo != 0 && fn:contains(bl_bc.status, 'Y') }">
									<c:set var="bcSum" value="${ bcSum + 1 }"/>
									<div class="comment_profile_area">
										<input type="hidden" value="${ bl_bc.cmNo }" />
										<img src="/BucketStory/resources/member/images/profiles/${ bl_bc.member.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
										<c:if test="${ loginUser.nickName eq bl_bc.member.nickName }">	
											<span>${ bl_bc.member.nickName }</span>
											<span class="commentUpdate" onclick="commentUpdate(this);">수정</span>
											<span class="commentDelete" onclick="commentDelete(this);">삭제</span>
										</c:if>
										<c:if test="${ loginUser.nickName ne bl_bc.member.nickName }">
											<span><a href="myBlog.me?nickName=${ bl_bc.member.nickName }&page=1">${ bl_bc.member.nickName }</a></span>
										</c:if>
										<c:if test="${ bl_bc.member.nickName eq getMember.nickName }">	
											<button type="button">블로그주인</button>
										</c:if>
										<c:if test="${ loginUser.nickName ne bl_bc.member.nickName }">
											<span style="cursor: pointer;" class="comment_Report" onclick="commentReport(this);">신고</span>
										</c:if>
										<span>${ bl_bc.enrollDate }</span>
										<input type="hidden" value="${ bl_bc.userid }" />
									</div>
									
									<!-- 비밀글 여부 -->
									<c:if test="${ bl_bc.secret == 1}">
										<div class="comment_content">
											<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
										</div>
										<div class="comment_submit">
											<c:set var="sum" value="0"/>
											<c:forEach items="${ bl_bc.reply }" var="reply" varStatus="status">
												<c:if test="${ reply.rpNo != 0 && fn:contains(reply.status, 'Y') }">
													<c:set var="sum" value="${ sum + 1 }"/>
												</c:if>
											</c:forEach>
											<c:if test="${ reply.rpNo == 0 }">
												<label>0</label>개의 답글
											</c:if>
											<label>${ sum }</label>개의 답글
											<button type="button" onclick="reply_list_open(this);">답글 쓰기</button> 
										</div>
									</c:if>
									<c:if test="${ bl_bc.secret == 2 }">
										<c:choose>
											<c:when test="${ loginUser.nickName eq bl_bc.member.nickName }">
												<div class="comment_content">
													<img src="/BucketStory/resources/member/images/secret.png" style="width: 23px; height: 23px;" />
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
												</div>
												<div class="comment_submit">
													<c:set var="sum" value="0"/>
													<c:forEach items="${ bl_bc.reply }" var="reply" varStatus="status">
														<c:if test="${ reply.rpNo != 0 && fn:contains(reply.status, 'Y') }">
															<c:set var="sum" value="${ sum + 1 }"/>
														</c:if>
													</c:forEach>
													<c:if test="${ reply.rpNo == 0 }">
														<label>0</label>개의 답글
													</c:if>
													<label>${ sum }</label>개의 답글
													<button type="button" onclick="reply_list_open(this);">답글 쓰기</button>
												</div>
											</c:when>
											<c:when test="${ loginUser.nickName eq getMember.nickName }">
												<div class="comment_content">
													<img src="/BucketStory/resources/member/images/secret.png" style="width: 23px; height: 23px;"/>
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
												</div>
												<div class="comment_submit">
													<c:set var="sum" value="0"/>
													<c:forEach items="${ bl_bc.reply }" var="reply" varStatus="status">
														<c:if test="${ reply.rpNo != 0 && fn:contains(reply.status, 'Y') }">
															<c:set var="sum" value="${ sum + 1 }"/>
														</c:if>
													</c:forEach>
													<c:if test="${ reply.rpNo == 0 }">
														<label>0</label>개의 답글
													</c:if>
													<label>${ sum }</label>개의 답글
													<button type="button" onclick="reply_list_open(this);">답글 쓰기</button>
												</div>
											</c:when>
											<c:otherwise>
												<div class="comment_content">
													<img src="/BucketStory/resources/member/images/secret.png" style="width: 23px; height: 23px; " />
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" style="width: 98%; padding: 7px;" readonly="readonly" >비밀글입니다.</textarea>
												</div>												
											</c:otherwise>
										</c:choose>
									</c:if>
									
									<!-- 답글 -->
									<div class="reply_list" style="display: none;">
										<div class="rList">
										<c:forEach items="${ bl_bc.reply }" var="reply">
											<c:if test="${ reply.rpNo != 0 && fn:contains(reply.status, 'Y') }">
												<div class="reply_profile_area">
													<input type="hidden" value="${ reply.rpNo }" />
													<img src="/BucketStory/resources/member/images/profiles/${ reply.rmember.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
													<c:if test="${ loginUser.nickName eq reply.rmember.nickName }">
														<span>${ reply.rmember.nickName }</span>
														<span class="replyUpdate" onclick="replyUpdate(this)">수정</span>
														<span class="replyDelete" onclick="replyDelete(this)">삭제</span>
													</c:if>
													<c:if test="${ loginUser.nickName ne reply.rmember.nickName }">
														<span><a href="myBucket.me?nickName=${ reply.rmember.nickName }&page=1">${ reply.rmember.nickName }</a></span>
													</c:if>
													<c:if test="${ reply.rmember.nickName eq getMember.nickName }">		
														<button type="button">블로그주인</button>
													</c:if>
													<c:if test="${ loginUser.nickName ne reply.rmember.nickName }">
														<span style="cursor: pointer;" class="reply_Report" onclick="replyReport(this);">신고</span>
													</c:if>
													<span>${ reply.rpDate }</span>
													<input type="hidden" value="${ reply.userid }" />
												</div>
												<div class="reply_content">
													<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" style="width: 98%; padding: 7px;" readonly="readonly">${ reply.rpContent }</textarea>
												</div>					
											</c:if>
										</c:forEach>
										</div>
										<c:if test="${ loginUser != null }">
											<div class="reply">
												<div class="reply_profile_area">
													<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
													<span>${ loginUser.nickName }</span>
												</div>
												<div class="reply_content">
													<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" style="width: 98%; padding: 7px; background: white; border: 1px solid;"></textarea>
													<div class="reply_submit">
														<label class="counter">0/300</label>
														<input type="hidden" value="${ bl_bc.cmNo }" />
														<button type="button" onclick="reply_btn(this);">등록</button>
													</div>
												</div>
											</div>	
										</c:if>
									</div>					
								</c:if>
							</c:forEach>
							<c:if test="${ bl_bc.cmNo == 0 || bcSum == 0}">
								<div class="comment_content">
									등록된 댓글이 없습니다.
								</div>
							</c:if>
						</div>
						<!-- 댓글 부분 -->
					</div>	
				</c:forEach>
			</c:if>
			<c:if test="${ empty bList }">
				<div class="blogBucket">
					<h4>등록된 글이 없습니다.</h4>
					<h4>멋진 내용을 등록해보세요.</h4>
				</div>
			</c:if>
			<div id="bottom_scroll">
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
						<c:if test="${ empty myBucketList }">
						</c:if>
						<c:if test="${ !empty myBucketList }">
							<c:forEach items="${ myBucketList }" var="mbl" >
								<tr>
									<td>
										<input type="hidden" class="hidden_BKNO" value="${ mbl.bkNo }"/>
										<div class="wrap_td">
											<span class="bkName2">${ mbl.bucket.bkName }</span>
										</div>
									</td>
									<td>
										<div class="wrap_td">
											<span class="date2">${ mbl.bucket.enrolldate }</span>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div class="pagingBtn-area2">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
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
								<c:param name="nickName" value="${ getMember.nickName }"></c:param>
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
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a> &nbsp;
					</c:if>
				</div>
			</div>
			
		</section>
	</div>
<script>

	$(function(){
		var length = ${ myBucketList.size() };
		var bkNo = $('#bucketTag').next().next().val();
		for (var i = 0; i < length; i++) {
			if($.trim($('.hidden_BKNO').eq(i).val()) == bkNo) {
				$('.bkName').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
				$('.bkName2').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
			}
		}
		var list_table = $('.bucketList-area>table').hide()
		var list_page = $('.pagingBtn-area').hide();
		
		var bNo = '${ bNo }'
		if(bNo != "") {
			var length = $('.blogBucket').children('input[type=hidden]').length
			for(var i = 0; i < length; i++) {
				if($('.blogBucket').children('input[type=hidden]').eq(i).val() == bNo){
					console.log(i);
					$('.blogBucket').children('input[type=hidden]').eq(i).next().focus();
				}
			}
		}
	})
	
	/* 신고 스크립드 */
	/* 게시물 신고 카테 번호 1번 */
	function boardReport(r) {
		var sinuser = '${ loginUser.userId }';
		var pigouser = '${ getMember.userId }';
		var bno = $(r).prev().val();
		var no_kind = 1;
		console.log(sinuser)
		console.log(pigouser)
		$.ajax({
			url:"report.me",
			data: {
				sinuser:sinuser,
				pigouser:pigouser,
				bno:bno,
				no_kind:no_kind
			}, success: function(data){
				if(data.trim() == 'success') {
					alert("신고처리되었습니다.");
				} else if(data.trim() == 'exist') {
					alert("이미 신고된 내용입니다.");
				} else if(data.trim() == 'fail') {
					alert("실패하였습니다.")
				}
			}
		})	
	}
	
	function commentReport(r) {
		var sinuser = '${ loginUser.userId }';
		var pigouser = $(r).next().next().val();
		var cmno = $(r).prev().prev().prev().val();
		console.log($(r).prev().prev().prev().val())
		var no_kind = 2;
		if(cmno == "") {
			cmno = $(r).prev().prev().prev().prev().val();
		}
		$.ajax({
			url:"report.me",
			data: {
				sinuser:sinuser,
				pigouser:pigouser,
				cmno:cmno,
				no_kind:no_kind
			}, success: function(data){
				if(data.trim() == 'success') {
					alert("신고처리되었습니다.");
				} else if(data.trim() == 'exist') {
					alert("이미 신고된 내용입니다.");
				} else if(data.trim() == 'fail') {
					alert("실패하였습니다.")
				}
			}
		})	
	}
	
	/* 답글 신고 카테 번호 3번 */
	function replyReport(r) {
		var sinuser = '${ loginUser.userId }';
		var pigouser = $(r).next().next().val();
		var rpno = $(r).prev().prev().prev().val();
		var no_kind = 3;
		if(rpno == "") {
			rpno = $(r).prev().prev().prev().prev().val();
		}
		$.ajax({
			url:"report.me",
			data: {
				sinuser:sinuser,
				pigouser:pigouser,
				rpno:rpno,
				no_kind:no_kind
			}, success: function(data){
				if(data.trim() == 'success') {
					alert("신고처리되었습니다.");
				} else if(data.trim() == 'exist') {
					alert("이미 신고된 내용입니다.");
				} else if(data.trim() == 'fail') {
					alert("실패하였습니다.")
				}
			}
		})	
	}
	
	/* 댓글 열기 스크립트 */
	
	function reply_list_open(b) {
		console.log(b)
		console.log($(b))
		if($(b).text().trim() == "답글 쓰기"){
			$(b).parent().next().css('display', 'block');
			$(b).text("답글 닫기");
		} else {
			$(b).parent().next().css('display', 'none');
			$(b).text("답글 쓰기");			
		}
	}
	
	var save1 = "";
	function commentUpdate(u) {
		console.log($(u).prev().prev().prev().val());
		$div = $('<div class="write_comment_submit">');
		$label = $('<label class="counter">0/300</label>');
		$hidden = $('<input type="hidden">').val($(u).prev().prev().prev().val());
		$button = $('<button type="button" onclick="commentUpdate_btn(this);">등록</button>');
		$div.append($label, $hidden, $button);	
			
		if($(u).text().trim() == "수정"){
			save1 = $(u).parent().next().find('textarea').text();
			$(u).parent().next().find('textarea').prop('readonly', false);
			$(u).parent().next().find('textarea').css('background', 'white');
			$(u).text("취소");
			$(u).parent().next().append($div)
		} else if ($(u).text().trim() == "취소"){
			$(u).parent().next().find('textarea').val(save1);
			$(u).parent().next().find('textarea').prop('readonly', true);
			$(u).parent().next().find('textarea').css('background', '#fafafa');
			$(u).text("수정");
			$(u).parent().next().children('div').remove();
		}
	}
	
	function commentUpdate_btn(b) {
		if($(b).parent().prev().val().trim().length == 0){
			alert("내용을 입력해주세요.");
		} else {
			var cmNo = $(b).prev().val();
			var cmContent = $(b).parent().prev().val();
			console.log(cmNo)
			console.log(cmContent)
			$.ajax({
				url: "bCommentUpdate.me",
				type: "POST",
				data: {
					cmNo:cmNo, 
					cmContent:cmContent,
				},
				success: function(data) {
					console.log(data)
					$(b).parent().prev().text(data.cmContent);
					$(b).parent().prev().prop('readonly', true);
					$(b).parent().prev().css('background', '#fafafa');
					$(b).parent().parent().prev().children('span[class=commentUpdate]').html("수정")	;			
					$(b).parent().remove()
				}
			})
		}
	}
	
	var save2 = "";
	function replyUpdate(u) {
		$div = $('<div class="reply_submit">');
		$label = $('<label class="counter">0/300</label>');
		$hidden = $('<input type="hidden">').val($(u).prev().prev().prev().val());
		$button = $('<button type="button" onclick="replyUpdate_btn(this);">등록</button>');
		$div.append($label, $hidden, $button);	
		
		console.log($(u))
		if($(u).text().trim() == "수정"){
			save1 = $(u).parent().next().find('textarea').text();
			$(u).parent().next().find('textarea').prop('readonly', false);
			$(u).parent().next().find('textarea').css('background', 'white');
			$(u).text("취소");
			$(u).parent().next().append($div)
		} else if ($(u).text().trim() == "취소"){
			$(u).parent().next().find('textarea').val(save1);
			$(u).parent().next().find('textarea').prop('readonly', true);
			$(u).parent().next().find('textarea').css('background', '#fafafa');
			$(u).text("수정");
			$(u).parent().next().children('div').remove();
		}
	}
	
	function replyUpdate_btn(b) {
		if($(b).parent().prev().val().trim().length == 0){
			alert("내용을 입력해주세요.");
		} else {
			var rpNo = $(b).prev().val();
			var rpContent = $(b).parent().prev().val();
			console.log(rpNo)
			console.log(rpContent)
			$.ajax({
				url: "replyUpdate.me",
				type: "POST",
				data: {
					rpNo:rpNo, 
					rpContent:rpContent,
				},
				success: function(data) {
					console.log(data)
					$(b).parent().prev().text(data.rpContent);
					$(b).parent().prev().prop('readonly', true);
					$(b).parent().prev().css('background', '#fafafa');
					$(b).parent().parent().prev().children('span[class=replyUpdate]').html("수정")	;			
					$(b).parent().remove()
				}
			})
		}
	}
	
	function commentDelete(d) {
		console.log($(d))
		var result = confirm("댓글을 삭제하시겠습니까?");
		if(result) {
			var cmNo = $(d).prev().prev().prev().prev().val();
			alert("삭제되었습니다.");
			$.ajax({
				url: "commentDelete.me",
				data: {
					cmNo:cmNo
				},
				success: function(data) {
					location.reload();	
				}
			})
		} else {
			
		}
	}
	
	function replyDelete(d) {
		console.log($(d))
		var result = confirm("댓글을 삭제하시겠습니까?");
		if(result) {
			var rpNo = $(d).prev().prev().prev().prev().val();
			alert("삭제되었습니다.");
			$.ajax({
				url: "replyDelete.me",
				data: {
					rpNo:rpNo
				},
				success: function(data) {
					location.reload();	
				}
			})
		} else {
			
		}
	}
	
	/* 글자수 스크립트 */
	function commentCount(t) {
		var content = $(t).val();
		var length = $(t).val().length
		$(t).next().children('label[class=counter]').text(length+"/300");

		if (length > 300){
			alert("최대 300자까지 입력 가능합니다.");
			$(t).val(content.substring(0, 300));
			$(t).next().children('label[class=counter]').html("300/300");
		}
	}
	
	function replyCount(t) {
		var content = $(t).val();
		var length = $(t).val().length
		$(t).next().children('label[class=counter]').html(content.length+"/300");//글자수 실시간 카운팅
		
		if (length > 300){
		    alert("최대 300자까지 입력 가능합니다.");
		    $(t).val(content.substring(0, 300));
		    $(t).next().children('label[class=counter]').html("300/300");
		}
	}
	
	/* 댓글 등록 ajax */
	
	function comment_btn(b) {
		if($(b).parent().prev().val().trim().length == 0){
			alert("내용을 입력해주세요.");
		} else {
			var bNo = $(b).prev().val();
			var cmContent = $(b).parent().prev().val();
			var secret = $('input:checkbox[name=secret]:checked').length + 1;
			$.ajax({
				url: "bCommentInsert.me",
				type: "POST",
				data: {
					bNo:bNo, 
					cmContent:cmContent,
					secret:secret
				},
				success: function(data) {
					location.reload();	
				}
			})
		}
	}
	
	/* 답글 등록 ajax */
	
	function reply_btn(b) {
		if($(b).parent().prev().val().trim().length == 0){
			console.log($(b))
			alert("내용을 입력해주세요.");
		} else {
			var cmNo = $(b).prev().val();
			var rpContent = $(b).parent().prev().val();
			var count = $(b).parent().parent().parent().parent().prev().children('label').text();
			console.log(count)
			$.ajax({
				url: "replyInsert.me",
				dataType: 'json',
				type: "POST",
				data: {
					cmNo:cmNo, 
					rpContent:rpContent
				},
				success: function(data) {
					console.log(data);		
					count++;
					var nickName1 = '${ loginUser.nickName }'
					var nickName2 = '${ getMember.nickName }'
					if(data[data.length-1].status == 'Y') {
						
						if(nickName1 == nickName2) {
							$div = $('<div class="reply_profile_area">');
							$input = $('<input type="hidden">').val(data[data.length-1].rpNo);
							$prImg = $('<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;">');
							$span1 = $('<span>${ loginUser.nickName }</span>');
							$span2 = $('<span class="replyUpdate" onclick="replyUpdate(this)">수정</span>');
							$span3 = $('<span class="replyDelete" onclick="replyDelete(this)">삭제</span>');
							$button = $('<button type="button">블로그주인</button>')
							$span4 = $('<span></span>').text(data[data.length-1].rpDate);
							$div.append($input, $prImg, $span1, $span2, $span3, $button, $span4)
						} else {
							$div = $('<div class="reply_profile_area">');
							$input = $('<input type="hidden">').val(data[data.length-1].rpNo);
							$prImg = $('<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;">');
							$span1 = $('<span>${ loginUser.nickName }</span>');
							$span2 = $('<span class="replyUpdate" onclick="replyUpdate(this)">수정</span>');
							$span3 = $('<span class="replyDelete" onclick="replyDelete(this)">삭제</span>');
							$span4 = $('<span></span>').text(data[data.length-1].rpDate);
							$div.append($input, $prImg, $span1, $span2, $span3, $span4)							
						}
						
						
						$div2 = $('<div class="reply_content">')
						$textarea = $('<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" style="width: 98%; padding: 7px;" readonly="readonly">').text(data[data.length-1].rpContent)
						
						$div2.append($textarea)
						$(b).parent().parent().parent().prev().append($div, $div2);
						$(b).parent().prev().val("");
						$(b).prev().prev().text("0/300");
// 						console.log(count)
						$(b).parent().parent().parent().parent().prev().children('label').text(count);
					}
				}					
			})
		}
	}
	
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
		location.href="myBlog.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
	})
	
	$('span.bkName2').on('click', function(){
		var bkNo = $(this).parent().prev().val();
		var page = ${ pi.currentPage }
		location.href="myBlog.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
	})
	
	$('#blogWriteBtn').on('click', function(){
		var page = ${ pi.currentPage }
		var bkNo = $(this).prev().val();
		location.href="blogWrite.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
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
  	$('#sidewrap').css('top','56px');
	$('nav>a:eq(2)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	
	$('.gnb_menu .gnb_menu_ul li a .text:eq(0)').css('color', '#fff');
	$('.gnb_menu .gnb_menu_ul li a.gnb1').css('background','url("resources/layout/images/bg01_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .ico').css('background', 'url("resources/layout/images/ico01_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .text span').css('color','#fff');

	
	////////////////////////
	// Make the DIV element draggable:
	dragElement(document.getElementById("mydiv"));
	
	function dragElement(elmnt) {
		var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
		if (document.getElementById(elmnt.id + "header")) {
		  // if present, the header is where you move the DIV from:
		  document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
		} else {
		  // otherwise, move the DIV from anywhere inside the DIV:
		  elmnt.onmousedown = dragMouseDown;
		}
	
		function dragMouseDown(e) {
			e = e || window.event;
			e.preventDefault();
			// get the mouse cursor position at startup:
			pos3 = e.clientX;
			pos4 = e.clientY;
			document.onmouseup = closeDragElement;
			// call a function whenever the cursor moves:
			document.onmousemove = elementDrag;
		}
	
		function elementDrag(e) {
			e = e || window.event;
			e.preventDefault();
			// calculate the new cursor position:
			pos1 = pos3 - e.clientX;
			pos2 = pos4 - e.clientY;
			pos3 = e.clientX;
			pos4 = e.clientY;
			// set the element's new position:
			elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
			elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
		}
	
		function closeDragElement() {
			// stop moving when mouse button is released:
			document.onmouseup = null;
			document.onmousemove = null;
		}
	}
</script>
</body>
</html>