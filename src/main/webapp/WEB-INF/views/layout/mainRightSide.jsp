<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="resources/layout/css/mainRightSide.css">
</head>
<body>
	<div id="overlay"></div>
	<div id="sidewrap">
		<!-- mainSection -->
        <div id="rightsidebar">

        	 <div class="gnb_menu">
                    <ul class="gnb_menu_ul">
                        <li >
                            <a id="test" href="myBucket.me" class="gnb1 mot2" onclick='eventTrack("", "menu_discover");'>
                                <div class="text mot2">
                                    <span class="en mot2">My BucketStory</span><br>
                                    나의 버킷이야기를 작성하고 관리해보세요.
                                </div>
                                <div class="ico mot2"></div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:goMyBucket();" class="gnb2 mot2" onclick='eventTrack("", "menu_mypage");'>
                                <div class="text mot2">
                                    <span class="en mot2">My Info</span><br>
                                    내 정보를 수정할 수 있어요.
                                </div>
                                <div class="ico mot2"></div>
                            </a>
                        </li>
                        <li>
                            <a href="/notice/notice_list.do" class="gnb3 mot2" onclick='eventTrack("", "menu_event");'>
                                <div class="text mot2">
                                    <span class="en mot2">Festival</span><br>
                                    진행중인 행사를 확인하세요.
                                </div>
                                <div class="ico mot2"></div>
                            </a>
                        </li>
                        <li>
                            <a href="/about/about.jsp" class="gnb4 mot2" onclick='eventTrack("", "menu_about");'>
                                <div class="text mot2">
                                    <span class="en mot2">QnA</span><br>      
                                    관리자에게 궁금한것을 물어보세요.
                                </div>
                                <div class="ico mot2"></div>
                            </a>
                        </li>
                    </ul>
           		</div>
        </div>
	</div>
<script>
	var toggleSwitch = 0;
	
	$('#menuBtn').click(function(){
		if(toggleSwitch == 0){
			$('#rightsidebar').animate({right:0});
			$('#overlay').css('display','block');
			toggleSwitch = 1;
		}else{
			$('#rightsidebar').animate({right:-400});
			$('#overlay').css('display','none');
			toggleSwitch = 0;
		}
	});
</script>
</body>
</html>