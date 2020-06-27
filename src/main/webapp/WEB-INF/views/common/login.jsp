<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/common/css/login.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>LOGIN</title>
<style>
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="loginback"> <!-- 뒷 배경 -->
		<div id="modal1" class="modal"> <!-- 모달 -->
			<div id="blur" class="overlay"> <!-- 블러모달 -->
			 <a class="joinBtn2-close trigger">
		        <i aria-hidden="true"></i>
		      </a>
		      
		    	<!-- 회원, 기업 변경 스위치 -->
		    	<div id="toggle" style="float:right; margin-top: 5px;">
			    	<label class="switch" >
						<input type="checkbox" id="insertSwt">
						<span class="slider round"></span>
					</label>
					<p id="tp" style="color: white;">회원</p>
				</div>
				<br>
<!-- -------------------- 유저 회원가입폼 -------------------- -->
		    <form action="memberIn.co" method="post" style="margin-top:20px;">
			<table id="User" cellpadding="0" cellspacing="20">
					<tr>
						<th align=right><label class="must"></label>아이디</th>
						<td><input type="text" id="userId" name="userId" class="user" maxlength="15" required onchange="DuplIdCheck();">
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
						<input type="text" id="userName" name="userName" class="user" maxlength="10" required>
							<label id="nameResult"></label>
							<img id="userName_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userName_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>닉네임</th>
						<td><input type="text" id="nickName" name="nickName" class="user" maxlength="10" required>
							<label id="nickResult"></label>
							<img id="nickName_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="nickName_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호</th>
						<td>
							<input type="password" id=userPwd name="userPwd" class="user">
							<img id="userPwd_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userPwd_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호 재확인</th>
						<td>
							<input type="password" id="userPwd2" name="userPwd2" class="user">
							<img id="userPwd2_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="userPwd2_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>생년월일</th>
						<td><select id="birth_year" name="birthY" class="user" style="width: 60px; height:25px; margin-right: 10px; cursor:pointer;">
								<option>&nbsp&nbsp&nbsp년▼</option>
								<% for(int i=1950; i<2020;i++){ %>
								<option><%= i %></option>
								<% } %>
							</select>년
						<select id="birth_month" name="birthM" class="user" style="width: 45px; height:25px; margin-right: 10px; cursor:pointer;">
								<option class="member">&nbsp&nbsp월▼</option>
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
						<select name="birthD" style="width: 45px; height:25px; margin-right: 10px; cursor:pointer;">
								<option>&nbsp&nbsp일▼</option>
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
								<select id="selectEmail" name="selectEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
										<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
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
						<input type="text" id="email_injeung" name="email_injeung" class="user" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info2" id="emailBtn" style='cursor:pointer;' onclick="sendMail()">이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn" style='cursor:pointer; display: none;'>이메일 인증</button>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							<br>본인 이메일로 이동하여 인증확인!
						</td>
					</tr>
					<tr>
						<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
						<td align=right><button id="finish" onclick="validate11(); location.href='main.ho'" style='cursor:pointer; display: none;'>가입하기</button></td>
					</tr>
				</table>
				</form>
				
<!-- -------------------- 기업 회원가입폼 -------------------- -->
				<form action="CompanyIn.co" method="post" enctype="Multipart/form-data">
				<table id="Company" cellpadding="0" cellspacing="20">
					<tr>
						<th align=right><label class="must"></label>아이디</th>
						<td><input type="text" id="coId" name="coId" class="coid" maxlength="15" required>
							<label id="coIdResult"></label>
							<img id="coId_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="coId_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
