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
	
	function bucketUpdate(bkNo, page) {
		location.href="bucketUpdateGo.me?bkNo=" + bkNo + "&page=" + page;
	}
	
	function blogDelete(bNo, bkNo, page) {
		var result = confirm("글을 삭제하시겠습니다.");
		if(result){
			alert('삭제되었습니다.');
			location.href='blogDelete.me?bNo='+ bNo +'&bkNo='+ bkNo +'&page=' + page;
		}else{
		    alert('취소!');
		}
	}
	
	
	//팔로우
	var flag = false;
	$('#follower-td').click(function(){
		$('#follower-area').animate({opacity: "1"}, 0);
		$('#follower-area').css('display', 'block');
		$('#following-area').css('display', 'none');
	})
	
	$('#follower-td').mouseenter(function(){
		event.stopPropagation();
		event.preventDefault();
		flag = true;
	})
	
	$('#follower-td').mouseleave(function(){
		flag = true;
		if(!flag){
			$('#follower-area').css({"display": "none"});
		}
	})
	
	$('#follower-area').mouseenter(function(){
		event.stopPropagation();
		event.preventDefault();
		flag = true;
	})
	
	$('#follower-area').mouseleave(function(){
		flag = false;
		if(!flag){
			$('#follower-area').css({"display": "none"});
		}
	})
	
	$(function(){
		$('#follower-area').css('display', 'none');
		$('#following-area').css('display', 'none');
	})

	// 팔로잉
	var flag2 = false;
	$('#following-td').click(function(){
		$('#following-area').animate({opacity: "1"}, 0);
		$('#follower-area').css('display', 'none');
		$('#following-area').css('display', 'block');
	})
	
	$('#following-td').mouseenter(function(){
		event.stopPropagation();
		event.preventDefault();
		flag2 = true;
	})
	
	$('#following-td').mouseleave(function(){
		flag2 = true;
		if(!flag2){
			$('#following-area').css({"display": "none"});
		}
	})
	
	$('#following-area').mouseenter(function(){
		event.stopPropagation();
		event.preventDefault();
		flag2 = true;
	})
	
	$('#following-area').mouseleave(function(){
		flag2 = false;
		if(!flag2){
			$('#following-area').css({"display": "none"});
		}
	})
	
	
	// 스크롤시 안보이기
	$(window).scroll(function(event){ 
		$('#follower-area').css('display', 'none')
		$('#following-area').css('display', 'none')
	});	
	
