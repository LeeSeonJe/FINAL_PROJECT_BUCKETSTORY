<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/expert/css/infoUpdateForm.css">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
<div id="page">
<form action="expertUpdate.ex">
	<div id="page-1">
		<div id="inputPhoto">
			<img src="resources/expert/images/배경-1.jpg" id="mainPhoto" name="mainPoto">
		</div>
		
		<div id="sum-upPage">

			<hr style="clear:left;">
			
			
			<table id="helperProfile" style="border:1px solid black; width:600px;height:200px;">
				<tr>
					<td rowspan="2"><img src="resources/expert/images/photo.jpg" id="profileImage" ></td>
					<td><h2>${ company.compaName }</h2></td>
					<td><input type="hidden" id="coId" name="coId" value="${ company.coId }"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
						<textarea id="coIntro" name="coIntro" style="width: 396px;height: 100px;"placeholder="간단소개 입력">
							${ company.coIntro }
						</textarea>
						</div>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<h2>업체정보</h2>
			<textarea id="coInfo" name="coInfo" style="width: 600px;height: 100px;"placeholder="상세소개 입력">${ company.coInfo }</textarea>

			<hr>
			
			<div id="categorybar">
				<div id="cate1" class="category1" onclick="cateList(1);">
					<img id="categoryImg2" class="categoryImg1" src="resources/layout/images/여행.png">
					<h5 style="display:inline">여행</h5>
				</div>
				<div id="cate2" class="category1" onclick="cateList(2);">
					<img id="categoryImg3" class="categoryImg1" src="resources/layout/images/운동.png">
					<h5 style="display:inline">운동</h5>
				</div>
				<div id="cate3" class="category1" onclick="cateList(3);">
					<img id="categoryImg4" class="categoryImg1" src="resources/layout/images/food.png">
					<h5 style="display:inline">음식</h5>
				</div>
				<div id="cate4" class="category1" onclick="cateList(4);">
					<img id="categoryImg5" class="categoryImg1" src="resources/layout/images/skill.png">
					<h5 style="display:inline">기술</h5>
				</div>
				<div id="cate5" class="category1" onclick="cateList(5);">
					<img id="categoryImg6" class="categoryImg1" src="resources/layout/images/culture.png">
					<h5 style="display:inline">문화</h5>
				</div>
				<div id="cate6" class="category1" onclick="cateList(6);">
					<img id="categoryImg7" class="categoryImg1" src="resources/layout/images/camping.png">
					<h5 style="display:inline">캠핑</h5>
				</div>
				<div id="cate7" class="category1" onclick="cateList(7);">
					<img id="categoryImg8" class="categoryImg1" src="resources/layout/images/shopping.png">
					<h5 style="display:inline">쇼핑</h5>
				</div>
				<div id="cate8" class="category1" onclick="cateList(8);">
					<img id="categoryImg9" class="categoryImg1" src="resources/layout/images/lifestyle.png">
					<h5 style="display:inline">style</h5>
				</div>
			</div>
			
			<br clear="left">
		<div id="bucketArea">
		</div>
			<script>
				function cateList(catenum){
					$.ajax({
						url : 'cateList.ex',
						data : { catenum : catenum },
						dataType: 'json',
						success : function(data){
							console.log(data.length);
							$area = $('#bucketArea');
							$area.html('');
							$text='';
							
							if(data.length >0){
								for(var i in data){
									$text +="<div class='bucketList' style='margin-top:30px;' onclick='modal();'>"
													+"<table><tr>"
													+"<td rowspan='2'><img style='width: 90px;'id='bucketListImage' src='resources/expert/images/photo.jpg'></td>"
													+"<td>"+data[i].bkName+"</td>"
													+"</tr><tr><td>"+data[i].bkContent+"</td></tr>"
													+"</table></div>";
								}
								$area.html($text);
							}else{
								$area.html("<h2>해당 카테고리의 버킷리스트가 없습니다</h2>")
							}
						},error: function(request){
							alert("카테고리 정보를 불러오는데 실패했습니다.");
						}
					});
				} 			
			</script>
			
		</div>
</div>
	<div id="page-2">
		<ul style="padding-inline-start: 0px;">
			<li><h5>함께하는 버킷리스트</h5></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
			<li><a href="">버킷리스트</a></li>
		</ul>
		
		<div id="subBtn">
			<button id="sub">저장하기</button>
		</div>
	</div>
		<div id="modal">
					   
			<div class="modal_content">
				<img id="bucketImage" src="resources/expert/images/배경-1.jpg">
					       
				<div id="area1">
					<h2 style="display:inline;">버킷리스트 이름</h2>
					<textarea id="bucketContent" readonly>
						버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트
						버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트버킷리스트
					</textarea>
				</div>
					       
				<button type="button" id="modal_close_btn">모달 창 닫기</button>
				<button id="bucketAdd">추가하기</button>
			</div>
					   
		<div class="modal_layer"></div>
		</div>
	<script>
	var currentPosition = parseInt($("#page-2").css("top")); $(window).scroll(function() { var position = $(window).scrollTop(); $("#page-2").stop().animate({"top":position+currentPosition+"px"},1000); });

	function modal() {
    	$('#modal').css({"top":(($(window).height()-$('#modal').outerHeight())/2+$(window).scrollTop()+80)+"px",
						 "left":(($(window).width()-$('#modal').outerWidth())/2+$(window).scrollLeft())+"px"})
       $('#modal').show();
    };
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
	</script>
</form>
</div>
</body>
</html>