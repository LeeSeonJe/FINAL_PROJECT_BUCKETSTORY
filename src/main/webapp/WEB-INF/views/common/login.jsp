<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/common/css/login.css">
<title>Insert title here</title>
<style>
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="loginback"> <!-- 뒷 배경 -->
		<div id="modal1" class="modal"> <!-- 모달 -->
			<div id="noblur" class="modal"> <!-- 모달2 -->
			 <a class="joinBtn2-close trigger">
		        <i aria-hidden="true"></i>
		      </a>
		      
		    	<!-- 회원, 기업 변경 스위치 -->
		    	<label class="switch">
					<input type="checkbox" id="insertSwt">
					<span class="slider round"></span>
				</label>
				<p id="tp" style="color: white;">회원</p>

<!-- -------------------- 유저 회원가입폼 -------------------- -->
		
		    <form action="memberIn.co" method="post">
			<table id="User" cellpadding="0" cellspacing="20">
					<tr>
						<th align=right><label class="must"></label>아이디</th>
						<td><input type="text" id="userid" name="userId" class="user" maxlength="15" required>
							<label id="idResult"></label>
							<img id="userId_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userId_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
<!-- 						<span><button id="idCheck" onclick="checkId();">중복확인</button></span> -->
<!-- 							<td width="200px"><label id="idResult"></label></td> -->
					</tr>
					<tr>
						<th align=right><label class="must"></label>이름</th>
						<td>
						<input type="text" id="username" name="userName" class="user" maxlength="10" required>
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>닉네임</th>
						<td><input type="text" id="nickname" name="nickName" class="user" maxlength="10" required>
							<label id="nickResult"></label>
							<img id="nickName_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="nickName_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
<!-- 								<span><button id="nickCheck" onclick="checkNick();">중복확인</button></span> -->
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호</th>
						<td>
							<input type="password" id=userpwd name="userPwd" class="user">
							<img id="userPwd_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userPwd_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호 재확인</th>
						<td>
							<input type="password" id="userpwd2" name="userPwd2" class="user">
							<img id="userPwd2_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userPwd2_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>생년월일</th>
						<td><select id="birth_year" name="birthY" class="user">
								<option>년</option>
								<% for(int i=1950; i<2020;i++){ %>
								<option><%= i %></option>
								<% } %>
							</select>년
						<select id="birth_month" name="birthM" class="user">
								<option class="member">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>월
						<select name="birthD">
								<option>일</option>
								<% for(int i=1;i<=31;i++){ %>
								<% if(i<10){ %>
								<option>0<%= i %></option>
								<% } else{ %>
								<option><%= i %></option>
								<% } %>
								<% } %>
						</select>일
						</td>
					</tr>
					<tr>
						<th align=right>성별</th>
						<td><input type="radio" id="gender_F" name="gender" checked="checked"
							class="member" value="F" style='cursor:pointer'><label>여자</label> <input
							type="radio" id="gender_M" name="gender" class="user"
							value="M" style='cursor:pointer'><label>남자</label></td>
					</tr>
					<tr>
						<th align=right>전화번호</th>
							<td>
								<input type="tel" maxlength="11" id="phone" name="phone" class="user" placeholder="(-없이)">
							</td>
						</tr>
					<tr>
						<th align=right>본인 확인 이메일</th>
						<td>
							<input type="text" id="email_1" name="email_1" class="user" style="width: 100px;">@ 
							<input type="text" id="email_2" name="email_2" style="width: 100px;" disabled> 
								<select id="selectEmail" name="selectEmail" style="width: 100px; margin-right: 10px">
										<option Selected>::선택하세요::</option>
										<option value="1">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
								</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
							<label id="emailResult"></label>
							<img id="emailResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="emailResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>인증 번호 확인</th>
						<td>
						<input type="number" id="email_injeung" name="email_injeung" class="user" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							<!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<tr>
						<td><button id="reset" type="reset" style='cursor:pointer'>초기화</button></td>
					</tr>
					<tr>
						<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
						<td><button id="finish" onclick="validate(); location.href='main.ho'" style='cursor:pointer'>가입하기</button></td>
					</tr>
				</table>
				</form>
				
<!-- -------------------- 회사 회원가입폼 -------------------- -->
				<form action="CompanyIn.co" method="post" enctype="Multipart/form-data">
				<table id="Company" cellpadding="0" cellspacing="20">
					<tr>
						<th align=right><label class="must"></label>아이디</th>
						<td><input type="text" id="coid" name="coId" class="coid" maxlength="15" required>
						<label id="idResult"></label></td>
