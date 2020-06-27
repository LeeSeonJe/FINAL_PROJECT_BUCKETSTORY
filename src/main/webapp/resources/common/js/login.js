// '회원'회원가입, '기업'회원가입 폼이 바뀌는 토글 스크립트
			var check = $("#insertSwt");
				check.click(function(){
					var p = $("#tp");
					if(p.text() =='회원'){
						p.text('기업').css('color', 'black');
						$('#Company').css('display','block');
						$('#User').css('display','none');
						$('#modal1').css('height', '840px');
					} else {
						p.text('회원').css('color', 'white');
						$('#User').css('display','block');
						$('#Company').css('display','none');
						$('#modal1').css('height', '650px');
					}
				});
				
// 회원 로그인, 기업 로그인 폼이 바뀌는 토글 스크립트
			var check = $("#loginSwt");
				check.click(function(){
					var p = $("#ctp");
					if(p.text() =='회원'){
						p.text('기업').css('color', 'black');
					} else {
						p.text('회원').css('color', 'white');
					}
					if(p.text()=='회원'){
						$('#login').css('display','block');
						$('#Clogin').css('display','none');
//						$('#facebookBtn').css('display', 'block');
					} else {
						$('#Clogin').css('display','block');
						$('#login').css('display','none');
						$('.input').css('background-image', '#fac 0%, hsl(0, 100%, 70%) 15%, rgba(255, 0, 0, 0.3) 28%, hsla(0, 100%, 30%, 0) 70% );');
//						$('#facebookBtn').css('display', 'none');
					}
				});		
				