<!-- 						<span><button id="idCheck" onclick="checkId();">중복확인</button></span> -->
<!-- 							<td width="200px"><label id="idResult"></label></td> -->
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호</th>
						<td><input type="password" id=coPwd name="coPwd"
							class="company">
							<label id="coPwdResult"></label>
							<img id="coPwd_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="coPwd_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />	
						</td>
					</tr>
					<tr>
						<th align=right>비밀번호 재확인</th>
						<td><input type="password" id="coPwd2" name="copwd2"
							class="member">
							<label id="coPwd2Result"></label>
							<img id="coPwd2_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="coPwd2_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />		
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>기업명</th>
						<td>
							<input type="text" id="coName" name="coName" class="coName">
							<label id="coNameResult"></label>
							<img id="coName_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
							<img id="coName_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />	
						</td>
					</tr>
					<tr>
						<th align=right>기업 인증 사진</th>
						<td>
							<input type=file name='uploadFile' style='display: none;' id="checkImg" multiple="multiple" onchange="LoadImg(this,1)">  
							<img src="resources/common/images/city.png" border='0' class="fileInput" id="basicImg" width="170px" height="80px" style='cursor:pointer;'>
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
								<label id="ceoResult"></label>
								<img id="ceo_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="ceo_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right><label class="must"></label>신청자 이름</th>
						<td>
							<input type="text" id="apName" name="apName" class="apname">
								<label id="apnameResult"></label>
								<img id="apname_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="apname_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
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
							<select id="cateNum" name="cateNum" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
								<option value="1">&nbsp&nbsp&nbspTravel</option>
								<option value="2">&nbsp&nbsp&nbspSport</option>
								<option value="3">&nbsp&nbsp&nbspFood</option>
								<option value="4">&nbsp&nbsp&nbspNew Skill</option>
								<option value="5">&nbsp&nbsp&nbspCulture</option>
								<option value="6">&nbsp&nbsp&nbspOutdoor</option>
								<option value="7">&nbsp&nbsp&nbspShopping</option>
								<option value="8">&nbsp&nbsp&nbspLifeStyle</option>
							</select>
								<label id="coemailResult"></label></td>
								<img id="coemail_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="coemail_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
						</td>
					</tr>
					<tr>
						<th align=right>기업 확인 이메일</th>
						<td>
							<input type="text" id="busiemail_1" name="busiemail_1" class="company" style="width: 100px;">@ 
							<input type="text" id="busiemail_2" name="busiemail_2" style="width: 100px;" disabled> 
								<select id="selectBusiEmail" name="selectBusiEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
										<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
										<option value="1">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
								</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
						</td>
					</tr>
					<!-- <tr>
						<th align=right>인증 번호 확인</th>
						<td>
						<input type="text" id="email_injeung" name="email_injeung" class="company" placeholder="인증번호를 입력하세요.">
							<span>
								<button id="emailAuthBtn" style='cursor:pointer;'>인증메일</button>
							</span>
							본인 이메일로 이동하여 인증확인!
						</td>
					</tr> -->
					<tr>
						<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
						<td align=right><button id="finish2" onclick="validate12(); location.href='expertIntro.ex'" style='cursor:pointer'>가입하기</button></td>
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
		      <div id="toggle" style="float:right; margin-top:10px;">
		    	<label class="switch">
					<input type="checkbox" id="findSwt">
					<span class="slider round"></span>
				</label>
				<p id="idtp" style="color: white;">회원</p>
			</div>
			  <!-- 회원 아이디 찾기 -->
			  <div id="MemidFind" style="margin-top:50px;">
		      <h3 align=center><p id="tp" style="color: white; font-size: 18px; font-weight: bold">회원</p> 아이디 찾기</h3>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="emailfind_1" name="emailfind_1" class="ID_find" style="width: 100px;">@ 
						<input type="text" id="emailfind_2" name="emailfind_2" style="width: 100px;" disabled> 
							<select id="selectIdEmail" name="selectIdEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
									<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
									<option value="1">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
								<label id="emailResult"></label></td>
								<img id="email_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="email_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
					</td>
				</tr>
				<tr>
					<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
					<td align=right><button id="good" style='cursor:pointer' type="button">확인</button></td>
				</tr>
		    </table>
		    </div>
		    <!-- 기업 아이디 찾기 -->
		     <div id="ComidFind" style="margin-top:50px;">
		      <h3 align=center>기업 아이디 찾기</h3>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="busiemailfind_1" name="busiemailfind_1" class="ID_find2" style="width: 100px;">@ 
						<input type="text" id="busiemailfind_2" name="busiemailfind_2" style="width: 100px;" disabled> 
							<select id="selectpwdBusiEmail" name="selectpwdBusiEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
									<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
									<option value="1">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select>  <!-- 본인 이메일로 이동하여 인증확인!-->
					</td>
				</tr>
				<tr>
					<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
					<td align=right><button id="good2" style='cursor:pointer' type="button">확인</button></td>
				</tr>
		    </table>
		    </div>
		</div>
		
<!-------------------- 비번찾기 모달 -------------------->	
		<div id="modal3" class="modal" >
			 <a class="joinBtn2-close trigger3">
		        <i aria-hidden="true"></i>
		      </a>
		      
		       <!-- 회원, 기업 비번찾기 변경 스위치 -->
		    <div id="toggle" style="float:right; margin-top:10px;">
		    	<label class="switch">
					<input type="checkbox" id="findpwdSwt">
					<span class="slider round"></span>
				</label>
				<p id="pwdtp" style="color: white;">회원</p>
			</div>
				
		      <!-- 회원 비번 찾기 -->
