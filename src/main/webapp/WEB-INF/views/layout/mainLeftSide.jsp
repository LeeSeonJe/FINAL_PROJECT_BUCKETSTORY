<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="resources/layout/css/mainLeftSide.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="leftSideBar">
		<div id="category1" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=0'><img id="categoryImg1" class="categoryImg" src="resources/layout/images/all.png"></a>
		</div>
		<div class="categoryname">All</div>
		<div id="category2" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=1'><img id="categoryImg2" class="categoryImg" src="resources/layout/images/여행.png"></a>
		</div>
		<div class="categoryname">Travel</div>
		<div id="category3" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=2'><img id="categoryImg3" class="categoryImg" src="resources/layout/images/운동.png"></a>
		</div>
		<div class="categoryname">Sport</div>
		<div id="category4" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=3'><img id="categoryImg4" class="categoryImg" src="resources/layout/images/food.png"></a>
		</div>
		<div class="categoryname">Food</div>
		<div id="category5" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=4'><img id="categoryImg5" class="categoryImg" src="resources/layout/images/skill.png"></a>
		</div>
		<div class="categoryname">New Skill</div>
		<div id="category6" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=5'><img id="categoryImg6" class="categoryImg" src="resources/layout/images/culture.png"></a>
		</div>
		<div class="categoryname">Culture</div>
		<div id="category7" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=6'><img id="categoryImg7" class="categoryImg" src="resources/layout/images/camping.png"></a>
		</div>
		<div class="categoryname">Outdoor</div>
		<div id="category8" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=7'><img id="categoryImg8" class="categoryImg" src="resources/layout/images/shopping.png"></a>
		</div>
		<div class="categoryname">Shopping</div>
		<div id="category9" class="category">
			<a href='main.ho?menuNum=${ menuNum }&category=8'><img id="categoryImg9" class="categoryImg" src="resources/layout/images/lifestyle.png"></a>
		</div>
		<div class="categoryname">Lifestyle</div>
	</div>
	<div id="sidemenuhoverbar"></div>
</body>
<script>
	$(function(){
		$('#category1').mouseover(function(){
			$('#categoryImg1').prop('src','resources/layout/images/allhover.png');
		}).mouseout(function(){
			$('#categoryImg1').prop('src','resources/layout/images/all.png');
		});
		$('#category2').mouseover(function(){
			$('#categoryImg2').prop('src','resources/layout/images/여행hover.png');
		}).mouseout(function(){
			$('#categoryImg2').prop('src','resources/layout/images/여행.png');
		});
		$('#category3').mouseover(function(){
			$('#categoryImg3').prop('src','resources/layout/images/운동hover.png');
		}).mouseout(function(){
			$('#categoryImg3').prop('src','resources/layout/images/운동.png');
		});
		$('#category4').mouseover(function(){
			$('#categoryImg4').prop('src','resources/layout/images/foodhover.png');
		}).mouseout(function(){
			$('#categoryImg4').prop('src','resources/layout/images/food.png');
		});
		$('#category5').mouseover(function(){
			$('#categoryImg5').prop('src','resources/layout/images/skillhover.png');
		}).mouseout(function(){
			$('#categoryImg5').prop('src','resources/layout/images/skill.png');
		});
		$('#category6').mouseover(function(){
			$('#categoryImg6').prop('src','resources/layout/images/culturehover.png');
		}).mouseout(function(){
			$('#categoryImg6').prop('src','resources/layout/images/culture.png');
		});
		$('#category7').mouseover(function(){
			$('#categoryImg7').prop('src','resources/layout/images/campinghover.png');
		}).mouseout(function(){
			$('#categoryImg7').prop('src','resources/layout/images/camping.png');
		});
		$('#category8').mouseover(function(){
			$('#categoryImg8').prop('src','resources/layout/images/shoppinghover.png');
		}).mouseout(function(){
			$('#categoryImg8').prop('src','resources/layout/images/shopping.png');
		});
		$('#category9').mouseover(function(){
			$('#categoryImg9').prop('src','resources/layout/images/lifestylehover.png');
		}).mouseout(function(){
			$('#categoryImg9').prop('src','resources/layout/images/lifestyle.png');
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