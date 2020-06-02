// 회원, 기업 폼이 바뀌는 토글 스크립트
			var check = $("input[type='checkbox']");
				check.click(function(){
					if($("p").toggle('#User')=='none'){
						$('#User').css('display','block');
						$('#Company').css('display','none');
					} else {
						$('#Company').css('display','block');
						$('#User').css('display','none');
					}
				});
		
		
// 회원가입 버튼 누루면 나타나는 스크립트 
			$(function() {
				  $('.joinBtn2').on('click', function() {
					  if($('#modal1').css('display') == 'none'){
						  $('#modal1').css('display','block');
						  $('#modal2').css('display','none');
						  $('#modal3').css('display','none');
					  } else{
						  $('#modal1').css('display','none');
					  }
				  });
				});
		
// 아이디 찾기 누르면 나타나는 스크립트 
			$(function() {
				  $('.joinBtn3').on('click', function() {
					  if($('#modal2').css('display') == 'none'){
						  $('#modal2').css('display','block');
						  $('#modal1').css('display','none');
						  $('#modal3').css('display','none');
						  $('.loginback').on('blurEffect');
					  } else{
						  $('#modal2').css('display','none');
					  }
				  });
				});
		
// 비밀번호 찾기 누르면 나타나는 스크립트 -->
			$(function() {
				  $('.joinBtn4').on('click', function() {
					  if($('#modal3').css('display') == 'none'){
						  $('#modal3').css('display','block');
						  $('#modal1').css('display','none');
						  $('#modal2').css('display','none');
						  $('.loginback').on('blurEffect');
					  } else{
						  $('#modal3').css('display','none');
					  }
				  });
				});
		
// 취소하기 버튼 누르면 취소됨 
			$(function() {
				  $('.cancel').on('click', function() {
					  if($('#modal1').css('display') == 'none'){
						  $('#modal1').css('display','none');
					  } 
				  });
				});
		
// 이메일 직접입력 스크립트		
			$('#selectEmail').change(function() {
				$("#selectEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#email_2").val(''); //값 초기화 
						$("#email_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#email_2").val($(this).text()); //선택값 입력 
						$("#email_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
			$('#selectBusiEmail').change(function() {
				$("#selectBusiEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#busiemail_2").val(''); //값 초기화 
						$("#busiemail_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#busiemail_2").val($(this).text()); //선택값 입력 
						$("#busiemail_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
// 페이스북 로그인 스크립트 
				function statusChangeCallback(response) {
				  console.log('statusChangeCallback');
				  console.log(response);
				  if (response.status === 'connected') {
				      alert("로그인 되었습니다.")
				      $('#status').after('<button id="logout">로그아웃</button>');
				    testAPI();
				  } else {
				    document.getElementById('status').innerHTML = 'Please log ' +
				      'into this app.';
				  }
				}
				
				function checkLoginState() {
				  FB.getLoginStatus(function(response) {
				    statusChangeCallback(response);
				  });
				}
				
				window.fbAsyncInit = function() {
				FB.init({
				  appId      : '553110938733873',
				  cookie     : true,  // enable cookies to allow the server to access 
				                      // the session
				  xfbml      : true,  // parse social plugins on this page
				  version    : 'v2.8' // use graph api version 2.8
				});
				
				FB.getLoginStatus(function(response) {
				  statusChangeCallback(response);
				});
				
				};
				
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "https://connect.facebook.net/en_US/sdk.js";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
				
				function testAPI() {
				  console.log('Welcome!  Fetching your information.... ');
				  FB.api('/me',{fields:'email,name'}, function(response) {
				    console.log('Successful Name: ' + response.name);
				    console.log('Successful Email: ' + response.email);
				    
				    // javascript형식 문자열 추가하기
				    document.getElementById('status').innerHTML =
				      '페이스북 로그인되었습니다. ' + response.name + '님!';
				    
				    //jQuery형 문자열 추가하기
				    $('#userInfo').html("이름 : "+response.name+" 메일 :"+response.email);
				    
				  });
				}
				
				  $(document).on("click","#logout",function(){ 
				      FB.logout(function(response) {
				         // Person is now logged out
				             alert("로그아웃 되었습니다.");
				             location.reload();
				      });
				    });
