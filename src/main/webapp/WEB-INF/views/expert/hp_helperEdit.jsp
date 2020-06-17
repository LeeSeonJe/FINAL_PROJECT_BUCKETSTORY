<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_helperEdit.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />

	<!-- 	coId 기업아이디 -->
	<!-- 	coPwd 비밀번호 -->
	<!-- 	coName 기업명-->
	<!-- 	compaName 업종명 -->
	<!-- 	apName 신청자이름 -->
	<!-- 	homePage 홈페이지 -->
	<!-- 	coTel 전화번호 -->
	<!-- 	enrollDate 가입날짜 -->
	<!-- 	status -->
	<!-- 	approval 승인여부 -->
	<!--    busiEmail 이메일 -->
	<!-- 	cpCheck 기업전문가여부 -->
	<!-- 	checkImg 인증사진 -->
	<!--    point 포인트 -->
	<!-- 	cateNum 카테고리 번호 -->
	<!-- 	coIntro 업체소개-->
	<!--    coInfo 업체정보-->


	<section>

		<div class="inner">
			<h1 align="center">Helper Edit</h1>
			<br>
			<form id="submitform" action="helperUpdate.ex">
				<table class="et th1">
					<tr>
						<th colspan="3" class="title">회원정보 수정(헬퍼)</th>
					</tr>
					<tr>
						<th colspan="3"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td class="rown">가입날짜</td>
						<td><p>${com.enrollDate }</p></td>
						<td></td>
					</tr>
					<tr>
						<td class="rown">회원아이디</td>
						<td><p style="color: red">${com.coId}</p> <input
							type="hidden" value="${com.coId }" name="coId"> <%--                 <input type ="text" value ="${com.coId}" readonly style="color:red"></td> --%>
						<td><p style="color:red">아이디는 변경 불가합니다.</p></td>
					</tr>
					<tr>
						<td class="rown">기존 비밀번호</td>
						<td><input type="text" id="oldPwd"></td>
						<td>

							<div class="pwdCheck" id="pwdCheck1">
								<img class="pwdImg" src="resources/common/images/GreenCheck.png">
								<p>&nbsp;비밀번호가 일치.</p>
							</div>
							<div class="pwdCheck" id="pwdCheck2">
								<img class="pwdImg" src="resources/common/images/RedX.png">
								<p>&nbsp;비밀번호가 불일치.</p>
							</div>
						</td>
					</tr>
					<tr>
						<td class="rown">새로운 비밀번호</td>
						<td><input type="text" id="newPwd"></td>
						<td>
							<div class="pwdCheck" id="pwdCheck3">
								<img class="pwdImg" src="resources/common/images/GreenCheck.png">
								<p>&nbsp;사용가능합니다.</p>
							</div>
							<div class="pwdCheck" id="pwdCheck4">
								<img class="pwdImg" src="resources/common/images/RedX.png">
								<p>&nbsp;사용 불가</p>
							</div>
						</td>
					</tr>
					<tr>
						<td class="rown">Email</td>
						<td><input type="text" value="${com.busiEmail}"></td>
					</tr>
					<tr>
						<td class="rown">Phone</td>
						<td><input type="text" placeholder="-는 빼고 입력해주세요."
							value="${com.coTel}"></td>
					</tr>

					<tr>
						<td class="rown">Hompage</td>
						<td><input type="text" value="${com.homePage}"></td>
					</tr>

					<!--             <tr> -->
					<!--                 <td class ="rown">주소</td> -->
					<!--                 <td><input type ="text"></td> -->
					<!--                 <td><button class ="btn">주소찾기</button></td> -->
					<!--             </tr> -->
					<!--             <tr> -->
					<!--                 <td class ="rown">상세주소</td> -->
					<!--                 <td><input type ="text"></td> -->
					<!--             </tr> -->
				</table>

				<br>

				<table class="et th2">
					<tr>
						<th colspan="3" class="title">기업소개 변경</th>
					</tr>
					<tr>
						<th colspan="3"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td class="rown"><p>업체사진</p></td>
						<td><div id="igm-area">
								<img id="foo" src="#" />${com.checkImg }</div></td>
						<td><input type="file" name="uploadFile" id="imgInp"></td>
					</tr>
					<tr>
						<td class="rown"><p>업체이름</p></td>
						<td><input type="text" value="${com.coName }" name="coName"></td>
					</tr>

					<tr>
						<td class="rown"><p>업종명</p></td>
						<td><input type="text" value="${com.compaName }"
							name="compaName"></td>
					</tr>

					<tr>
						<td class="rown"><p>카테고리</p></td>
						<td><input type="text" value="${com.cateNum }" readonly></td>
						<td>변경 <select id="cateNum" name="cateNum">
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
						<td class="rown"><p>업체소개</p></td>
						<td colspan="2"><textarea id="textArea" name="coInro">${com.coIntro}</textarea></td>
					</tr>
					<tr>
						<th colspan="3"><p class="op">&nbsp;</p></th>
					</tr>
					<tr>
						<td colspan="3" id="submitBtn-Area">
							<button type="submit" class="btn btn--primary2" id="submitBtn">클릭하시면
								정보를 변경합니다.</button>
						</td>
					</tr>
				</table>
				<br>
			</form>
		</div>
	</section>

	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#foo').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp").change(function() {
			readURL(this);
		});

		
		var oldPwd = document.getElementById('oldPwd');
		var newPwd = document.getElementById('newPwd');
		
		// 기존비밀번호 일치 확인
		oldPwd.onchange = function(){
			
// 			if(oldPwd.value == '${com.coPwd}'){
// 				$('#pwdCheck1').show();
// 				$('#pwdCheck2').hide();
// 			}else{
// 				$('#pwdCheck2').show();
// 				$('#pwdCheck1').hide();
// 			}
			$.ajax({  //현재 아이디 보내서 비교해서 값을 받아오기
				url: '<%= request.getContextPath() %>/compwdFind.co',
				data: {id:'${com.coId}'},
				success: function(data){
					console.log(data);
				
				if(data == 'success'){
					$('#pwdCheck1').show();
	 				$('#pwdCheck2').hide();
				}else{
					$('#pwdCheck2').show();
	 				$('#pwdCheck1').hide();
				}
	
			}
        });
			
		}

		// 비밀번호 규칙 : 비밀번호는 영문 숫자 7~11자리 
		var re4 = /^[a-zA-Z\d]{7,11}$/;

		newPwd.onchange = function() {

			if (!re4.test(newPwd.value)) {
				// alert('비밀번호는 영문 숫자7~11자리 ');
				$('#pwdCheck3').show();
				$('#pwdCheck4').hide();
				//   console.log(newPwd.value);
			} else {
				$('#pwdCheck4').show();
				$('#pwdCheck3').hide();
			}
		};
		

	</script>
	
	
	

</body>
</html>