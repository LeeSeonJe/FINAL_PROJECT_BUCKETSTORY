<%@page import="com.kh.BucketStory.common.model.vo.Member"%>
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
	Member user = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketBlog.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
					<td id="follower-td" style="cursor: pointer;" >팔로워 <span id="follower">${ followerList.size() }</span></td>
					<td id="following-td" style="cursor: pointer;">팔로잉 ${ followingList.size() }</td>
				</tr>
			</table>
		</div>
		<div id="follower-area">
			<c:forEach items="${ followerList }" var="fwl" varStatus="status">
				<div>
					<c:if test="${ empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/basicProfile.jpg" alt="" />
					</c:if>
					<c:if test="${ !empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/${ fwl.member.prImage }" alt="" />
					</c:if>
					<span onclick="location.href='myBucket.me?nickName=${ fwl.member.nickName }'">${ fwl.member.nickName }</span>
				</div>
				<br>
			</c:forEach>
		</div>
		<div id="following-area">
			<c:forEach items="${ followingList }" var="fwl" varStatus="status">
				<div>
					<c:if test="${ empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/basicProfile.jpg" alt="" />
					</c:if>
					<c:if test="${ !empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/${ fwl.member.prImage }" alt="" />
					</c:if>
					<span onclick="location.href='myBucket.me?nickName=${ fwl.member.nickName }'">${ fwl.member.nickName }</span>
				</div>
				<br>
			</c:forEach>
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
						<c:if test="${ not empty myBucketList }">
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
							<c:if test="${ not empty bList }">
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
				<c:if test="${ not empty bList }">
					<script>
						function prev2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(0).children('div').eq(0).children('input').focus();
							$('#goElement').val(1);
						}
						
						function prevBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(go > 1) {
								go--;
								$('.blogBucket').eq(parseInt(go)-1).children('div').eq(0).children('input').focus();
								$('#goElement').val(go);																													
							} else {
								console.log(go)
								prev2Btn();
							}
						}
						
						function nextBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(last > parseInt(go)) {
								go++;
								$('.blogBucket').eq(parseInt(go)-1).children('div').eq(0).children('input').focus();
								$('#goElement').val(go);																													
							} else {
								next2Btn();
							}
						}

						function next2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(last)-1).children('div').eq(0).children('input').focus();
							$('#goElement').val(last)
						}
						
						function goBucket() {
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(go)-1).children('div').eq(0).children('input').focus();
						}
					</script>
				</c:if>			
			</div>
			
			<div id="div-area">
				<c:if test="${ empty myBucketList }">
				</c:if>
				<c:if test="${ not empty myBucketList }">
					<div id="bucketTitle">
					<br>
						<h2>
							<%= mbl.get(index).getBucket().getBkName() %>
						</h2>
					</div>
					<h5><%= mbl.get(index).getCateName() %></h5>
					<br>
					<div id="bucketImg">
						<img style="max-width: 600px; max-height: 337.5;" src="/BucketStory/resources/muploadFiles/<%= mbl.get(index).getMedia().getMweb() %>" alt="" />
					</div>
					<br>
					<div id="bucketContent">
						<textarea readonly="readonly">
							<%= mbl.get(index).getBucket().getBkContent().replaceAll("<br>", "\n") %>							
						</textarea>
						<script>
							var bucketContent = $('#bucketContent').children()
							var content = $('#bucketContent').children().val()
							console.log(content)
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
								$tagBtn.attr("onclick", "searchTag('"+ tags[i] +"')")
								$('#bucketTag').append($tagBtn)
							}
						}
						function searchTag(t){
							location.href="searchTag.ho?t="+t;
						}
					</script>
					<input type="hidden" id="bucketNum" value="<%= mbl.get(index).getBucket().getBkNo() %>" />
					<c:if test="${ flag eq 'true' }">
						<button id="blogWriteBtn" style="width: 100px;">스토리 작성하기</button>
					</c:if>
					<% if(user != null && mbl.get(index).getBucket().getUserId().equals(user.getUserId())) { %>
						<button id="bucketUpdateBtn" onclick="bucketUpdate(<%= mbl.get(index).getBkNo() %>, ${ pi.currentPage })" style="width: 100px;">수정하기</button>						
					<% } %>
				</c:if>
			</div>		
			<c:if test="${ not empty bList }">
				<c:forEach items="${ bList }" var="bl" varStatus="status">
					<!-- 블로그 내용 -->
					<div class="blogBucket">
						<input type="hidden" value="${ bl.bNo }" />
						<div class="test" style="text-align: center;">
							<input type="text" readonly="readonly" value="${ status.index }" style="width:0px; height:0px; font-size: 0px; border: none;" class="selBtn">
						</div>
						<br><br>
						<span id="story_index">'${ getMember.nickName }'님의 ${ status.index + 1 }번째 이야기</span>
						<br>
						<h3 style="text-align: center;">${ bl.bTitle }</h3>
						<div class="profile-area">
							<c:if test="${ empty getMember.prImage }">
								<img src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;" />
							</c:if>
							<c:if test="${ not empty getMember.prImage }">
								<img src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
							</c:if>
							<span>${ getMember.nickName }</span>
							<span style="margin-left: 70%;">${ bl.enrollDate }</span>
						</div>
						<div class="bContent">
							${ bl.bContent }
						</div>
						<div class="etc-area">
							<input type="hidden" class="hidden_BKNO" value="${ bl.bNo }"/>
							<c:if test="${ loginUser != null && loginUser.nickName eq getMember.nickName }">
								<button onclick="location.href='blogUpdate.me?bNo=${ bl.bNo }&bkNo=${ bl.bkNo }&page=${ pi.currentPage }'">수정하기</button>
								<button onclick="blogDelete(${ bl.bNo } ,${ bl.bkNo },${ pi.currentPage });">삭제하기</button>
							</c:if>
							<c:if test="${ loginUser != null && loginUser.nickName ne getMember.nickName }">
								<i class="fa fa-heart-o" aria-hidden="true"></i>
								<span style="cursor: pointer; margin-right: 70px;" onclick="boardLike(this);">좋아요</span>
								<i class="fa fa-ban" aria-hidden="true"></i>
								<span style="cursor: pointer;" onclick="boardReport(this);">신고</span>
							</c:if>
						</div>
						<!-- 댓글 쓰기 -->
						<c:if test="${ loginUser != null }">
							<div class="comment">
								<div class="write_comment_profile_area">
									<c:if test="${ empty loginUser.prImage }">
										<img src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;" />
									</c:if>
									<c:if test="${ not empty loginUser.prImage }">
										<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
									</c:if>
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
										<c:if test="${ empty bl_bc.member.prImage }">
											<img src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;" />
										</c:if>
										<c:if test="${ not empty bl_bc.member.prImage }">
											<img src="/BucketStory/resources/member/images/profiles/${ bl_bc.member.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
										</c:if>
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
											<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" 
											style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
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
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" 
													style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
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
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" 
													style="width: 98%; padding: 7px;" readonly="readonly" >${ bl_bc.cmContent }</textarea>
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
													<textarea name="cmcontent" class="cmcontent" onkeyup="commentCount(this);" 
													style="width: 98%; padding: 7px;" readonly="readonly" >비밀글입니다.</textarea>
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
													<c:if test="${ empty reply.rmember.prImage }">
														<img src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" 
														style="width: 23px; height: 23px; border-radius: 100px;" />
													</c:if>
													<c:if test="${ not empty reply.rmember.prImage }">
														<img src="/BucketStory/resources/member/images/profiles/${ reply.rmember.prImage }" 
														style="width: 23px; height: 23px; border-radius: 100px;" />
													</c:if>
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
													<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" 
													style="width: 98%; padding: 7px;" readonly="readonly">${ reply.rpContent }</textarea>
												</div>					
											</c:if>
										</c:forEach>
										</div>
										<c:if test="${ loginUser != null }">
											<div class="reply">
												<div class="reply_profile_area">
													<c:if test="${ empty loginUser.prImage }">
														<img src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;" />
													</c:if>
													<c:if test="${ not empty loginUser.prImage }">
														<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
													</c:if>
													<span>${ loginUser.nickName }</span>
												</div>
												<div class="reply_content">
													<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" style="width: 98%; padding: 7px; background: white; border: 1px solid;"></textarea>
													<div class="reply_submit">
														<label class="counter">0/300</label>
														<input type="hidden" value="${ bl_bc.cmNo }" />
														<button type="button" onclick="reply_btn(this, '${ bl.bNo }', '${ bl_bc.userid }');">등록</button>
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
				<div class="blogBucket" style="text-align: center;">
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
						<c:if test="${ not empty myBucketList }">
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
		$('#img_area').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		$('#img_area>img').attr('src', "resources/main/images/loginback.jpg");
		$('#img_area>img').css('width', '100%');
		
		var list_table = $('.bucketList-area>table').hide()
		var list_page = $('.pagingBtn-area').hide();
		
		var bNo = '${ bNo }'
		if(bNo != "") {
			var length = $('.blogBucket').children('input[type=hidden]').length
			for(var i = 0; i < length; i++) {
				if($('.blogBucket').children('input[type=hidden]').eq(i).val() == bNo){
					console.log(i);
					$('.blogBucket').children('input[type=hidden]').eq(i).next().children().focus();
				}
			}
		}	
	});

	$(function(){
		var length = ${ myBucketList.size() };
		var bkNo = $('#bucketTag').next().next().val();
		for (var i = 0; i < length; i++) {
			if($.trim($('.hidden_BKNO').eq(i).val()) == bkNo) {
				$('.bkName').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
				$('.bkName2').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
			}
		}

		var length = $('.etc-area').length;
		var userId = '${ loginUser.userId }';
		var getId = '${ getMember.userId }';
		var i = 0;
		if(getId != userId) {			
			for(i = 0; i < length; i++) {
				var bNo = $('.etc-area').eq(i).children('input[type=hidden]').val();
				var heart = $('.etc-area').eq(i).children().eq(1)
// 				(function(i) {
					$.ajax({
						async: false,
						url: "bLikeCheck.me",
						data: {
							bNo:bNo,
							userId:userId
						}, success: function(data){
							if(data.trim() == 'exist') {
								heart.prop('class','fa fa-heart');
							} else if(data.trim() == 'empty') {
								heart.prop('class','fa fa-heart-o');
							}
						}
					})
// 				})(i)
			}
		}
	})
	

	/* 게시물 좋아요 */
	function boardLike(b) {
		var bNo = $(b).parent().children('input[type=hidden]').val();
		var userId = '${ loginUser.userId }';
		var status = "";
		if($(b).prev().attr('class') == "fa fa-heart-o") {
			status = "add";
			$(b).prev().attr('class','fa fa-heart');
		} else if($(b).prev().attr('class') == 'fa fa-heart') {
			status = "remove";
			$(b).prev().attr('class','fa fa-heart-o');
		}
		$.ajax({
			url: "bLike.me",
			data: {
				bNo:bNo,
				userId:userId,
				status:status
			}, success: function(data) {
				
			}
		})
	}
	
	/* 신고 스크립드 */
	/* 게시물 신고 카테 번호 1번 */
	function boardReport(r) {
		var sinuser = '${ loginUser.userId }';
		var pigouser = '${ getMember.userId }';
		var bno = $(r).prev().prev().prev().prev().val();
		var no_kind = 1;
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
	


	/* 댓글 등록 ajax */
	
	function comment_btn(b) {
		if($(b).parent().prev().val().trim().length == 0){
			alert("내용을 입력해주세요.");
		} else {
			var bNo = $(b).prev().val();
			var cmContent = $(b).parent().prev().val();
			var susinId = '${ getMember.userId }';
			var susinNick = '${ getMember.nickName }';
			var bucketNum = $('#bucketNum').val();
			var secret = $('input:checkbox[name=secret]:checked').length + 1;
			$.ajax({
				url: "bCommentInsert.me",
				type: "POST",
				data: {
					bNo:bNo, 
					cmContent:cmContent,
					susinNick:susinNick,
					bkNo:bucketNum,
					secret:secret
				},
				success: function(data) {
					send_message(susinId);
					location.reload();	
				}
			})
		}
	}
	
	/* 답글 등록 ajax */
	
	function reply_btn(b, bNo, susinId) {
		if($(b).parent().prev().val().trim().length == 0){
			console.log($(b))
			alert("내용을 입력해주세요.");
		} else {
			var cmNo = $(b).prev().val();
			var rpContent = $(b).parent().prev().val();
			var count = $(b).parent().parent().parent().parent().prev().children('label').text();
			var bucketNum = $('#bucketNum').val();
			var susinNick = '${ getMember.nickName }';
			console.log(count)
			$.ajax({
				url: "replyInsert.me",
				dataType: 'json',
				type: "POST",
				data: {
					cmNo:cmNo, 
					rpContent:rpContent,
					susinNick:susinNick,
					bNo:bNo,
					susinId:susinId,
					bkNo:bucketNum
				},
				success: function(data) {
					console.log(data);		
					count++;
					var nickName1 = '${ loginUser.nickName }'
					var nickName2 = '${ getMember.nickName }'
					$(b).parent().parent().parent().prev().html("")
					console.log(data)
					for(var i in data){
						if(data[i].status == 'Y') {
							if(nickName1 == data[i].userid && nickName1 == nickName2) {
								$div = $('<div class="reply_profile_area">');
								$input = $('<input type="hidden">').val(data[i].rpNo);
								if(data[i].rmember != null) {
									$prImg = $('<img src="resources/member/images/profiles/'+ data[i].rmember.prImage+'" style="width: 23px; height: 23px; border-radius: 100px;">');											
								} else {
									$prImg = $('<img src="resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;">');								
								}
								$span1 = $('<span></span>').text(data[i].userid)
								$span2 = $('<span class="replyUpdate" onclick="replyUpdate(this)">수정</span>');
								$span3 = $('<span class="replyDelete" onclick="replyDelete(this)">삭제</span>');
								$button = $('<button type="button">블로그주인</button>')
								$span4 = $('<span></span>').text(data[i].rpDate);
								$div.append($input, $prImg, $span1, $span2, $span3, $button, $span4)
							} else if(nickName1 == data[i].userid) {
								$div = $('<div class="reply_profile_area">');
								$input = $('<input type="hidden">').val(data[i].rpNo);
								if(data[i].rmember != null) {
									$prImg = $('<img src="resources/member/images/profiles/'+ data[i].rmember.prImage+'" style="width: 23px; height: 23px; border-radius: 100px;">');											
								} else {
									$prImg = $('<img src="resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;">');								
								}
								$span1 = $('<span></span>').text(data[i].userid)
								$span2 = $('<span class="replyUpdate" onclick="replyUpdate(this)">수정</span>');
								$span3 = $('<span class="replyDelete" onclick="replyDelete(this)">삭제</span>');
								$span4 = $('<span></span>').text(data[i].rpDate);
								$div.append($input, $prImg, $span1, $span2, $span3, $span4)							
							} else if(nickName1 != data[i].userid && data[i].userid == nickName2) {
								$div = $('<div class="reply_profile_area">');
								$input = $('<input type="hidden">').val(data[i].rpNo);
								if(data[i].rmember != null) {
									$prImg = $('<img src="resources/member/images/profiles/'+ data[i].rmember.prImage+'" style="width: 23px; height: 23px; border-radius: 100px;">');								
								} else {
									$prImg = $('<img src="resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;">');								
								}
								$span1 = $('<span></span>').text(data[i].userid)
								$span2 = $('<span style="cursor: pointer;" class="reply_Report" onclick="replyReport(this);">신고</span>')
								$button = $('<button type="button">블로그주인</button>')
								$span4 = $('<span></span>').text(data[i].rpDate);
								$div.append($input, $prImg, $span1, $span2, $button, $span4)	
							} else {
								$div = $('<div class="reply_profile_area">');
								$input = $('<input type="hidden">').val(data[i].rpNo);
								if(data[i].rmember != null) {
									$prImg = $('<img src="resources/member/images/profiles/'+ data[i].rmember.prImage+'" style="width: 23px; height: 23px; border-radius: 100px;">');											
								} else {
									$prImg = $('<img src="resources/member/images/profiles/basicProfile.jpg" style="width: 23px; height: 23px; border-radius: 100px;">');								
								}
								$span1 = $('<span></span>').text(data[i].userid)
								$span2 = $('<span style="cursor: pointer;" class="reply_Report" onclick="replyReport(this);">신고</span>')
								$span4 = $('<span></span>').text(data[i].rpDate);
								$div.append($input, $prImg, $span1, $span2, $span4)	
							}
							
							
							$div2 = $('<div class="reply_content">')
							$textarea = $('<textarea name="rpContent" class="rpContent" onkeyup="replyCount(this);" style="width: 98%; padding: 7px;" readonly="readonly">').text(data[i].rpContent)
							
							$div2.append($textarea)
							$(b).parent().parent().parent().prev().append($div, $div2);
							$(b).parent().prev().val("");
							$(b).prev().prev().text("0/300");
							$(b).parent().parent().parent().parent().prev().children('label').text(count);
						}						
					}
					send_message(susinId);
				}					
			})
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
				location.reload();
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
				location.reload();
			}
		})
	}
	
	$(function(){
		console.log('${getMember.userId}')
		console.log($('#bucketNum').val())
		$.ajax({
			url: "shareCheck.me",
			data: {
				userId:'${getMember.userId}',
				bkNo: $('#bucketNum').val()
			},
			success: function(data) {
				console.log(data)
				if(data == "success") {
					$('#bucketUpdateBtn').hide()
				}
			}
		})
	})
	
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
<script type="text/javascript" src="resources/member/js/bucektBlog.js"></script>
</body>
</html>