<!-- 						<span><button id="idCheck" onclick="checkId();">중복확인</button></span> -->
<!-- 							<td width="200px"><label id="idResult"></label></td> -->
					</tr>
					<tr>
						<th align=right>비밀번호</th>
						<td><input type="password" id=copwd name="coPwd"
							class="member"></td>
					</tr>
					<tr>
						<th align=right>비밀번호 재확인</th>
						<td><input type="password" id="copwd2" name="copwd2"
							class="member"></td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>기업명</th>
						<td>
							<input type="text" id="coname" name="coName" class="coname">
						</td>
					</tr>
					<tr>
						<th align=right>기업 인증 사진</th>
						<td>
							<input type=file name='uploadFile' style='display: none;' id="checkImg" multiple="multiple" onchange="LoadImg(this,1)">  
							<img src="resources/common/images/3dBuilding.png" border='0' class="fileInput" id="basicImg" width="100px" height="100px" style='cursor:pointer;'>
							<img border='0' id="inputImg" width="100px" height="100px" class="fileInput" style='cursor:pointer;'>
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>업종명</th>
						<td>
						<input type="text" id="companame" name="compaName" class="companame">
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>대표이사 이름</th>
						<td>
							<input type="text" id="ceo" name="ceo" class="ceo" maxlength="10" required>
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>신청자 이름</th>
						<td>
							<input type="text" id="apname" name="apName" class="apname">
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>홈페이지</th>
						<td>
							<input type="text" id="homepage" name="homePage" class="homepa" value="http://">
						</td>
					</tr>
					<tr>
						<th align=right>전화번호</th>
							<td>
								<input type="tel" maxlength="11" id="cotel" name="coTel" class="cotel" placeholder="(-없이)">
							</td>
					</tr>
					<tr>
						<th align=right>기업 전문가 여부</th>
						<td>
							<input type="radio" id="cpCheck_Y" name="cpCheck" checked="checked"
							class="company" style='cursor:pointer' value="1"><label>기업</label> 
							<input type="radio" id="cpCheck_N" name="cpCheck" class="company"
							style='cursor:pointer' value="2"><label>전문가</label>
						</td>
					</tr>
					<tr>
						<th align=right>카테고리</th>
						<td>
							<select id="cateNum" name="cateNum">
								<option value="1">Travel</option>
								<option value="2">Sport</option>
								<option value="3">Food</option>
								<option value="4">New Skill</option>
								<option value="5">Culture</option>
								<option value="6">Outdoor</option>
								<option value="7">Shopping</option>
								<option value="8">LifeStyle</option>
							</select>
						</td>
					</tr>
					<tr>
						<th align=right>기업 확인 이메일</th>
						<td>
							<input type="text" id="busiemail_1" name="busiemail_1" class="company" style="width: 100px;">@ 
							<input type="text" id="busiemail_2" name="busiemail_2" style="width: 100px;" disabled> 
								<select id="selectBusiEmail" name="selectBusiEmail" style="width: 100px; margin-right: 10px">
										<option Selected>::선택하세요::</option>
										<option value="1">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
								</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<tr>
						<th align=right>인증 번호 확인</th>
						<td>
						<input type="text" id="email_injeung" name="email_injeung" class="company" placeholder="인증번호를 입력하세요.">
							<span>
								<button>인증메일</button>
							</span>
							<!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<tr>
						<td><button id="reset" type="reset" style='cursor:pointer'>초기화</button></td>
					</tr>
					<tr>
						<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
						<td><button id="finish" style='cursor:pointer'>가입하기</button></td>
					</tr>
				</table>
				</form>
				</div>
			</div>	
		
<!-------------------- 아이디찾기 모달 -------------------->	
		<div id="modal2" class="modal">
			 <a class="joinBtn2-close trigger2">
		        <i aria-hidden="true"></i>
		      </a>
		      
		      <!-- 회원, 기업 아이디 변경 스위치 -->
		    	<label class="switch">
					<input type="checkbox" id="findSwt">
					<span class="slider round"></span>
				</label>
				<p id="idtp" style="color: white;">회원</p>
				
			  <!-- 회원 아이디 찾기 -->
		      <form id="MemidFind" action="memberidFind.co" method="post">
		      <h4 align=center>회원 아이디 찾기</h4>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>E-mail</th>
				<td>
					<input type="text" id="emailfind_1" name="emailfind_1" class="ID_find" style="width: 100px;">@ 
					<input type="text" id="emailfind_2" name="emailfind_2" style="width: 100px;" disabled> 
						<select id="selectIdEmail" name="selectIdEmail" style="width: 100px; margin-right: 10px">
								<option Selected>::선택하세요::</option>
								<option value="1">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
						</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
					</td>
					<tr>
						<th align=right>인증 번호 확인</th>
					<td>
						<input type="text" id="email_injeung" name="email_injeung" class="user" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							<!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<tr>
						<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
						<td><button id="finish" style='cursor:pointer'>확인</button></td>
					</tr>
				</tr>
		    </table>
		    </form>
		    <!-- 기업 아이디 찾기 -->
		     <form id="ComidFind" action="companyidFind.co" method="post">
		      <h4 align=center>기업 아이디 찾기</h4>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="busiemailfind_1" name="busiemailfind_1" class="ID_find2" style="width: 100px;">@ 
						<input type="text" id="busiemailfind_2" name="busiemailfind_2" style="width: 100px;" disabled> 
							<select id="selectpwdBusiEmail" name="selectpwdBusiEmail" style="width: 100px; margin-right: 10px">
									<option Selected>::선택하세요::</option>
									<option value="1">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
					</td>
					<tr>
						<th align=right>인증 번호 확인</th>
						<td>
						<input type="text" id="email_injeung" name="email_injeung" class="company" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							<!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<tr>
						<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
						<td><button id="finish" style='cursor:pointer'>확인</button></td>
					</tr>
				</tr>
		    </table>
		    </form>
		</div>
		
