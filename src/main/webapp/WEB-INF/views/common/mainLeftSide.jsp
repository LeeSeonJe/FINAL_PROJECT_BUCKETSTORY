<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="resources/common/css/mainLeftSide.css">
</head>
<body>
	<div id="leftSideBar">
		<div id="category1" class="category">
			<img id="categoryImg1" class="categoryImg" src="resources/common/images/all.png">
		</div>
		<div class="categoryname">All</div>
		<div id="category2" class="category">
			<img id="categoryImg2" class="categoryImg" src="resources/common/images/여행.png">
		</div>
		<div class="categoryname">Travel</div>
		<div id="category3" class="category">
			<img id="categoryImg3" class="categoryImg" src="resources/common/images/운동.png">
		</div>
		<div class="categoryname">Sport</div>
		<div id="category4" class="category">
			<img id="categoryImg4" class="categoryImg" src="resources/common/images/food.png">
		</div>
		<div class="categoryname">Food</div>
		<div id="category5" class="category">
			<img id="categoryImg5" class="categoryImg" src="resources/common/images/skill.png">
		</div>
		<div class="categoryname">New Skill</div>
		<div id="category6" class="category">
			<img id="categoryImg6" class="categoryImg" src="resources/common/images/culture.png">
		</div>
		<div class="categoryname">Culture</div>
		<div id="category7" class="category">
			<img id="categoryImg7" class="categoryImg" src="resources/common/images/camping.png">
		</div>
		<div class="categoryname">Outdoor</div>
		<div id="category8" class="category">
			<img id="categoryImg8" class="categoryImg" src="resources/common/images/shopping.png">
		</div>
		<div class="categoryname">Shopping</div>
		<div id="category9" class="category">
			<img id="categoryImg9" class="categoryImg" src="resources/common/images/lifestyle.png">
		</div>
		<div class="categoryname">Lifestyle</div>
	</div>
	<div id="sidemenuhoverbar"></div>
</body>
<script>
	$(function(){
		$('#category1').mouseover(function(){
			$('#categoryImg1').prop('src','resources/common/images/allhover.png');
		}).mouseout(function(){
			$('#categoryImg1').prop('src','resources/common/images/all.png');
		});
		$('#category2').mouseover(function(){
			$('#categoryImg2').prop('src','resources/common/images/여행hover.png');
		}).mouseout(function(){
			$('#categoryImg2').prop('src','resources/common/images/여행.png');
		});
		$('#category3').mouseover(function(){
			$('#categoryImg3').prop('src','resources/common/images/운동hover.png');
		}).mouseout(function(){
			$('#categoryImg3').prop('src','resources/common/images/운동.png');
		});
		$('#category4').mouseover(function(){
			$('#categoryImg4').prop('src','resources/common/images/foodhover.png');
		}).mouseout(function(){
			$('#categoryImg4').prop('src','resources/common/images/food.png');
		});
		$('#category5').mouseover(function(){
			$('#categoryImg5').prop('src','resources/common/images/skillhover.png');
		}).mouseout(function(){
			$('#categoryImg5').prop('src','resources/common/images/skill.png');
		});
		$('#category6').mouseover(function(){
			$('#categoryImg6').prop('src','resources/common/images/culturehover.png');
		}).mouseout(function(){
			$('#categoryImg6').prop('src','resources/common/images/culture.png');
		});
		$('#category7').mouseover(function(){
			$('#categoryImg7').prop('src','resources/common/images/campinghover.png');
		}).mouseout(function(){
			$('#categoryImg7').prop('src','resources/common/images/camping.png');
		});
		$('#category8').mouseover(function(){
			$('#categoryImg8').prop('src','resources/common/images/shoppinghover.png');
		}).mouseout(function(){
			$('#categoryImg8').prop('src','resources/common/images/shopping.png');
		});
		$('#category9').mouseover(function(){
			$('#categoryImg9').prop('src','resources/common/images/lifestylehover.png');
		}).mouseout(function(){
			$('#categoryImg9').prop('src','resources/common/images/lifestyle.png');
		});
		$('#sidemenuhoverbar').mouseenter(
		function(){
			$('#leftSideBar').animate({width:70});
		});
		$('#leftSideBar').mouseleave(
		function(){
			$('#leftSideBar').animate({width:0});
		});
	});
</script>
</html>