<!-- 		      <form id="MempwdFind" action="mempwdFind.co" method="post" style="margin-top:50px;"> -->
		      <h3 align=center><p id="tp" style="color: white; font-size: 18px; font-weight: bold;">회원</p> 비밀번호 찾기</h3>
		      <table cellpadding="0" cellspacing="20">
		      	<tr>
					<th align=right>ID</th>
					<td>
						<input type="text" id=pwd_find  name="pwd_find" class="pwd_find">
						<img id="pwdChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
						<img id="pwdChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
					</td>
				</tr>
				<tr>
					<th align=right>E-mail</th>
					<td>
						<input type="text" id="pwdfind_1" name="pwdfind_1" class="PWD_find" style="width: 100px;">@ 
						<input type="text" id="pwdfind_2" name="pwdfind_2" style="width: 100px;" disabled> 
							<select id="memPwdEmail" name="memPwdEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
									<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
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
						<input type="text" id="email_injeung2" class="user" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info2" id="emailBtn2" style='cursor:pointer;'>이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn2" style='cursor:pointer; display: none;'>이메일 인증</button><br>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							본인 이메일로 이동하여 인증확인!
					</td>
				</tr>
				<tr>
					<th align=right>새 비밀번호</th>
					<td>
						<input type="text" id="newPwd" name="newPwd" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th align=right>새 비밀번호 확인</th>
					<td>
						<input type="text" id="newPwd2" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
					<td align=right><button id="yeah" onclick="" style='cursor:pointer' onclick="location.href='mempwdFind.co'">확인</button></td>
				</tr>
		      </table>
<!-- 		      </form> -->
		       <!-- 기업 비번 찾기 -->
<!-- 		      <form id="CompwdFind" action="compwdFind.co" method="post" style="margin-top:50px;"> -->
		      <h3 align=center>기업 비밀번호 찾기</h3>
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
						<select id="coPwdEmail" name="coPwdEmail" style="width: 108px; height:25px; margin-right: 10px; cursor:pointer;">
							<option Selected>&nbsp&nbsp&nbsp선택하세요▼</option>
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
						<input type="text" id="email_injeung3" class="user" placeholder="인증번호를 입력하세요.">
							<span>
								<button type="button" class="btn btn-info2" id="emailBtn3" style='cursor:pointer;'>이메일 발송</button>
								<button type="button" class="btn btn-info" id="emailAuthBtn3" style='cursor:pointer; display: none;'>이메일 인증</button>
								<img id="emailChkResult_check"  style="display:none;" src="resources/common/images/GreenCheck.png" width="15px" height="15px" /> 
								<img id="emailChkResult_checked" style="display:none;" src="resources/common/images/RedX.png" width="15px" height="15px" />
							</span>
							본인 이메일로 이동하여 인증확인!
					</td>
				</tr>
				<tr>
					<th align=right>새 비밀번호</th>
					<td>
						<input type="text" id="CnewPwd" name="newPwd" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th align=right>새 비밀번호 확인</th>
					<td>
						<input type="text" id="CnewPwd2" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td align=right><button  class="cancel" data-dismiss="modal" type="button" style='cursor:pointer'>취소하기</button></td>
					<td align=right><button id="yeah2" style="'cursor:pointer' 'margin-right:50px;'">확인</button></td>
				</tr>
		      </table>