<!-------------------- 비번찾기 모달 -------------------->	
		<div id="modal3" class="modal" >
			 <a class="joinBtn2-close trigger3">
		        <i aria-hidden="true"></i>
		      </a>
		      
		       <!-- 회원, 기업 비번찾기 변경 스위치 -->
		    	<label class="switch">
					<input type="checkbox" id="findpwdSwt">
					<span class="slider round"></span>
				</label>
				<p id="pwdtp" style="color: white;">회원</p>
				
		      <!-- 회원 비번 찾기 -->
		      <form id="MempwdFind" action="mempwdFind.co" method="post">
		      <h4 align=center>회원 비밀번호 찾기</h4>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>ID</th>
					<td><input type="text" id=pwd_find  name="pwd_find" class="pwd_find"></td>
					<img id="pwdChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
					<img id="pwdChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
				</tr>
				<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="pwdfind_1" name="pwdfind_1" class="PWD_find" style="width: 100px;">@ 
						<input type="text" id="pwdfind_2" name="pwdfind_2" style="width: 100px;" disabled> 
							<select id="memPwdEmail" name="memPwdEmail" style="width: 100px; margin-right: 10px">
									<option Selected>::선택하세요::</option>
									<option value="1">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
					</td>
				</tr>
				<tr>
					<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
					<td><button id="finish" style='cursor:pointer'>확인</button></td>
				</tr>
		      </table>
		      </form>
		       <!-- 기업 비번 찾기 -->
		      <form id="CompwdFind" action="compwdFind.co" method="post">
		      <h4 align=center>기업 비밀번호 찾기</h4>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>ID</th>
					<td><input type="text" id=copwd_find  name="copwd_find" class="copwd_find"></td>
					<img id="pwdChkResult2_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
					<img id="pwdChkResult2_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
				</tr>
				<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="copwdfind_1" name="copwdfind_1" class="coPWD_find" style="width: 100px;">@ 
						<input type="text" id="copwdfind_2" name="copwdfind_2" style="width: 100px;" disabled> 
							<select id="coPwdEmail" name="coPwdEmail" style="width: 100px; margin-right: 10px">
									<option Selected>::선택하세요::</option>
									<option value="1">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
					</td>
				</tr>
				<tr>
					<td><button id="cancel" style='cursor:pointer'>취소하기</button></td>
					<td><button id="finish" style='cursor:pointer'>확인</button></td>
				</tr>
		      </table>
		      </form>
		</div>
		
		<!-------------------- 오른쪽 로그인폼 -------------------->
		<div id="rightForm">
			<!-- 회원 로그인, 기업 로그인 변경 스위치 -->
		    	<label class="switch">
					<input type="checkbox" id="loginSwt">
					<span class="slider round"></span>
				</label>
				<p id="ctp" style="color: white;">회원</p> 
				
			<!-- 유저 로그인 -->
			<form id="login" action="memberlogin.co" method="post"> 
				<div id="idPwdInput">
					<div id="loginlogo">
						<img id="loginlogo"  style="display:none;" src="resources/common/images/LogoWhite.png" width="50px" height="50px" />
					</div>
					<input name="userId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input name="userPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<input id="subbtn" type="submit" value="Login" style='cursor:pointer;margin-left:8px;margin-top:40px'>
				</div>
			</form>
			
			<!-- 컴퍼니 로그인 -->
			<form id="Clogin" action="companylogin.co" method="post"> 
				<div id="idPwdInput">
					<div id="loginlogo" style="color: white">BucketStory</div>
					<input name="coId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input name="coPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<input id="subbtn" type="submit" value="Login" style='cursor:pointer;margin-left:8px;margin-top:40px'>
				</div>
			</form>
			
			<div id="join">
				<button class="joinBtn3" style='cursor:pointer'>아이디 찾기</button>
			</div>
			<div id="join2">
				<button class="joinBtn4" style='cursor:pointer'>비밀번호 찾기</button>
			</div>
			<div class="page-wrapper">
				<button class="joinBtn2" id="joinBtn2" style='cursor:pointer'>회원가입</button>
				<!-- <a class="joinBtn2" id="joinBtn2" href="#" style='cursor:pointer' >회원가입</a> -->
				<!-- <button class="joinBtn2" href="leftForm" style='cursor:pointer'>회원가입</button> -->
			</div>
			<hr color="white">
			<div>
				<button id="facebookBtn" style='cursor:pointer'><img src="resources/common/images/facebook.png" width="24px" height="24px">&ensp;Facebook으로 로그인</button>
			</div>
			<div id="fb-root"></div>
		</div>
	</div>
	<script type="text/javascript" src="resources/common/js/login.js"></script>
</body>
</html>