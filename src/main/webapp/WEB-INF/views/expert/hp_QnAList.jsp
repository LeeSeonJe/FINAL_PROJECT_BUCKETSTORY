<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/expert/css/hp_boardList.css">
<link rel ="stylesheet" href ="resources/expert/css/hp_sendQnA.css">
<link rel="stylesheet" href="resources/expert/css/hp_qnAdetail.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#background{
	 background: url("resources/expert/images/imac.png");
	 background-size:cover;
	 position: absolute;
	 width:980px;
	 height: 800px;
	 left: 450px;
	 top: 40px;
	 display:none;
	 z-index:-1;
}

#inner {
	width: 980px;
	height: auto;
	margin: 0 auto;
	padding: 50px;
	border-radius: 7px;

}
.padding-top{
	padding-top:50px;
}
#writeform{
/* 	transform:translateY(-100px); */
}
#newQnA{
	transform:translateX(-80px);
	float:right;
}
#boardDetail{
	display:none; 
	transition:1s;
 	
}
#moba{
	position: absolute;
	bottom:0px;
	right:0px;
	z-index:5;
	zoom:0.9;
}
#moba-content{
	position: absolute;
	bottom:340px;
	right:320px;
	z-index:5;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
	<div id="background"></div>
	<div id="moba"><img src ="resources/expert/images/moba.png"></div>
	<div id="moba-content"></div>
	<section class="p-section" id="hpTop">
	
	 <div id="inner">
			<div id ="writeform" class="comb" style="display:none;">	
				<div>
					<h2 style ="border-bottom: 1px solid black;">QnA 작성하기</h2>
				</div>
				<br>
					<table>
						<tr>
							<td><b class="rowT">제목</b></td>
							<td><input type="text" name="title" id ="title"></td>
						</tr>
						<tr>
							<td><b class="rowT">내용</b></td>
							<td><textarea rows="10px;" cols="80px;" name="content" id="content"></textarea>
						</tr>
					</table>
					<div>
						<ul>
							<li>
								<button type="reset" class="btn" id="cancle">취소</button>
								<button type="submit" class="btn btn--primary2" id="submitQnA">작성</button>
							</li>
						</ul>
					</div>
			</div>
	
			<!-- QnA 게시판 목록 영역-->
			<div id="board-area">

			<h3>${coId}님 환영합니다!</h3>
			<h3>Count(${search }): ${ pi.listCount }</h3>
			<button id="newQnA" class="btn btn--primary2" onclick ="newQnA();">새로운 문의글 작성하기</button>
			
				<table class="board" id="boardQnA">
					<thead>
						<tr>
							<th colspan="4">
						</tr>
						<tr>
							<th scope="cols">번호</th>
							<th scope="cols">제목</th>
							<th scope="cols">작성일</th>
							<th scope="cols"><c:if test="${search eq 'all'}">
									<button class="btn btn--primary2" onclick="goShowAll();">전체</button>
									<button class="btn" onclick="goShowY();">답변</button>
									<button class="btn" onclick="goShowN();">미답변</button>
								</c:if> <c:if test="${search eq 'Y'}">
									<button class="btn" onclick="goShowAll();">전체</button>
									<button class="btn btn--primary2" onclick="goShowY();">답변</button>
									<button class="btn" onclick="goShowN();">미답변</button>
								</c:if> <c:if test="${search eq 'N'}">
									<button class="btn" onclick="goShowAll();">전체</button>
									<button class="btn" onclick="goShowY();">답변</button>
									<button class="btn btn--primary2" onclick="goShowN();">미답변</button>
								</c:if></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${empty list }">
							<tr>
								<td colspan="4">내역이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="b" items="${ list }">
							<tr>
								<td scope="row" align="center">${ b.q_no }</td>
								<td align="center">${ b.q_title }</td>
								<td align="center">${ b.q_date }</td>
								<td align="center">${ b.answer }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<!-- QnA 게시판 페이징 영역-->
				<div id="board-paging">

					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						<button id="prev">이전</button>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="helperQnaList.ex?search=${search}">
							<c:param name="page" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }"><button id="prev">이전</button></a>
					</c:if>

					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<button class="sBtn active">${ p }</button>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="helperQnaList.ex?search=${search}">
								<c:param name="page" value="${ p }" />
							</c:url>
							<a href="${ pagination }"><button class="sBtn">${ p }</button></a>
						</c:if>
					</c:forEach>

					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button id="next">다음</button>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="helperQnaList.ex?search=${search}">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }"><button id="next">다음</button></a>
					</c:if>
				</div>
			</div>
			<br>
			
			
		 <div class ="section" id ="boardDetail">
	        <div class="content">
	            <table>
	                <tr>
	                    <th><label>번호</label></th>
	                    <th><label>제 목</label></th>
	                    <th>&nbsp&nbsp&nbsp&nbsp&nbsp</th>
	                </tr>
	                <tr>
	                    <td><span id ="q_no" style="color:red"></span></td>
	                    <td><input type="text" id="q_title"></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><label><b>질문내용▶</b><br></label><span id="q_date">(질문날짜)</span></td>
	                    <td><textarea rows="10px;" cols="50px;" name="content" id="q_content"></textarea></td>
	                    <td><button class="btn btn--primary1" onclick="qnaUpdate();">수정</button><br><br>
	                        <button class="btn btn--primary2" onclick="qnaDelete();">삭제</button></td>
	                </tr>
	                <tr>
	                    <td><label><b>답변내용▶</b><br></label><span id="an_date">(답변날짜)</span></td>
	                    <td><textarea rows="10px;" cols="50px;" name="content" id="an_content" readonly></textarea></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td colspan="3">미답변된 글입니다.</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    </div>
	</section>


