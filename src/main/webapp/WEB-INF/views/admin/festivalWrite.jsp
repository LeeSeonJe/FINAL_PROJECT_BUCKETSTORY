<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>
form{
    height: 900px;
    margin-top: 45px;
    width: 62%;
    margin: 0 auto;
}

form>adw_formimg>div{
	background-color:black;
	min-width:950px;
	min-height:350px;
	
}

form>#adw_formimg{
    text-align: center;
    margin-bottom: 50px;
    margin-top: 50px;

}

form>div>div>ul>li{
	list-style: none;
	font-size: 15px;
    height: 60px;
}

#adw_formDiv{
    width: 75%;
    margin: 0 auto;

}
.adw_formdiv{
	display: inline-flex;
}

#adw_textarea{
    resize: none;
    width: 650px;
    height: 150px;
    margin-left: 35px;
	
}

.adw_button{
    text-align: center;
    margin-top: 35px;
}

#adw_body>nav{
	width: 100%;
	height:50px;
	
}

.ad_table{
    margin-left: 30px;
	
}

.ad_table>tbody>tr,
.ad_table>tbody>tr>td{
	height: 45px;
	width: 150px;
}

.btn{
	margin-right: 10px;
}
    
#title{
	width: 48%;
    margin: 0 auto;
    margin-top: 80px;
}

nav{
	border-bottom: 1px solid #d2d1d1;
    height: 47px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>				
	</header>
	
		<nav>
			<div id="adw_menu">
				<ul>
					<li>
						<a href="adminwrite.ad">축제 작성</a>	
					</li>
					<li>
						<a href="adminCompany.ad">가입확인</a>
					</li>
					<li>
						<a href=adminBill.ad?search=all>결제내역</a>
					</li>
					<li>
						<a href="">통계</a>
					</li>
					<li>
						<a href="cautionlist.ad">신고</a>
					</li>
					<li>
						<a href="adminQnAlist.ad">QnA</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="board">
		<div>
			<h2 id="title">축제 작성</h2>
		</div>
		<form action="feinsert.ad" method="post" id="adw_form" enctype="multipart/form-data">
			<div id="adw_formimg">
				<input type="file" name="feUploadFile">
			</div>
			<div id="adw_formDiv">
				<div class="adw_formdiv">
					<table class="ad_table">
						<tr>
							<td>제목 </td>
							<td><input type="text" name="fetitle"></td>						
						</tr>
						<tr>
							<td>일시</td>
							<td><input type="text" name="feDate"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post" class="postcodify_postcode5" value="" size="6">
								<button type="button" class="btn" id="postcodify_search_button">검색</button></td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address1" class="postcodify_address" value=""></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
						</tr>
					</table>
				</div>
				<div>
					<textarea id="adw_textarea" name="fecontent">내용작성</textarea>
				</div>
			</div>

			<div class="adw_button">
				<input type="submit" value="완료"> 
				<input type="reset" value="취소">
			</div>
		</form>
		</div>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
$(function(){
	$("#postcodify_search_button").postcodifyPopUp();
});
</script>
</body>
</html>