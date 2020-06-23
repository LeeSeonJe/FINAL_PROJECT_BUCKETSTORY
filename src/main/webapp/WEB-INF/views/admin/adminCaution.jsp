<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<link rel="stylesheet" href="resources/admin/css/adminBoardList.css">
</head>
<style>
.ad_list{
    float: left;
    width: 160px;
    margin-bottom: 10px;
}
</style>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</header>
		<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"></jsp:include>
	<div id="adw_body">
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
						<a href="adminBill.ad">결제내역</a>
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
	</div>
	<div id="board-area">
	<div>
		<h2><a href="cautionlist.ad"  class="ad_list">신고 게시판</a></h2>
		<h2><a href="adminwarning.ad"  class="ad_list">경고 게시판</a></h2>
	</div>
			<form action="warning.ad">
				<table class="board">
					<tr>
						<th><input type="checkbox" name="chk_head" id="checkAll">선택</th>
						<th>번호</th>
						<th>말머리</th>
						<th>상태</th>
						<th>아이디</th>
						<th>신고자</th>
						<th>신고일</th>
					</tr>
<!-- 					<tr> -->
<%-- 						<th><c:if test="${search eq'all'}"> --%>
<!-- 								<button onclick="">전체</button> -->
<!-- 								<button onclick="">신고</button> -->
<!-- 								<button onclick="">경고</button> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${search eq'N'}"> --%>
<!-- 								<button onclick="">전체</button> -->
<!-- 								<button onclick="">신고</button> -->
<!-- 								<button onclick="">경고</button> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${search eq'Y'}"> --%>
<!-- 								<button onclick="">전체</button> -->
<!-- 								<button onclick="">신고</button> -->
<!-- 								<button onclick="">경고</button> -->
<%-- 							</c:if> --%>
<!-- 						</th> -->
<!-- 					</tr> -->
					<c:forEach var="notify" items="${ list }">
						<tr>
							<td><input type="checkbox" name="chk_box" value="${notify.no_no}" id="checkSelect"></td>
							<td>${ notify.no_no }</td>
							<td>${ notify.no_kind }</td>
							<td>${ notify.no_check }</td>
							<td>${ notify.pigouser }</td>
							<td>${ notify.sinuser }</td>
							<td>${ notify.enrolldata }</td>
						</tr>

					</c:forEach>
				</table>
			</form>
			<div id="board-paging">
					<!-- 페이징 처리 -->
						<c:if test="${ pi.currentPage <= 1 }">
						<button id ="prev">이전</button>
						</c:if> 
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="cautionlist.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }"><button id ="prev">이전</button></a>
						</c:if>
						 
						<!-- 페이지 --> 
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button class ="sBtn active">${ p }</button>
							</c:if>

							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="cautionlist.ad">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }"><button class ="sBtn">${ p }</button></a>
							</c:if>
						</c:forEach> 
						
						<!-- [다음] --> 
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button id= "next">다음</button>
						</c:if> 
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="cautionlist.ad">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }"><button id= "next">다음</button></a>
						</c:if>
				</div>
		<div id="ad_search">
			<select>
				<option>전체보기</option>
				<option>게시글</option>
				<option>댓글</option>
			</select> 
				<input type="text">
				<a href="#">검색</a>
			<button onclick="chk_warning();" id="waring">회원 경고</button>
			<button id="delete">전체 삭제</button>
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
//         console.log(this);
        //모두동의하기 체크박스 클릭시
    });
    $("[name=chk_box]").each(function(){
        $(this).click(function(){
            oneCheck(this);
        });
    });
});


// /* 경고 먹는 회원 스크립트 */
	
// function chk_warning(){
// 	alert("클릭");
	
// 	var checkArr = []; // 배열 초기화
// // 	var check = "";
	
// 	$("input[name='chk_box']:checked").each(function(i){
// 		var va = $(this).val();
// // 		console.log(va);
// // 		console.log(typeof(va));
		
// 		checkArr.push(va);
// 		console.log(checkArr);
// 		console.log(typeof(checkArr));
// // 		checkArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
// 	});
	
// // 	console.log(typeof(checkArr));
		
// 	$.ajax({
// 		url: 'warning.ad',
// 		type: 'POST',
// 		data: {no_no : va},
// 		success: function(data){
// 			if(data == 'success'){
// 				console.log(data);
// 			}
// 		}
// 	});
// }

/* 회원 경고 주기 */
	function chk_warning(){
	 	alert("경고를 주었습니다.");

	
	var chk_Arr = []; // 배열 초가화
	$("input[name='chk_box']:checked").each(function(i){
		chk_Arr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
	});
	
	$.ajax({
		url: 'warning.ad',
		data: {Notify : chk_Arr},
		success: function(data){

			}
	});
}


/* 리스트 변경 버튼 */
// 	function goShowAll() {
// 		location.href = "adminCautQnaList.ex?search=all";
// 	}
// 	function goShowY() {
// 		location.href = "helperQnaList.ex?search=Y";
// 	}
// 	function goShowN() {
// 		location.href = "helperQnaList.ex?search=N";
// 	}

</script>
</body>
</html>