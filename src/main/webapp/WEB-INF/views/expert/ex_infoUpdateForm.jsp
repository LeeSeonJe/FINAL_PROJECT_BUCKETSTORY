<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.BucketStory.bucket.model.vo.Media"%>
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
			<img src="resources/expert/images/moon.jpg" id="mainPhoto" name="mainPoto">
		</div>
		
		<div id="sum-upPage">

			<hr style="clear:left;">
			
			
			<table id="helperProfile" style="border:1px solid black; width:600px;height:200px;">
				<tr>
					<td rowspan="2"><img src="resources/expert/images/moon.jpg" id="profileImage" ></td>
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
					var cateListVar;
					var bucketImg;
					function cateList(catenum){
						$.ajax({
							url : 'cateList.ex',
							data : { catenum : catenum },
							dataType: 'json',
							success : function(data){
								$area = $('#bucketArea');
								$area.html('');
								$text='';
								console.log(data);
								console.log(data.media);
								console.log(data.list);
								console.log(data.media[0]);
								console.log(data.media[0].mweb);
								if(data.list.length >0){
									for(var i in data.list){
										cateListVar = data.list;
										bucketImg = data.media;
										var imgname ='';
										for(var j=0;j<data.media.length;j++){
											if(data.list[i].bkNo == data.media[j].bkno){
												imgname = data.media[j].mweb;
											}
										}
										$text +="<div class='bucketList' style='margin-top:30px;'" 
													+"onclick='modal("+data.list[i].bkNo+");'>"
														+"<table><tr>"
														+"<td rowspan='2'><img style='width: 90px;'id='bucketListImage' src='resources/muploadFiles/"+imgname+"'></td>"
														+"<td><b>"+data.list[i].bkName+"</b></td>"
														+"</tr><tr><td>"+data.list[i].bkContent+"</td></tr>"
														+"</table></div>";
									}
									$area.html($text);
								}else{
									$area.html("<h2>해당 카테고리의 버킷리스트가 없습니다</h2>")
								}
							}
						});
					} 			
				</script>
				
			</div>
	</div>
	<div id="page-2" style="top:80.6px;">
	  <div style="overflow:auto; width:320px; height:530px;">
		<table id="choiceBucket" style="padding-inline-start: 0px;width: 100%;">
			<tr><th colspan="3" style="height: 70px;">함께하는 버킷리스트</th></tr>
			
			<c:if test="${ bucket eq null }">
				<tr><td colspan="2">함께하는 버킷리스트가 없습니다.</td><tr>
			</c:if>
			<c:if test="${ bucket !=null }">
				<c:forEach var="bucket" items="${ bucket }">
					<tr onclick="modal(${bucket.bkNo});">
						<c:forEach var="m" items="${ media }">
							<c:if test="${bucket.bkNo == m.bkno }">
								<td><img style='width: 90px;'id='bucketListImage' src='resources/muploadFiles/${ m.mweb }'></td>
							</c:if>
						</c:forEach>
						<td>${ bucket.bkName }</td><td><b id="delete">x</b></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	 </div>
		<div id="subBtn">
			<button class="btn" id="sub">저장하기</button>
			<button class="btn" id="cancle">취소</button>
		</div>
	</div>
	</form>
	</div>
	<div id="FullOverLay">
		<div id="modal">
			<div id="bucketexit">X</div>
			<img id="bucketImage" src="resources/expert/images/moon.jpg">
			<div id="bucketcate">FOOD</div>
			<div id="buckettitle">리틀 포레스트에 나오는 음식 따라 만들기</div>
			<div id="bucketAdd"> + ADD </div>
					       
				<div id="area1">
					<div id="bucketContent">
					</div>
				</div>
		</div>
	</div>
	<script>
	function modal(b) {
		
		for( var i in cateListVar){
			if(b==cateListVar[i].bkNo){
				switch(cateListVar[i].cateNum){
					case 1: $('#bucketcate').html('Travel'); break;
					case 2: $('#bucketcate').html('Sport'); break;
					case 3: $('#bucketcate').html('Food'); break;
					case 4: $('#bucketcate').html('New Skill'); break;
					case 5: $('#bucketcate').html('Culture'); break;
					case 6: $('#bucketcate').html('Outdoor'); break;
					case 7: $('#bucketcate').html('Shopping'); break;
					case 8: $('#bucketcate').html('Lifestyle'); break;
				}
				$('#buckettitle').html(cateListVar[i].bkName);
				$('#bucketContent').html(cateListVar[i].bkContent);
				$('#bucketAdd').attr("onclick","selectBucket("+cateListVar[i].bkNo+")");
			}
		}
      	$('#FullOverLay').show();
    }
	
	var currentPosition = parseInt($("#page-2").css("top")); 
	
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		$("#page-2").stop().animate({"top":position+currentPosition+"px"},800); 
	});

	    
	$('#bucketexit').click(function(){
		$('#FullOverLay').hide();
		$('body').css('height', 'auto');
		$('body').css('overflow', 'visible');
	});
	
	function selectBucket(bk){
		var addLi =$('#choiceBucket>tbody>tr:Last')
		var add;

			for(var i in cateListVar){
				if(cateListVar[i].bkNo == bk){
					for(var m in bucketImg){
						if(bucketImg[m].bkno == bk){
							add = "<tr onclick='modal("+bk+");'><td><img style='width: 90px;'id='bucketListImage' src='resources/muploadFiles/"+bucketImg[m].mweb+"'></td>"
							+"<td>"+cateListVar[i].bkName+"</td><td><b>x</b></td></tr>"+"<input type='hidden' name='bucket' value='"+cateListVar[i].bkNo+ "'>"
						}
					}
				}
		}
			addLi.after(add);
		$('#FullOverLay').hide();
		alert("버킷리스트가 추가되었습니다.");
	};
    
	
	</script>

</body>
</html>