// 회원 아이디 찾기, 기업 아이디 찾기 폼이 바뀌는 토글 스크립트	
			var check = $("#findSwt");
				check.click(function(){
					var p = $("#idtp");
					if(p.text() =='회원'){
						p.text('기업').css('color', 'black');
					} else {
						p.text('회원').css('color', 'white');
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
						p.text('기업').css('color', 'black');
					} else {
						p.text('회원').css('color', 'white');
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
						  $('#modal1').css({'display':'block', 'height':'650px'});
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
		
// 취소하기 버튼 누르면 모달이 꺼짐 
			$('.cancel').on('click', function(){
				$('#modal1').css('display', 'none');
				$('#modal2').css('display', 'none');
				$('#modal3').css('display', 'none');
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
		
// 로그인
			$(function(){
				check = false;
			});
			
			$('#subbtn').click(function(){
				
			});
			function validate(){
				if($('#mUserid').val().trim().length==0){
					alert('아이디를 입력해주세요');
					$('#mUserid').focus();
					return false;
				}
				if($('#mPwd').val().trim().length==0){
					alert('비밀번호를 입력해주세요');
					$('#mPwd').focus();
					return false;
				}
				var userId = $('#mUserid');
				var userPwd = $('#mPwd');
				
				$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
					url: 'memberlogin.co',
					type: 'post',
					data:{userId: userId.val(), userPwd: userPwd.val()},
					async : false,
					success: function(data){
						console.log(data);
						if(data.trim() == "fail"){
							check = false; 
						}else{
							check = true;
						}
					}
				});
				console.log(check);
				if(check){
					return true; //로그인서블릿으로
				}else{
					alert('입력하신 사항이 일치하지 않습니다 다시 확인해주세요');
					userId.focus();
					return false;
				}
			}
			
// 기업 로그인
			$(function(){
				check = false;
			});
			
			$('#subbtn2').click(function(){
				
			});
			function validate2(){
				if($('#mCoid').val().trim().length==0){
					alert('아이디를 입력해주세요');
					$('#mCoid').focus();
					return false;
				}
				if($('#mCopwd').val().trim().length==0){
					alert('비밀번호를 입력해주세요');
					$('#mCopwd').focus();
					return false;
				}
				var coId = $('#mCoid');
				var coPwd = $('#mCopwd');
				
				$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
					url: 'companylogin.co',
					type: 'post',
					data:{coId: coId.val(), coPwd: coPwd.val()},
					async : false,
					success: function(data){
						console.log(data);
						if(data.trim() == "fail"){
							check = false; 
						}else{
							check = true;
						}
					}
				});
				console.log(check);
				if(check){
					return true; //로그인서블릿으로
				}else{
					alert('입력하신 사항이 일치하지 않습니다 다시 확인해주세요');
					coId.focus();
					return false;
				}
			}
			
//	아이디 유효성 검사 ajax 중복불가
			var isidUsable = false; 	// 아이디 중복 시false, 사용가능시 true
			var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
			var re1 =/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/; //시작은 영문으로만, '_'를 제외한 특수문자 안되며 영문, 숫자, '_'으로만 이루어진 5 ~ 12자 이하
			var userId = $('#userId');
			
			$("#userId").on('change paste keyup', function(){
				isIdChecked = false;
			});
			
			function DuplIdCheck(){
				var userId = $('#userId');
				
				if(!re1.test(userId.val())){ //아이디 값이 아니거나, 아이디값이 3자보다 짧으면
					$('#userId_checked').show();
			 		$('#userId_check').hide();
					alert('아이디는 영문자로 시작하는 4~12글자 이하로 입력하세요');
					userId.focus();
				} else{
					$.ajax({
						url:'idDuplicateCheck.co',
						data:{userId: userId.val()},
						async:false,
						success: function(data){ //data로 반환 받아옴
							console.log(data);
							if(data == "true"){
								isidUsable = true;
								isIdChecked= true;
								
								if($('#userId_check').css("display")=="none"){
									$('#userId_check').show();
									$('#userId_checked').hide();
								}
							}else{
								userId.focus();
								isidUsable = false;
								isIdChecked= false;
								
							 	if($('#userId_checked').css("display")=="none"){
						 		$('#userId_checked').show();
						 		$('#userId_check').hide();
						 		alert('아이디가 중복됩니다');
							 	}
							}
						}
					});
				}
			}
			
//	기업 아이디 유효성 검사 ajax 중복불가
			var isidUsable = false; 	// 아이디 중복 시false, 사용가능시 true
			var isIdChecked = false;	// 아이디 중복확인을 했는지 안했는지 검사
			var re1 =/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/; //시작은 영문으로만, '_'를 제외한 특수문자 안되며 영문, 숫자, '_'으로만 이루어진 5 ~ 12자 이하
			var coId = $('#coId');
			
			$("#coId").on('change paste keyup', function(){
				isIdChecked = false;
			});
			
			$('#coId').change(function(){
				var coId = $('#coId');
				
				if(!re1.test(coId.val())){ //아이디 값이 아니거나, 아이디값이 3자보다 짧으면
					$('#coId_checked').show();
			 		$('#coId_check').hide();
					alert('아이디는 영문자로 시작하는 4~12글자 이하로 입력하세요');
					usercoId.focus();
				} else{
					$.ajax({
						url:'idDuplicateCheck2.co',
						data:{coId: coId.val()},
						success: function(data){ //data로 반환 받아옴
							
							if(data == "true"){
								isidUsable = true;
								isIdChecked= true;
								
								if($('#coId_check').css("display")=="none"){
									$('#coId_check').show();
									$('#coId_checked').hide();
								}
							}else{
								coId.focus();
								isidUsable = false;
								isIdChecked= false;
								
							 	if($('#coId_checked').css("display")=="none"){
						 		$('#coId_checked').show();
						 		$('#coId_check').hide();
						 		alert('아이디가 중복됩니다');
							 	}
							}
						}
					});
				}
			});
			
			/* 이름 유효성 검사 ajax 중복불가 */
			
			var isnameUsable = false; 	// 이름  false, 사용가능시 true
			var re2 = /^[가-힣]{2,}$/; // 이름 정규식
			var username = $('#userName');
			
			$('#userName').change(function(){
				var username = $('#userName');
				console.log(re2.test(username.val()))
				if(!re2.test(username.val())){
//		 			$('#nameResult').text('사용불가합니다.');
//		 			$('#nameResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('이름은 한글로 2자이상 입력하세요.');
					isnameUsable = false;
					username.focus();
					
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

/* 대표이사 유효성 검사 ajax 중복불가 */
			
			var isceoUsable = false; 	// 이름  false, 사용가능시 true
			var re45 = /^[가-힣]{2,}$/; // 이름 정규식
			var ceo = $('#ceo');
			
			$('#ceo').change(function(){
				var ceo = $('#ceo');
				
				if(!re45.test(ceo.val())){
//		 			$('#nameResult').text('사용불가합니다.');
//		 			$('#nameResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('한글로 2자이상 입력하세요.');
					isceoUsable = false;
					ceo.focus();
					
					if($('#ceo_checked').css("display")=="none"){
				 		$('#ceo_checked').show();
				 		$('#ceo_check').hide();
					 	}
					
				}else{
//		 			$('#nameResult').text('사용가능합니다.');
//		 			$('#nameResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					isceoUsable = true;

					if($('#ceo_check').css("display")=="none"){
						$('#ceo_check').show();
						$('#ceo_checked').hide();
					}
					
				}
			});
/* 신청자이름 유효성 검사 ajax 중복불가 */
			
			var isapnameUsable = false; 	// 이름  false, 사용가능시 true
			var re54 = /^[가-힣a-zA-Z\d]{2,}$/; // 이름 정규식
			var apname = $('#apName');
			
			$('#apName').change(function(){
				var apname = $('#apName');
				console.log(re54.test(apname.val()));
				if(!re2.test(apname.val())){
//		 			$('#nameResult').text('사용불가합니다.');
//		 			$('#nameResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('신청자 이름은 영문 혹은 한글로 1자 이상 입력하세요.');
					isapnameUsable = false;
					apname.focus();
					
					if($('#apname_checked').css("display")=="none"){
				 		$('#apname_checked').show();
				 		$('#apname_check').hide();
					 	}
					
				}else{
//		 			$('#nameResult').text('사용가능합니다.');
//		 			$('#nameResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					isapnameUsable = true;

					if($('#apname_check').css("display")=="none"){
						$('#apname_check').show();
						$('#apname_checked').hide();
					}
					
				}
			});
			
			/* 닉네임 유효성 검사 ajax 중복불가 */		
			var isnickUsable = false; 	// 닉네임 중복 시false, 사용가능시 true
			var isnickChecked = false;	// 닉네임 중복확인을 했는지 안했는지 검사
			var re24 = /^[가-힣a-zA-Z\d]{2,}$/; // 닉네임 정규식 한글 2자이상
			
			$('#nickName').change(function(){
				var nickName = $('#nickName');
				if(!re24.test(nickName.val())){
					alert('닉네임은 영문 혹은 한글 2자리 이상이어야 합니다.');
					nickName.focus();
					
					if($('#nickName_checked').css("display")=="none"){ //반려
				 		$('#nickName_checked').show();
				 		$('#nickName_check').hide();
					}
				} else{	
					$.ajax({
						url:'nickChk.co',
						data:{nickName: nickName.val()},
						async: false,
						success: function(data){ //data로 반환 받아옴
							console.log("?ASDF")
							console.log(data)
							if(data == "success"){
								isnickUsable = true;
								isnickChecked= true;
								
								if($('#nickName_check').css("display")=="none"){
							 		$('#nickName_check').show();
							 		$('#nickName_checked').hide();
								}
							}else{
								nickName.focus();
								isnickUsable = false;
								isnickChecked= false;
								
								if($('#nickName_checked').css("display")=="none"){
							 		$('#nickNname_checked').show();
							 		$('#nickName_check').hide();
							 		alert('닉네임 중복됩니다.');
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
			var password2 = $('#userPwd2');
			
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
			
			// 기업 비번 유효성 검사
			var iscopassUsable = false;
			var iscopassChecked = false;
			var re8 = /^[a-zA-Z\d]{7,11}$/; 
			var copassword = $('#coPwd');
			var copassword2 = $('#coPwd2');
			
			$("#coPwd").on('change paste keyup', function(){
				iscopassChecked = false;
			});
			
			$('#coPwd').change(function(){ //패스워드 1만 정규식 체크 후 
				if(!re8.test(copassword.val())){
//		 			$('#pwdResult1').text('사용 불가능 합니다.');
//		 			$('#pwdResult1').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					alert('비밀번호는 영문 7~11자리 이어야 합니다.');
					copassword.focus();
					iscopassUsable = false;
					
					if($('#coPwd_checked').css("display")=="none"){
				 		$('#coPwd_checked').show();
				 		$('#coPwd_check').hide();
					 	}
					
				} else {
//		 			$('#pwdResult1').text('사용가능합니다.');
//		 			$('#pwdResult1').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					iscopassUsable = true;
					
					if($('#coPwd_check').css("display")=="none"){
				 		$('#coPwd_check').show();
				 		$('#coPwd_checked').hide();
					 	}
				}
			});
			
			// 기업 패스워드 1과 기업 패스워트 2 동일한지 검사.
			$('#coPwd2').keyup(function(){
				if(copassword.val() == copassword2.val()){
//		 			$('#pwdResult2').text('사용가능합니다.');
//		 			$('#pwdResult2').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
					iscopassUsable = true;
					
					if($('#coPwd2_check').css("display")=="none"){
				 		$('#coPwd2_check').show();
				 		$('#coPwd2_checked').hide();
					 	}
					
				}else{
//		 			$('#pwdResult2').text('비밀번호가 일치하지 않습니다.');
//		 			$('#pwdResult2').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					copassword2.focus();
					iscopassUsable = false;
					
					if($('#coPwd2_checked').css("display")=="none"){
				 		$('#coPwd2_checked').show();
				 		$('#coPwd2_check').hide();
					 	}
					
				}
			});
			
			/* 이메일 유효성 검사 ajax 중복불가 */		
			var isemailUsable = false; 	// 이메일 중복 시false, 사용가능시 true
			var isemailChecked = false;	// 이메일 중복확인을 했는지 안했는지 검사
			var re87 = /^[a-zA-Z\d]{3,}$/; // 이메일 정규식 한글 2자, 영문2글자 이상
			var email = $('#email_1');
			
			
			$("#email_1").on('change paste keyup', function(){
				isemailChecked = false;
			});
			
			$('#email_1').change(function(){
				var email = $('#email_1');
				
				if(!re87.test(email.val())){
					alert('이메일을 올바르게 입력해 주십시오');
//		 			$('#nickResult').text('사용 불가능 합니다.');
//		 			$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					email.focus();
					
					if($('#emailResult_checked').css("display")=="none"){ //반려
				 		$('#emailResult_checked').show();
				 		$('#emailResult_check').hide();
					}
					
				} else{
					$.ajax({
						url:'emailCheck.co',
						data:{email: email.val()},
						success: function(data){ //data로 반환 받아옴
							
							if(data == "success"){
//		 						$('#nickResult').text('사용가능합니다.');
//		 						$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
								isemailUsable = true;
								isemailChecked= true;
								
								if($('#emailResult_check').css("display")=="none"){
							 		$('#emailResult_check').show();
							 		$('#emailResult_checked').hide();
								}
								
							}else{
//		 						$('#nickResult').text('사용 불가능 합니다.');
//		 						$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
								email.focus();
								isemailUsable = false;
								isemailChecked= false;
								
								if($('#emailResult_checked').css("display")=="none"){
							 		$('#emailResult_checked').show();
							 		$('#emailResult_check').hide();
								 	}
								
							}
						}
					});
				}
			});
			
			/* 기업 이메일 유효성 검사 ajax 중복불가 */		
			var isbusiemailUsable = false; 	// 이메일 중복 시false, 사용가능시 true
			var isbusiemailChecked = false;	// 이메일 중복확인을 했는지 안했는지 검사
			var re44 = /^[a-zA-Z\d]{3,}$/; // 이메일 정규식 한글 2자, 영문2글자 이상
			var busiemail = $('#busiemail_1');
			
			
			$("#busiemail_1").on('change paste keyup', function(){
				isbusiemailChecked = false;
			});
			
			$('#busiemail_1').change(function(){
				var busiemail = $('#busiemail_1');
				
				if(!re44.test(email.val())){
					alert('이메일을 올바르게 입력해 주십시오');
//		 			$('#nickResult').text('사용 불가능 합니다.');
//		 			$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
					busiemail.focus();
					
					if($('#busiemail_checked').css("display")=="none"){ //반려
				 		$('#busiemail_checked').show();
				 		$('#busiemail_check').hide();
					}
					
				} else{
					$.ajax({
						url:'emailCheck.co',
						data:{busiemail: busiemail.val()},
						success: function(data){ //data로 반환 받아옴
							
							if(data == "success"){
//		 						$('#nickResult').text('사용가능합니다.');
//		 						$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
								isbusiemailUsable = true;
								isbusiemailChecked= true;
								
								if($('#busiemail_check').css("display")=="none"){
							 		$('#busiemail_check').show();
							 		$('#busiemail_checked').hide();
								}
								
							}else{
//		 						$('#nickResult').text('사용 불가능 합니다.');
//		 						$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
								busiemail.focus();
								isbusiemailUsable = false;
								isbusiemailChecked= false;
								
								if($('#busiemail_checked').css("display")=="none"){
							 		$('#busiemail_checked').show();
							 		$('#busiemail_check').hide();
								 	}
								
							}
						}
					});
				}
			});
			
// 회원 아이디 찾기
			$(function(){
				find = false;
			});
			$('#good').click(function(){
				if($('#emailfind_1').val().trim().length==0){
					alert('이메일을 입력해주세요');
					$('#emailfind_1').focus();
				}
				if($('#emailfind_2').val().trim().length==0){
					alert('이메일을 입력해주세요');
					$('#emailfind_2').focus();
				}
				var emailfind_1 = $('#emailfind_1');
				var emailfind_2 = $('#emailfind_2');
				
				$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
					url: 'compareEmail.co',
					type: 'post',
					data:{email_1: emailfind_1.val(), email_2: emailfind_2.val()},
					async : false,
					success: function(data){
						if(data == "fail"){
							alert('이메일이 일치 하지않습니다.');
						}else{
							alert('회원님의 아이디는 '+data+' 입니다');
						}
					}
				});
			});
		

// 파일 첨부 창이 뜨도록 설정하는 함수
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

		
				
				