// 기업용
/*
 * 초기 로드시 우측에 안내문구
 */

window.onload = function(){
	$('#moba-content').html('<div style="color:#333; font-size:25px; transform:translate(30px,100px);"><b>안녕하세요<br>"Q&A"<br>센터입니다.</b></div>');
// 	$('#board-area').fadeIn(500);
	
}

/*
 * 요청 URL 링크
 */
function goShowAll() { location.href = "helperQnaList.ex?search=all";}
function goShowY() {location.href = "helperQnaList.ex?search=Y";}
function goShowN() {location.href = "helperQnaList.ex?search=N";}

/*====================================================
 * QnA 작성 : Ajax
 ====================================================*/

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

/*===========================================================
 * Q&A 수정 : Ajax
 * ===========================================================
 */
	function qnaUpdate(){
		//var check = confirm('수정합니다.');
		var check = true;
		var q_no = $('#q_no').text();
		var q_title = $('#q_title').val();
		var q_content = $('#q_content').val();
		
		
		console.log(q_no);
		console.log(q_title);
		console.log(q_content);
//		console.log(answer)
		
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
 							$('#boardDetail').fadeOut(700);
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
	
/*===========================================================
 * Q&A 삭제 : Ajax
 ===========================================================*/
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
	 							$('#boardDetail').fadeOut(700);
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
		
/* ==================================================
 * QnA 게시판 마우스 오버,아웃, 클릭 이벤트 =>detailChange
  ================================================== */
		$(function() {
//			var check = $('#isListNull').val();
//			console.log(check);
			$('#boardQnA td').mouseenter(function() {
				$(this).parent().css({
					'background' : 'pink',
					'cursor' : 'pointer',
				})
			}).mouseout(function() {
				$(this).parent().css({
					'background' : 'whitesmoke'
				})
//				$('#boardDetail').hide();
			}).click(function() {
//				console.log('클릭했다');
				$(this).parent().css({
					'background' : 'beige'
				})			
					if($('#isListNull').val()){
						return false;
					}else{
						
						$('#boardDetail').show();
						$('#boardDetail').css({'zoom':'1.3','transform':'translateX(-120px)'});
						$text = '<div style="color:pink; font-size:25px; transform:translate(30px,100px);"><b><span style="color:red">'
						+ $(this).parent().children().eq(0).text() +
						'</span><br>번 문의글<br>상세보기</b></div>'
						
						$('#moba-content').html($text);
						detailChange(this);
						// 문의 상세보기 폼 show
//			 			$('#board-area').fadeOut(500);
//			 				setTimeout(function() {
//			 			$('#boardDetail').fadeIn(500);
//			 			}, 500);
					}		
			});
		});
	
/* ==========================================
 * QnA 게시글 상세보기(detailChange) : Ajax
 * ============================================
 */
	
	function detailChange(td){
		const q_no = $(td).parent().children().eq(0).text();
		
		if($('#isListNull').val()){
			return false;
		}else{
			var result = "";
			$.ajax({
  				url:"helperQnaDetail.ex?q_no=" + q_no,
  				//contentType : 'application/json;charset=utf-8',
 				dataType: 'json',
 				
 				success:function(data){
 					// 성공시 로직
 					//console.log(data);
 					//alert(data['answer']);
 					
 					// boardDetail 초기화
 					$('#boardDetail tr:nth-child(4)').children().show();
 					$('#boardDetail tr:nth-child(5)').children().hide();
 					$('#q_no').html("");
 					$('#q_date').html("");
 					$('#an_date').html("");
 					$('#an_content').val("");
 					$('#an_date').html("");
 					//var result = "";
					
 					for(var i in data){
 						// 일치하면 한번씩만 실행된다.
 						if(i=='q_no'){ 	$('#q_no').html(data[i]);	console.log(data['q_no']);}
 						if(i=='q_title'){$('#q_title').val(data[i]);}
 						if(i=='q_content'){	$('#q_content').val(data[i]);}
 						if(i=='q_date'){$('#q_date').html("("+data[i]+")");	}
 						if(i=='answer'){$('#answer').val(data[i]);	console.log(data['answer']);}
 						if(i=='an_date'){$('#an_date').html("("+data[i]+")");}
 						if(i=='an_content'){$('#an_content').val(data[i]);}
 						
 						// 일차하지 않아도 중복 실행된다.
 						//console.log(data['q_no']);
// 						$('#q_no').html(data['q_no']);	
// 						$('#q_title').val(data['q_title']);
// 						$('#q_content').val(data['q_content']);
// 						$('#q_date').html("("+data['q_date']+")");	
// 						$('#an_date').html("("+data['an_date']+")");
// 						$('#an_content').val(data['an_content']);
 					}
 					
 					// 답변이 완료된 문의글은 수정이 불가능하게 한다. 수정버튼 안보이기
// 					alert($('#answer').val());
 					if($('#answer').val()=='Y'){
 						$('#qnaEdit').hide();
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
	$('#overlay').css('top','-2px');
	   $('#sidewrap').css('top','56px');

	$('.gnb_menu .gnb_menu_ul li a.gnb4').css('background','url("resources/layout/images/bg04_on.jpg") no-repeat 0 center #f3f3f2');
	   $('.gnb_menu .gnb_menu_ul li a.gnb4 .ico').css('background', 'url("resources/layout/images/ico04_on.png") no-repeat 0 0');
	   $('.gnb_menu .gnb_menu_ul li a.gnb4 .text span').css('color','#fff');
	   if('${loginUser}' != ""){
	      $('.gnb_menu .gnb_menu_ul li a .text:eq(3)').css('color', '#fff');
	   }
	   if('${loginCompany}' != ""){
	      $('.gnb_menu .gnb_menu_ul li a .text:eq(2)').css('color', '#fff');
	   }
	   $('.gnb_menu a').css('text-decoration','none');
	
	