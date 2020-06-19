<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #navigation { position:fixed; 
            top:45%; left:40px; 
            margin-top:-100px; 
            z-index:1; 
/*             background: rgba(0,0,0,0.45);   */
            padding:20px; 
            border-radius: 8px;
            width:220px;
            overflow: hidden;
            transition:1s;
            }
    #navigation img{
   		overflow: hidden;
   		transform:translate(-100px,20px);
   		transition:5s;
    }       
    #navigation a { display:block; width:200px; height:60px; font-family:righteous; font-size:14px;
    color:#fff; text-align:right; overflow: hidden; box-sizing:border-box; border-top:1px solid #fff;
    opacity:0.8; transition:0.5s; }
    #navigation li { background: rgba(0,0,0,0.45); }
    #navigation li:hover a { font-size:24px; opacity:1; }
    #navigation li.on a { font-size:24px; opacity:1; }

    #navigation li:nth-child(1):hover a { color:#d4164c; border-color:#d4164c; }
    #navigation li:nth-child(2):hover a { color:rgb(33, 175, 33); border-color:rgb(33, 175, 33); }
    #navigation li:nth-child(3):hover a { color:#ffec6a; border-color:#ffec6a; }
    #navigation li:nth-child(4):hover a { color:#005a89; border-color:#005a89; }

    #navigation li:nth-child(1).on a { color:#d4164c; border-color:#d4164c; }
    #navigation li:nth-child(2).on a { color:rgb(33, 175, 33); border-color:rgb(33, 175, 33); }
    #navigation li:nth-child(3).on a { color:#ffec6a; border-color:#ffec6a; }
    #navigation li:nth-child(4).on a { color:#005a89; border-color:#005a89; }
    
    .tr{
   	 transform : rotate(0.1turn);
    }
    #HelperEdit{
	transition:1.5s;
    }
    .opa{
       opacity: 0.1;
    }
    </style>
</head>
<body>
<!--         navigation -->
        <ul id ="navigation">
        	<img src = "resources/expert/images/moon2.png" alt="달" />
        	<li class="on"><a href="#hpTop">Helper Home</a></li>
            <li><a href="#HelperEdit" id="test">기업소개 변경</a></li>
            <li><a href="#HelperEdit2">회원정보 수정</a></li>
            <li><a href="#footer">Last</a></li>
        </ul>
       <script>
       $(window).scroll(function() {
    		var scrolltop = $(document).scrollTop();
    		if(scrolltop < 680){
     		   $("#navigation li").removeClass();
     		   $("#navigation li:nth-child(2)").addClass("on");    
     		  $("#navigation img").css("transform","translate(-100px,50px)");
     		  $("#HelperEdit div").hide();
      		  $("#HelperEdit2 div").hide();
     		}
    		
    		if(scrolltop > 880){
    		   $("#navigation li").removeClass();
    		   $("#navigation li:nth-child(3)").addClass("on");  
    		   $("#navigation img").css("transform","translate(10px,-5px)");
    		   $("#HelperEdit div").show();
    		  
    		   							
    		}
    		
    		if(scrolltop > 1600){
     		   $("#navigation li").removeClass();
     		   $("#navigation li:nth-child(4)").addClass("on");  
     		   $("#navigation img").css("transform","translateX(15px,-10px)");
     		 
     		   $("#HelperEdit2 div").show();
     		}
    		
    	});
    	$("a[href^='#']").click(function(event){
    		event.preventDefault();
    		var target = $(this.hash);
    		// 헤더가 fixed 이기 떄문에 header만큼 뻄
    		console.log(target.offset().top-108);
    		$('html, body').animate({scrollTop:target.offset().top-108},500);
    	});
       </script>
</body>
</html>