<!-- 		      </form> -->
		</div>
		
		<!-------------------- 오른쪽 로그인폼 -------------------->
		<div id="rightForm">
			<!-- 회원 로그인, 기업 로그인 변경 스위치 -->
			<div id="toggle" style="float:right; margin-top:-30px;">
		    	<label class="switch" >
					<input type="checkbox" id="loginSwt">
					<span class="slider round"></span>
				</label>
				<p id="ctp" style="color: white;">회원</p> 
			</div>	
			<!-- 유저 로그인 -->
			<form id="login" action="loginSuccess.co" method="post" onsubmit="return validate();"> 
				<div id="idPwdInput">
					<div id="loginlogo">
						<img id="loginlogo" src="resources/common/images/LogoWhite.png" width="500px" height="90px" style='margin-left:-90px; margin-height:"0"'/>
					</div>
					<input id="mUserid" name="userId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input id="mPwd" name="userPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<button id="subbtn" style='cursor:pointer;margin-left:8px;margin-top:95px'>LOGIN</button>
				</div>
			</form>
			
			<!-- 컴퍼니 로그인 -->
			<form id="Clogin" action="loginSuccess2.co" method="post" onsubmit="return validate2();"> 
				<div id="idPwdInput">
					<div id="loginlogo" style="color: white">
						<img id="loginlogo3" src="resources/common/images/LogoBlack.png" width="500px" height="90px" style="margin-left:-90px;"/>
					</div>
					<input id="mCoid" name="coId" type="text" class="idPwd" placeholder="&ensp; ID">
					<input id="mCopwd" name="coPwd" type="password" class="idPwd" placeholder="&ensp; Password">
				</div>
				<!-- 로그인 성공하면 바로 메인메뉴로 이동함 -->
				<div id="submit" style='float:left'> 
					<button id="subbtn2" style='cursor:pointer;margin-left:8px;margin-top:95px'>LOGIN</button>
				</div>
			</form>
			
			<div id="join">
				<button class="joinBtn3" style='cursor:pointer; float:left; margin-top:2px'>아이디 찾기</button>
			</div>
			<div id="join2">
				<button class="joinBtn4" style='cursor:pointer; float:left; margin-top:2px; margin-left:14px'>비밀번호 찾기</button>
			</div>
			<div class="page-wrapper" style='margin-top:10px;'>
				<button class="joinBtn2" id="joinBtn2" style='cursor:pointer;'>회원가입</button>
				<!-- <a class="joinBtn2" id="joinBtn2" href="#" style='cursor:pointer' >회원가입</a> -->
				<!-- <button class="joinBtn2" href="leftForm" style='cursor:pointer'>회원가입</button> -->
			</div>
			<!-- <hr color="white" width="325px" align="left"> -->
			<%-- <div>
				<a href="${facebook_url}"> 
				<button id="facebookBtn" style='cursor:pointer' data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="true" onclick="fbLogin();"> <img src="resources/common/images/facebook.png" width="24px" height="24px" >&ensp;Facebook으로 로그인</button>
				</a>
			</div>
			<div id="fb-root"></div> --%>
		</div>
	</div>
	<script type="text/javascript" src="resources/common/js/login.js"></script>
