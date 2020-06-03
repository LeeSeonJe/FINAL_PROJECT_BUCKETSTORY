<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script  type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel ="stylesheet" href ="resources/expert/css/hp_nav.css">
	<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<style>
#overlay-2{
	top:145px;
	width:100%;
	height: 150%;
	background : rgba(0,0,0,0.55);
	position: absolute;
	z-index:9999;
	display:none;
}
.hidden {height:100%; min-height:100%; overflow:hidden !important; touch-action:none;}
</style>
</head>
<body>


	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
    <nav>
    <div id="menu-area">
        <ul class='menu-c'>
            <li id ="menu-item1"><a href='#'>헬퍼마이페이지</a></li>
            <li id ="menu-item2"><a href='#'>헬퍼버킷리스트</a></li>
            <li id ="menu-item3"><a href='#'>견적서 관리</a></li>
            <li id ="menu-item4"><a href='#'>포인트 관리</a></li>
            <li id ="menu-item5"><a href='#'>Q & A</a></li>
        </ul>
    </div>
</nav>
<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>


    <div id="sub-area">
        <ul class='sub-c' id ="sub-item1">
            <li><a href="helperView.ex">헬퍼뷰어</a></li>
            <li><a href="helperEdit.ex">헬퍼수정</a></li>
        </ul>
        <ul class='sub-c' id ="sub-item2">
            <li><a href="helperBucketList.ex">헬퍼버킷리스트</a></li>
            <li><a href=#>헬퍼4</a></li>
        </ul>
        <ul class='sub-c' id ="sub-item3">
            <li><a href=#>견적서 관리5</a></li>
            <li><a href=#>헬퍼6</a></li>
        </ul>
        <ul class='sub-c' id ="sub-item4">
            <li><a href="point.ex">포인트 충전</a></li>
            <li><a href="pointList.ex">포인트 내역</a></li>
        </ul>
        <ul class='sub-c' id ="sub-item5">
            <li><a href=#>1:1 문의</a></li>
            <li><a href=#>문의내용 확인</a></li>
        </ul>
    </div>

<div id ="overlay-2"></div>

    <script>

        /* 시작 */
        $(function(){
            sub_close(); 
//             $('#sub-item1').css({"border":"2px solid #10ccc3","transform":"translateX(40%)"}).show();
        });
        
        function scrollDisable(){
            $('html, body').addClass('hidden');
        }
        function scrollAble(){
            $('html, body').removeClass('hidden');
        }
        
        //오버레이로 덮고 스크롤 금지.
        function overlay_show(){
        	$('#overlay-2').css({'display':'block'}); scrollDisable();
        }
        
        function sub_close(){
            $('#sub-item1').hide(); $('#sub-item2').hide();  $('#sub-item3').hide();
            $('#sub-item4').hide(); $('#sub-item5').hide();
        };
        
        $('#menu-item1').on('click',function(){
            sub_close(); overlay_show();
            $('#sub-item1').css({"border":"2px solid #10ccc3","transform":"translateX(40%)"}).show();
        });
        $('#menu-item2').on('click',function(){
            sub_close(); overlay_show();
            $('#sub-item2').css({"border": "2px solid #3a7af8","transform":"translateX(50%)"}).show();
        });
        $('#menu-item3').on('click',function(){
            sub_close(); overlay_show();
            $('#sub-item3').css({"border": "2px solid #a047c0","transform":"translateX(100%)"}).show();
        });
        $('#menu-item4').on('click',function(){
            sub_close(); overlay_show();
            $('#sub-item4').css({"border": "2px solid #f861a2","transform":"translateX(120%)"}).show();
        });
        $('#menu-item5').on('click',function(){
            sub_close(); overlay_show();
            $('#sub-item5').css({"border": "2px solid #10ccc3","transform":"translateX(150%)"}).show();
        });

        
        //
    
    </script>
</body>
</html>