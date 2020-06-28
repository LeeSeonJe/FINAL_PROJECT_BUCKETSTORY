<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin/css/adminDefault.css">
<link rel="stylesheet" href="resources/admin/css/adminBoardList.css">
</head>
<style>
.ad_list{
    width: 160px;
    margin-bottom: 10px;
    
}

#l_list{
	margin-right: 15px;
    font-size: 15px;
}

#R_list{
   font-size: 15px;
}

#M_list{
    margin-left: 15px;	
    font-size: 15px;
}
.a_list{
    display: flex;
    margin-bottom: 10px;
    width: 47%;
    margin: 0 auto;
}

h3{
    margin: 0 auto;
    width: 48%;
    font-size: 26px;
}

h2{
	margin: initial;
}

 a:link{ 
  	color: black; text-decoration: none; 
  } 
 a:visited{ 
  	 color: black; text-decoration: none; 
 } 
  a:hover{ 
 	color: black; text-decoration: none;
  }
  
  
</style>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</header>
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
						<a href="adminBill.ad?search=all">결제내역</a>
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
		<h3>게시글 신고 게시판</h3>
	</div>
	<div class="a_list">
		<h2><a href="boardCaution.ad"  class="ad_list" id="l_list">게시글</a></h2>
		<h2><a href="cautionlist.ad"  class="ad_list" id="R_list">댓글</a></h2>
		<h2><a href="replyCaution.ad" class="ad_list" id="M_list">대댓글</a></h2>
	</div>
			<form action="boardCaution.ad">
				<table class="board" id="ad_board">
					<tr>
						<th><input type="checkbox" name="chk_head" id="checkAll">선택</th>
						<th>번호</th>
						<th>말머리</th>
						<th>상태</th>
						<th>아이디</th>
						<th>신고자</th>
						<th>신고일</th>
						<th>활동</th>
					</tr>
					<c:forEach var="b" items="${ list }">
						<tr>
							<c:url var="view" value="cautionView.ad">
								<c:param name="userid" value="${ b.pigouser }"></c:param>
							</c:url>
							<td>
								<input type="checkbox" name="chk_box" value="${b.no_no}" id="checkSelect">
							</td>
							<td>${ b.no_no }</td>
							<td>
								<c:if test="${ b.no_kind == 1 }">게시글</c:if>
							</td>
							<td>
								<c:if test="${ b.no_check eq 'N'.charAt(0) }">경고아님</c:if>
								<c:if test="${ b.no_check eq 'Y'.charAt(0) }">경고</c:if>
							</td>
							<td><a href="${ view }">${ b.pigouser }</a></td>
							<td>${ b.sinuser }</td>
							<td>${ b.enrolldata }</td>
							<td>
								<c:if test="${ b.status eq 'N'.charAt(0) }">활동</c:if>
								<c:if test="${ b.status eq 'Y'.charAt(0) }">강제탈퇴</c:if>
							</td>
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
							<c:url var="before" value="boardCaution.ad">
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
								<c:url var="pagination" value="boardCaution.ad">
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
							<c:url var="after" value="boardCaution.ad">
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
				<input type="text"><a href="#">검색</a>
			<button onclick="chk_warning();" id="waring">회원 경고</button>
			<button onclick="chk_delete();" id="waring">강제 탈퇴</button>
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

/* 게시글 회원 경고 주기 */
	function chk_warning(){
 	alert("경고를 주었습니다.");


	var chk_Arr = []; // 배열 초가화
	$("input[name='chk_box']:checked").each(function(i){
		chk_Arr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
	});

	$.ajax({
		url: 'warning.ad',
		data: {Notify : chk_Arr},
		async:false,
		success: function(data){
			console.log(data);
			console.log(data.userId);
			for(var key in data){
				var asdf = data[key].userId;
				console.log(asdf);
				send_message(data[key].userId);
			}
		 location.reload();
		
		}			
			
		
	});
}

	/* 강제 탈퇴 */
	function chk_delete(){
	 	alert("강제 탈퇴를 주었습니다.");

	
	var chk_Arr = []; // 배열 초가화
	$("input[name='chk_box']:checked").each(function(i){
		chk_Arr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
	});
	
	$.ajax({
		url: 'delectMember2.ad',
		data: {Notify : chk_Arr},
		success: function(data){
			
		console.log("data 값 보자 " + data);
			
		 location.reload();
		
		}			
			
		
	});
}




</script>
</body>
</html>