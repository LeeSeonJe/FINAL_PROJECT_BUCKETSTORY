<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_common.css">
<style>
/* 게시판 테이블 */
.divbody {
    width: 60%;
    margin: 0 auto;
    text-align:center;
}
.divbody table{
	 margin: 0 auto;
}
h2{
	border-bottom: 1px solid black;
}

.divbody>div>ul>li{
	text-align: center;
    list-style: none;	
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
	<section>
	<div class="divbody">	
		<div>
			<br>
			<h2>QnA 작성하기</h2>
		</div>
		<br>
			<form action ="insertQnA.ex">
				<table>
				    <input type="hidden" value="TEST" name ="coID">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10px;" cols="80px;" name="content"></textarea>
					</tr>
				</table>

				<div>
					<ul>
						<li>
							<button type="reset" class="btn">취소</button>
							<button type="submit" class="btn btn--primary2">작성</button>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</section>
</body>
</html>