// 회원, 기업 폼이 바뀌는 토글 스크립트
			var check = $("#insertSwt");
				check.click(function(){
					var p = $("#tp");
					if(p.text() =='회원'){
						p.text('기업');
					} else {
						p.text('회원');
					}
					if(p.text()=='회원'){
						$('#User').css('display','block');
						$('#Company').css('display','none');
					} else {
						$('#Company').css('display','block');
						$('#User').css('display','none');
					}
				});
				
// 회원 로그인, 기업 로그인 폼이 바뀌는 토글 스크립트
			var check = $("#loginSwt");
				check.click(function(){
					var p = $("#ctp");
					if(p.text() =='회원'){
						p.text('기업');
					} else {
						p.text('회원');
					}
					if(p.text()=='회원'){
						$('#login').css('display','block');
						$('#Clogin').css('display','none');
					} else {
						$('#Clogin').css('display','block');
						$('#login').css('display','none');
					}
				});		
				
// 회원 아이디 찾기, 기업 아이디 찾기 폼이 바뀌는 토글 스크립트	
			var check = $("#findSwt");
				check.click(function(){
					var p = $("#idtp");
					if(p.text() =='회원'){
						p.text('기업');
					} else {
						p.text('회원');
					}
					if(p.text()=='회원'){
						$('#MemidFind').css('display','block');
						$('#ComidFind').css('display','none');
					} else {
						$('#ComidFind').css('display','block');
						$('#MemidFind').css('display','none');
					}
				});	
				
