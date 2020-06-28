	$(function(){
		$('#follower-area').css('display', 'none');
		$('#following-area').css('display', 'none');
	})
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
	