<!-- <script src="resources/expert/js/qnajs"></script> -->
	<script>
	
	function newQnA(){
		$('#newQnA').fadeOut(500);
		$('#writeform').fadeIn(800);
		$('#background').fadeIn(700);
		$('#board-area').hide();
		$('#boardDetail').hide();
		$('#moba-content').html('<div style="color:pink; font-size:32px; transform:translate(50px,50px);"><b>새 문의글을<br>작성합니다.</b></div>');
	}
	
	$('#cancle').on('click',function(){
		location.reload();

	})
	
	$('#submitQnA').on('click',function(){
		var title = $('#title').val();
		var content = $('#content').val();
		
		$('#sendInner').show();
		if(title ==""){
// 			alert('제목을 입력하세요');
			
		$('#moba-content').html('<div style="color:red; font-size:32px; transform:translate(50px,50px);"><b> 제목을<br>입력하세요</b></div>');
		setTimeout(function() {
			$('#moba-content').html('');			
		},1200);

		}else if(content == ""){
//			alert('내용을 입력하세요');
			
			$('#moba-content').html('<div style="color:red; font-size:32px; transform:translate(50px,50px);"><b> 내용을<br>입력하세요</b></div>');
			setTimeout(function() {
				$('#moba-content').html('');			
			},1200);
		}else{
			$.ajax({
				url: "insertQnAjax.ex",
				data : 
				{
					title: title,
					content:content
				},
				
				success: function(data){
					console.log(data);
					if(data == 'ok'){
						console.log('전송성공');
						// 성공 로직
						$('#moba-content').html('<div style="color:red; font-size:32px; transform:translate(50px,50px);"><b>문의글<br>전송합니다</b></div>');
					setTimeout(function() {
						$('#moba-content').html('');			
					},1200);
// 						$('#writeform').hide();
// 						$('#sucessform').show();
						
						$('#writeform').fadeOut(800);
							setTimeout(function() {
// 						$('#sucessform').fadeIn(600);

							location.reload();
						}, 800);
// 						$('#qna-top').show();
					}else{
						console.log('전송실패');
						
						// 실패 로직
// 						$('#writeform').hide();
// 						$('#errorform').show();
					}
				}
			});
		}
	});

	
	
	function qnaUpdate(){
		//var check = confirm('수정합니다.');
		var check = true;
		var q_no = $('#q_no').text();
		var q_title = $('#q_title').val();
		var q_content = $('#q_content').val();
		
		
		console.log(q_no);
		console.log(q_title);
		console.log(q_content);
		
		if(check){
			if(q_no ==""){
				 console.log('Error');
				 return false;
			}else{
				
 				$.ajax({
 					type:"POST",
 	  				url:"helperQnaUpdate.ex?q_no=" + q_no,
 	  				data:{
 	  					q_title: q_title,
 	  					q_content: q_content
 	  				},
 	 				success:function(data){
 	 					console.log(data);
 	 					//alert('수정되었습니다.');
 	 					// 리로드
 	 					$text = '<div style="color:blue; font-size:25px; transform:translate(30px,100px);"><b><span style="color:#333">'
 							+ q_no +
 							'</span><br>번 문의글<br>수정합니다.</b></div>'
 							
 							$('#moba-content').html($text);
 							
 							setTimeout(function() {
 								location.reload();			
 							},700);
 	 				},
 	 				error:function(request,status,errorData){
	 					// 실패시 로직
 					console.log("error code :" + request.status + "\n"
 						+ "message : " + request.responseText + "\n"
 						+ "error : "  + errorData);
	 				}
				});
			}
	
		}
	
	}
	
		function qnaDelete(){
			//var check = confirm('삭제합니다.');
			var check = true;
			var q_no = $('#q_no').text();
			console.log(q_no);
			
			if(check){
				if(q_no ==""){
					 console.log('Error');
					 return false;
				}else{
					
	 				$.ajax({
	 	  				url:"helperQnaDelete.ex?q_no=" + q_no,
	 	 				success:function(data){
	 	 					console.log(data);
	 	 					//alert('삭제되었습니다.');
	 	 					
	 						$text = '<div style="color:red; font-size:25px; transform:translate(30px,100px);"><b><span style="color:#333">'
	 							+ q_no +
	 							'</span><br>번 문의글<br>삭제합니다.</b></div>'
	 							
	 							$('#moba-content').html($text);
	 							
	 							setTimeout(function() {
	 								location.reload();			
	 							},700);
	 							
	 	 					// 리로드
	 	 					
	 	 				},
	 	 				error:function(request,status,errorData){
		 					// 실패시 로직
	 					console.log("error code :" + request.status + "\n"
	 						+ "message : " + request.responseText + "\n"
	 						+ "error : "  + errorData);
		 				}
					});
				}
		
			}
		
		}
		
	window.onload = function(){
		$('#moba-content').html('<div style="color:#333; font-size:25px; transform:translate(30px,100px);"><b>안녕하세요<br>"Q&A"<br>센터입니다.</b></div>');
	}
	
	$(function() {
		
		
		
		$('#boardQnA td').mouseenter(function() {
			$(this).parent().css({
				'background' : 'pink',
				'cursor' : 'pointer',
			})
			
			
			
			
		}).mouseout(function() {
			$(this).parent().css({
				'background' : 'whitesmoke'
			})
// 			$('#boardDetail').hide();
		}).click(function() {
			
			console.log('01. 클릭했다');
			$(this).parent().css({
				'background' : 'beige'
			})
				
				if(${empty list }){
					
				}else{
					
					$('#boardDetail').show();
					$('#boardDetail').css({'zoom':'1.3','transform':'translateX(-120px)'});
					$text = '<div style="color:pink; font-size:25px; transform:translate(30px,100px);"><b><span style="color:red">'
					+ $(this).parent().children().eq(0).text() +
					'</span><br>번 문의글<br>상세보기</b></div>'
					
					$('#moba-content').html($text);
					detailChange(this);
					// 문의 상세보기 폼 show
//		 			$('#board-area').fadeOut(500);
//		 				setTimeout(function() {
//		 			$('#boardDetail').fadeIn(500);
//		 			}, 500);
					
				}	
				
		});
	
	});
	
	function detailChange(td){
		const q_no = $(td).parent().children().eq(0).text();
		
		if(${empty list}){
			//console.log('02. 번호 가져오기 실패');
			return false;
		}else{
			//console.log('02. 번호 가져오기 성공 :' +  q_no);
			//console.log('03. ajax 요청한다.');
			
			var result = "";
			$.ajax({
  				url:"helperQnaDetail.ex?q_no=" + q_no,
  				//contentType : 'application/json;charset=utf-8',
 				dataType: 'json',
 				
 				
 				success:function(data){
 					// 성공시 로직
 					//console.log(data);
 					
 					// boardDetail 초기화
 					$('#boardDetail tr:nth-child(4)').children().show();
 					$('#boardDetail tr:nth-child(5)').children().hide();
 					$('#q_no').html("");
 					$('#q_date').html("");
 					$('#an_date').html("");
 					$('#an_content').val("");
 					//var result = "";
 					for(var i in data){
 						
 						if(i=='q_no'){
 							$('#q_no').html(data[i]);
 						}
 						if(i=='q_title'){
 							$('#q_title').val(data[i]);
 						}
 						if(i=='q_content'){
 							$('#q_content').val(data[i]);
 						}
 						if(i=='q_date'){
 							
 							$('#q_date').html("("+data[i]+")");
 						}
 						if(i=='an_date'){
 							$('#an_date').html("("+data[i]+")");
 						}
 						if(i=='an_content'){
 							$('#an_content').val(data[i]);
 						}
 					}
 					var answer = $('#an_content');
 					
						if(answer.val()==""){
							$('#boardDetail tr:nth-child(4)').children().hide();
							$('#boardDetail tr:nth-child(5)').children().show();
						}
						
 				},
 				
 				error:function(request,status,errorData){
 					// 실패시 로직
 					console.log("error code :" + request.status + "\n"
 						+ "message : " + request.responseText + "\n"
 						+ "error : "  + errorData);
 				}
 			});
			
		}
	}
	
	
	
	function goShowAll() {
		location.href = "helperQnaList.ex?search=all";
	}
	function goShowY() {
		location.href = "helperQnaList.ex?search=Y";
	}
	function goShowN() {
		location.href = "helperQnaList.ex?search=N";
	}
	
 </script>
</body>
</html>