// 회원 비번찾기, 기업 비번찾기 폼이 바뀌는 토글 스크립트
			var check = $("#findpwdSwt");
				check.click(function(){
					var p = $("#pwdtp");
					if(p.text() =='회원'){
						p.text('기업');
					} else {
						p.text('회원');
					}
					if(p.text()=='회원'){
						$('#MempwdFind').css('display','block');
						$('#CompwdFind').css('display','none');
					} else {
						$('#CompwdFind').css('display','block');
						$('#MempwdFind').css('display','none');
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
			
			$('#selectIdEmail').change(function() {
				$("#selectIdEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#emailfind_2").val(''); //값 초기화 
						$("#emailfind_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#emailfind_2").val($(this).text()); //선택값 입력 
						$("#emailfind_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
			$('#selectpwdBusiEmail').change(function() {
				$("#selectpwdBusiEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#busiemailfind_2").val(''); //값 초기화 
						$("#busiemailfind_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#busiemailfind_2").val($(this).text()); //선택값 입력 
						$("#busiemailfind_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
			$('#memPwdEmail').change(function() {
				$("#memPwdEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#pwdfind_2").val(''); //값 초기화 
						$("#pwdfind_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#pwdfind_2").val($(this).text()); //선택값 입력 
						$("#pwdfind_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
			$('#coPwdEmail').change(function() {
				$("#coPwdEmail option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우 
						$("#copwdfind_2").val(''); //값 초기화 
						$("#copwdfind_2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#copwdfind_2").val($(this).text()); //선택값 입력 
						$("#copwdfind_2").attr("disabled", false); //비활성화 
					}
				});
			});
			
// 페이스북 로그인 스크립트 
			window.fbAsyncInit = function() {
				FB.init({
				  appId      : '553110938733873',
				  cookie     : true,  // enable cookies to allow the server to access 
				                      // the session
				  xfbml      : true,  // parse social plugins on this page
				  version    : 'v2.8' // use graph api version 2.8
				});
				
			(function(d, s, id) {
			      var js, fjs = d.getElementsByTagName(s)[0];
			      if (d.getElementById(id)) return;
			      js = d.createElement(s); js.id = id;
			      js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=553110938733873";
			      fjs.parentNode.insertBefore(js, fjs);
			    }(document, 'script', 'facebook-jssdk'));
			}
				
//			  /* 아이디 유효성 검사 ajax 중복불가*/
			var isidUsable = false; 	// 아이디 중복 시false, 사용가능시 true
			var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
			var re1 =/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/; //시작은 영문으로만, '_'를 제외한 특수문자 안되며 영문, 숫자, '_'으로만 이루어진 5 ~ 12자 이하

			$("#userId").on('change paste keyup', function(){
				isIdChecked = false;
			});
			
			$('#userId').change(function(){
				var userId = $('#userId');
				
				if(!re1.test(userId.val())){ //아이디 값이 아니거나, 아이디값이 3자보다 짧으면
					alert('아이디는 영문자로 시작하는 4~12글자 이하로 입력하세요.');
					userId.focus();
				} else{
					$.ajax({
						url:'dupid.co',
						data:{userId: userId.val()},
						success: function(data){ //data로 반환 받아옴
							
							if(data == "success"){
//		 						$('#idResult').text('사용가능합니다.');
//		 						$('#idResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
								isidUsable = true;
								isIdChecked= true;
								
								if($('#userId_check').css("display")=="none"){
									$('#userId_check').show();
									$('#userId_checked').hide();
								}
								
							}else{
//		 						$('#idResult').text('사용 불가능 합니다.');
//		 						$('#idResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
								userId.focus();
								isidUsable = false;
								isIdChecked= false;
								
							 	if($('#memberid_checked').css("display")=="none"){
						 		$('#memberid_checked').show();
						 		$('#memberid_check').hide();
							 	}
								
							}
						}
					});
				}
			});
			
			/* 이름 유효성 검사 ajax 중복불가 */
			
			var isnameUsable = false; 	// 이름  false, 사용가능시 true
			var re2 = /^[가-힣]{2,}$/; // 이름 정규식
			
			$('#userName').change(function(){
				var membername = $('#userName');
				
				if(!re2.test(username.val())){
//		 			$('#nameResult').text('사용불가합니다.');
//		 			$('#nameResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('이름은 한글로 2자이상 입력하세요.');
					isnameUsable = false;
					membername.focus();
					
					if($('#userName_checked').css("display")=="none"){
				 		$('#userName_checked').show();
				 		$('#userName_check').hide();
					 	}
					
				}else{
//		 			$('#nameResult').text('사용가능합니다.');
//		 			$('#nameResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					isnameUsable = true;

					if($('#userName_check').css("display")=="none"){
						$('#userName_check').show();
						$('#userName_checked').hide();
					}
					
				}
			});
			
			/* 닉네임 유효성 검사 ajax 중복불가 */		
			var isnickUsable = false; 	// 닉네임 중복 시false, 사용가능시 true
			var isnickChecked = false;	// 닉네임 중복확인을 했는지 안했는지 검사
			var re3 = /^[가-힣a-zA-Z\d]{2,}$/; // 닉네임 정규식 한글 2자이상
			
			
			$("#nickName").on('change paste keyup', function(){
				isnickChecked = false;
			});
			
			$('#nickName').change(function(){
				var userNick = $('#nickName');
				
				if(!re3.test(userNick.val())){
					alert('닉네임은 영문 혹은 한글 2자리 이상이어야 합니다.');
//		 			$('#nickResult').text('사용 불가능 합니다.');
//		 			$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					userNick.focus();
					
					if($('#nickName_checked').css("display")=="none"){ //반려
				 		$('#nickName_checked').show();
				 		$('#nickName_check').hide();
					}
					
				} else{
					$.ajax({
						url:'<%= request.getContextPath() %>/nickNameCheck.mem',
						data:{userNick: userNick.val()},
						success: function(data){ //data로 반환 받아옴
							
							if(data == "success"){
//		 						$('#nickResult').text('사용가능합니다.');
//		 						$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
								isnickUsable = true;
								isnickChecked= true;
								
								if($('#nickName_check').css("display")=="none"){
							 		$('#nickName_check').show();
							 		$('#nickName_checked').hide();
								}
								
							}else{
//		 						$('#nickResult').text('사용 불가능 합니다.');
//		 						$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
								userNick.focus();
								isnickUsable = false;
								isnickChecked= false;
								
								if($('#nickName_checked').css("display")=="none"){
							 		$('#nickNname_checked').show();
							 		$('#nickName_check').hide();
								 	}
								
							}
						}
					});
				}
			});
			
			/* 비밀번호 유효성 검사 ajax 중복불가 */		
			var ispassUsable = false;
			var ispassChecked = false;
			var re4 = /^[a-zA-Z\d]{7,11}$/; 
			var password = $('#userPwd');
			var password2 = $('#userpwd2');
			
			$("#userPwd").on('change paste keyup', function(){
				ispassChecked = false;
			});
			
			$('#userPwd').change(function(){ //패스워드 1만 정규식 체크 후 
				if(!re4.test(password.val())){
//		 			$('#pwdResult1').text('사용 불가능 합니다.');
//		 			$('#pwdResult1').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('비밀번호는 영문 7~11자리 이어야 합니다.');
					password.focus();
					ispassUsable = false;
					
					if($('#userPwd_checked').css("display")=="none"){
				 		$('#userPwd_checked').show();
				 		$('#userPwd_check').hide();
					 	}
					
				} else {
//		 			$('#pwdResult1').text('사용가능합니다.');
//		 			$('#pwdResult1').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					ispassUsable = true;
					
					if($('#userPwd_check').css("display")=="none"){
				 		$('#userPwd_check').show();
				 		$('#userPwd_checked').hide();
					 	}
				}
			});
			
			//패스워드 1과 패스워트 2 동일한지 검사.
			$('#userPwd2').keyup(function(){
				if(password.val() == password2.val()){
//		 			$('#pwdResult2').text('사용가능합니다.');
//		 			$('#pwdResult2').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					ispassUsable = true;
					
					if($('#userPwd2_check').css("display")=="none"){
				 		$('#userPwd2_check').show();
				 		$('#userPwd2_checked').hide();
					 	}
					
				}else{
//		 			$('#pwdResult2').text('비밀번호가 일치하지 않습니다.');
//		 			$('#pwdResult2').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					password2.focus();
					ispassUsable = false;
					
					if($('#userPwd2_checked').css("display")=="none"){
				 		$('#userPwd2_checked').show();
				 		$('#userPwd2_check').hide();
					 	}
					
				}
			});
				
			//기존아디와 현재아디가 일치하는지 확인
	     	$('#userId').change(function(){
	     		var id = $('#userId').val();
	     		
			$.ajax({  //현재 아이디 보내서 비교해서 값을 받아오기
				url: '<%= request.getContextPath() %>/mempwdFind.co',
				data: {id:id},
				success: function(data){
					console.log(data);
				
				if(data == 'success'){
					isidUsable = true;
					isIdChecked= true;
					if($('#pwdChkResult_check').css("display")=="none"){
						$('#pwdChkResult_check').show();
						$('#pwdChkResult_checked').hide();
					}
				}else{
					userId.focus();
					isidUsable = false;
					isIdChecked= false;
					
				 	if($('#pwdChkResult_checked').css("display")=="none"){
			 		$('#pwdChkResult_checked').show();
			 		$('#pwdChkResult_check').hide();
				 	}
				}

				}
	        });
	     });	
	     	
	     	$('#coId').change(function(){
	     		var id = $('#coId').val();
	     		
			$.ajax({  //현재 아이디 보내서 비교해서 값을 받아오기
				url: '<%= request.getContextPath() %>/compwdFind.co',
				data: {id:id},
				success: function(data){
					console.log(data);
				
				if(data == 'success'){
					isidUsable = true;
					isIdChecked= true;
					if($('#pwdChkResult2_check').css("display")=="none"){
						$('#pwdChkResult2_check').show();
						$('#pwdChkResult2_checked').hide();
					}
				}else{
					userId.focus();
					isidUsable = false;
					isIdChecked= false;
					
				 	if($('#pwdChkResult2_checked').css("display")=="none"){
			 		$('#pwdChkResult2_checked').show();
			 		$('#pwdChkResult2_check').hide();
				 	}
				}

				}
	        });
	     });			


// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				$(function(){
					
					$("#inputImg").hide();
					$('.fileInput').click(function(){
						$("#checkImg").click();
					});
				});
				
				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				function LoadImg(value, num){
					if(value.files && value.files[0]){
						var reader = new FileReader();
						
						reader.onload = function(e){								
								$("#inputImg").attr("src", e.target.result);
								$("#inputImg").show();
								$("#basicImg").hide();
							}
						
						reader.readAsDataURL(value.files[0]);
					}
				}

// 아이디 찾기				
				
// 비밀번호 찾기		
				$(function(){
					$("#").hide();
					$('.fileInput').click(function(){
						$("#checkImg").click();
					});
				});	  