</body>
	<script>
		var dice = 0;
		$('#emailBtn').click(function(){
			var email_1 = $('#email_1'); 
			var email_2 = $('#email_2');
			if(email_1.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else if(email_2.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else {
				var email = email_1.val() + "@" + email_2.val();
				$.ajax({
					url: "emailCheck.co",
					method: "POST",
					data: {
						email:email
					},
					success: function(data) {
						if(data.trim() == 'fail'){
							alert("중복된 이메일이 존재합니다.")
						} else {
							alert("이메일이 발송되었습니다.")
							$.ajax({
								metoed : "POST",
								url : "emailCode.co",
								data: {
									email:email
								},
								success: function(data){
									console.log(data)
									$('#emailAuthBtn').css("display", "inline-block");
									dice = data;
								}
							})
						}
					}
				})
			}
		})
	
		$('#emailAuthBtn').click(function(){
			console.log(dice)
			var code = $('#email_injeung').val();
			if(dice == code){
				alert("인증번호가 일치합니다.")
				$('#finish').css('display', 'block');
			} else {
				alert("인증번호가 일치하지 않습니다.")
			}
		});
		
		
		// 회원 비밀번호 찾기 
		var dice2 = 0;
		
		$('#emailBtn2').click(function(){
			var userId = $('#pwd_find'); // 다르게하기
			var email_1 = $('#pwdfind_1'); // 다르게하기
			var email_2 = $('#pwdfind_2'); // 다르게하기
			
			if(userId.val().trim().length == 0) {
				alert("아이디를 입력해주세요.")
			} else if(email_1.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else if(email_2.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else {
				var email = email_1.val() + "@" + email_2.val();
				$.ajax({
					url: "idEmailCheck.co", // 다르게하기
					method: "POST",
					data: {
						userId:userId.val(),
						email:email
					}, 
					success: function(data) {
						if(data.trim() == 'fail'){
							alert("내용이 일치하지 않습니다.")
						} else {
							alert("이메일이 발송되었습니다.")
							$.ajax({
								metoed : "POST",
								url : "emailCode.co",
								data: {
									email:email
								},
								success: function(data){
									console.log(data)
									$('#emailAuthBtn2').css("display", "inline-block");
									dice2 = data;
								}
							})
						}
					}
				})
			}
		})
		
		$('#emailAuthBtn2').click(function(){
			console.log(dice2)
			var code = $('#email_injeung2').val();
			if(dice2 == code){
				alert("인증번호가 일치합니다.")
				$('#newPwd').attr("disabled", false);
				$('#newPwd2').attr("disabled", false);
			} else {
				alert("인증번호가 일치하지 않습니다.")
			}
		});
		
		////////////////////////////////////////////////
		
		
		//////////////////////////////////////////////////
		
		
		
		$('#yeah').click(function(){
			var newPwd = $('#newPwd').val();
			var newPwd2 = $('#newPwd2').val();			
			if(newPwd.trim() == newPwd2.trim()) {
				var userId = $('#pwd_find').val();
				$.ajax({
					url: "mempwdChange.co",
					method: "POST",
					data: {
						userId:userId,
						newPwd:newPwd
					},
					success: function(data) {
						console.log(data)
						if(data.trim() == "success"){
							alert("비밀번호 변경이 완료되었습니다.");
							location.reload();
						} 
					}
				})
			} else {
				alert("비밀번호가 일치하지 않습니다.")
			}
		})
		
		// 기업 비밀번호 찾기 
		var dice3 = 0;
		
		$('#emailBtn3').click(function(){
			var userId = $('#copwd_find'); // 다르게하기
			var email_1 = $('#copwdfind_1'); // 다르게하기
			var email_2 = $('#copwdfind_2'); // 다르게하기
			
			if(userId.val().trim().length == 0) {
				alert("아이디를 입력해주세요.")
			} else if(email_1.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else if(email_2.val().trim().length == 0) {
				alert("정확한 이메일을 입력해주세요.")
			} else {
				var email = email_1.val() + "@" + email_2.val();
				$.ajax({
					url: "CidEmailCheck.co", // 다르게하기
					method: "POST",
					data: {
						userId:userId.val(),
						email:email
					}, 
					success: function(data) {
						if(data.trim() == 'fail'){
							alert("내용이 일치하지 않습니다.")
						} else {
							alert("이메일이 발송되었습니다.")
							$.ajax({
								metoed : "POST",
								url : "emailCode.co",
								data: {
									email:email
								},
								success: function(data){
									console.log(data)
									$('#emailAuthBtn3').css("display", "inline-block");
									dice3 = data;
								}
							})
						}
					}
				})
			}
		})
		
		$('#emailAuthBtn3').click(function(){
			console.log(dice3)
			var code = $('#email_injeung3').val();
			if(dice3 == code){
				alert("인증번호가 일치합니다.")
				$('#CnewPwd').attr("disabled", false);
				$('#CnewPwd2').attr("disabled", false);
			} else {
				alert("인증번호가 일치하지 않습니다.")
			}
		});
		
		////////////////////////////////////////////////
		
		
		//////////////////////////////////////////////////
		
		
		
		$('#yeah2').click(function(){
			var newPwd = $('#CnewPwd').val();
			var newPwd2 = $('#CnewPwd2').val();			
			if(newPwd.trim() == newPwd2.trim()) {
				var userId = $('#copwd_find').val();
				$.ajax({
					url: "conpwdChange.co",
					method: "POST",
					data: {
						userId:userId,
						newPwd:newPwd
					},
					success: function(data) {
						console.log(data)
						if(data.trim() == "success"){
							alert("비밀번호 변경이 완료되었습니다.");
							location.reload();
						} 
					}
				})
			} else {
				alert("비밀번호가 일치하지 않습니다.")
			}
		})
		
		
		
		
		
		$(function(){
			find = false;
		});
		$('#good2').click(function(){
			if($('#busiemailfind_1').val().trim().length==0){
				alert('이메일을 입력해주세요');
				$('#busiemailfind_1').focus();
			}
			if($('#busiemailfind_2').val().trim().length==0){
				alert('이메일을 입력해주세요');
				$('#busiemailfind_2').focus();
			}
			var busiemailfind_1 = $('#busiemailfind_1');
			var busiemailfind_2 = $('#busiemailfind_2');
			
			$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
				url: 'compareEmail2.co',
				type: 'post',
				data:{busiemail_1: busiemailfind_1.val(), busiemail_2: busiemailfind_2.val()},
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
	</script>
</html>