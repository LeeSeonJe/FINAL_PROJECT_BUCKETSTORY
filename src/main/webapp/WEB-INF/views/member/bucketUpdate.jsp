<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketWrite.css">
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
					<td colspan="3" style="font-size: 30px;">${ getMember.nickName }</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ getMember.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ list }</td>
					<td>팔로워 ${ followerList.size() }</td>
					<td>팔로잉 ${ followingList.size() }</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<h2>버킷리스트 작성</h2>
			<form action="bucketUpdate.me" method="post" enctype="multipart/form-data" onsubmit="return validate();">
				<input type='file' id="imgInput" name="uploadFile"/>
				<div id="img_area">
					<img/>
				</div>
				<div id="content_area">
					제목<br>
					<input type="text" name="bkName" required="required" value="${ bucket.bkName }"/><br><br>
					카테고리
					<select name="cateNum">
						<option value="1">Travel</option>
						<option value="2">Sport</option>
						<option value="3">Food</option>
						<option value="4">New Skill</option>
						<option value="5">Culture</option>
						<option value="6">Outdoor</option>
						<option value="7">Shopping</option>
						<option value="8">Lifestyle</option>
					</select><br><br>
					설명<br>
					<textarea name="bkContent" required="required">${ bucket.bkContent }</textarea><br><br>
					태그<br>
					<span>#</span><input type="text" class="tag_input" name="tags"/>
					<span>#</span><input type="text" class="tag_input" name="tags"/>
					<span>#</span><input type="text" class="tag_input" name="tags"/>
					<span>#</span><input type="text" class="tag_input" name="tags"/>
					<span>#</span><input type="text" class="tag_input" name="tags"/>
					<br><br>
					<div id="button-area">
						<button type="submit">완료</button>
						<button type="button" id="cancel">취소</button>
					</div>
					<br><br><br>
					<input type="hidden" name="page" value="${ page }" />
					<input type="hidden" name="bkNo" value="${ bkNo }" />
					<input type="hidden" name="mweb" value="${ bucket.media.mweb }" />
				</div>
			</form>
		</section>
	</div>
<script>
	function validate() {
// 		if($('#imgInput').val() == "") {
// 			alert("사진 한장 이상을 첨부해주세요.")
// 			return false;			
// 		}
		return true;
	}

	$(function(){
		var cateNum = '${ bucket.cateNum }';
		$('select[name=cateNum] option:eq(' + parseInt(cateNum) + ')').attr('selected', 'true')
		$('#img_area').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		$('#img_area>img').attr('src', "resources/muploadFiles/${ bucket.media.mweb }");
// 		$('#img_area>img').css('width', '100%');

		var tag = '${ bucket.tag }';
		var tags = tag.split(',');
		console.log(tags)
		var length = $(".tag_input").length;
		for(var i = 0; i < length; i++) {
			$(".tag_input").eq(i).val(tags[i]);
		}
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
	
	$('#cancel').on('click',function(){
		location.href="javascript:history.go(-1)"
	})
	
	$('.gnb_menu .gnb_menu_ul li a .text:eq(0)').css('color', '#fff');
	
	$('#overlay').css('top','-2px');
  	$('#sidewrap').css('top','56px');
	$('nav>a:eq(2)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	
	$('.gnb_menu .gnb_menu_ul li a .text:eq(0)').css('color', '#fff');
	$('.gnb_menu .gnb_menu_ul li a.gnb1').css('background','url("resources/layout/images/bg01_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .ico').css('background', 'url("resources/layout/images/ico01_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .text span').css('color','#fff');


</script>
</body>
</html>