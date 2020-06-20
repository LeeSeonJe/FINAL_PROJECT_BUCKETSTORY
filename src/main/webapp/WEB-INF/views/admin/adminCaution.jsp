<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<style>
div > h2 {
    margin-left: 70px;
    margin-top: 50px;
    width: 90%;
    border-bottom: 1px solid black;
}

#ad_declare {
	margin: 0 auto;
	width: 80%;
}

#ad_de_search{
    text-align: center;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"></jsp:include>
	</header>
	<div id="adw_body">
		<nav>
			<div id="adw_menu">
				<ul>
					<li><a>축제 작성</a></li>
					<li><a>가입확인</a></li>
					<li><a>결제내역</a></li>
					<li><a>통계</a></li>
					<li><a>신고</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
		</nav>
		<div>
		<h2>신고 게시판</h2>
	</div>
	
	<div>
		<form action="warning.ad">
		<table id="ad_declare">
				<tr>
					<th><input type="checkbox" name="chk_head" id="checkAll"></th>
					<th>번호</th>
					<th>말머리</th>
					<th>상태</th>
					<th>아이디</th>
					<th>신고자</th>
					<th>신고일</th>
				</tr>
			<c:forEach var="notify" items="${ list }">
			<tr>
				<td><input type="checkbox" name="chk_box" value="${notify.no_no}" id="checkSelect"></td>
				<td>${ notify.no_no }</td>
				<td>${ notify.no_kind }</td>
				<td>${ notify.no_check }</td>
				<td>${ notify.sinuser }</td>
				<td>${ notify.pigouser }</td>
				<td>${ notify.enrolldata }</td>
			</tr>
		
			</c:forEach>
					<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="6">
						<!-- [이전] --> 
						
						<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="cautionlist.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if>
						 
						<!-- 페이지 --> 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>

							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="cautionlist.ad">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach> 
						
						<!-- [다음] --> 
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if> 
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="cautionlist.ad">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="ad_de_search">
		<select>
			<option>전체보기</option>
			<option>게시글</option>
			<option>댓글</option>
		</select> 
			<input type="text">
			<a href="#">검색</a>
		<button onclick="chk_warning();">회원 경고</button>
		<button>전체 삭제</button>
	</div>
</div>

<script>

// /* 체크박스 [전체,부분 선택] */
function allCheck() {
	if($("[name=chk_box]").prop("checked")){
		$("[name=chk_box]").prop("checked",false);
	}else{
		$("[name=chk_box]").prop("checked",true);
	}
}// 모두 체크하기
 
function oneCheck(a){
    var allChkBox = $("[name=chk_head]");
    var chkBoxName = $(a).attr("name");
 
    if($(a).prop("checked")){
        checkBoxLength = $("[name="+ chkBoxName +"]").length;
         //전체체크박스 수(모두동의하기 체크박스 제외)
        checkedLength = $("[name="+ chkBoxName +"]:checked").length;
        //체크된 체크박스 수 
        if( checkBoxLength == checkedLength ) {
            allChkBox.prop("checked", true);
            //전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
 
        } else {
            allChkBox.prop("checked", false);
        }
    } else {
        allChkBox.prop("checked", false);
    }
}
 
$(function(){
    $("[name=chk_head]").click(function(){
        allCheck(this);
        console.log(this);
        //모두동의하기 체크박스 클릭시
    });
    $("[name=chk_box]").each(function(){
        $(this).click(function(){
            oneCheck(this);
        });
    });
});


/* 경고 먹는 회원 스크립트 */
	
function chk_warning(){
	alert("클릭");
	
	var checkArr = []; // 배열 초기화
// 	var check = "";
	
	$("input[name='chk_box']:checked").each(function(i){
// 		var va = $(this).val();
// 		console.log(va);
// 		console.log(typeof(va));

		checkArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
	});
	
// 	console.log(typeof(checkArr));
		
	$.ajax({
		url: 'warning.ad',
		type: 'POST',
		data: {notify : checkArr},
		success: function(data){
			if(data == 'success'){
				console.log(data);
			}
		}
		
		
	});
	
}

</script>
</body>
</html>