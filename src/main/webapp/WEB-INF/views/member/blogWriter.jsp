<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/member/css/blogWrite.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/common/textEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
		<div id="Myheader">
			<table id="table_area">
				<tr>
					<td rowspan="4" style="width: 250px;">
						<img id="profileImg" src="/BucketStory/resources/member/images/${ loginUser.prImage }" />
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">${ loginUser.nickName }</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ loginUser.userName }</td>
				</tr>
				<tr>
					<td>게시물수 199</td>
					<td>팔로워 ${ loginUser.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<form action="BlogInsert.me" method="post">
				<input type="hidden" name="bkNo" value="${ bkNo }"/>
				<h2>내용 작성</h2><br>
				<div id="content_area">
					제목
					<input type="text" name="bTitle"/><br><br>
				</div><br>
				<textarea name="bContent" id="bContent" style="width:100%; min-height: 700px;" ></textarea>
				<button onclick="submitContents()">저장</button>
			</form>
		</section>
	</div>


</body>
</html>
<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "bContent",
	sSkinURI: "${ pageContext.request.contextPath }/resources/common/textEditor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
// 		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
// 		bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		I18N_LOCALE : sLang
	}, //boolean
	fCreator: "createSEditor2"
});

function pasteHTML(){
    var sHTML = '<img src="#">';
    oEditors.getById["bContent"].exec("PASTE_HTML", [sHTML]);
}

function submitContents() {
	oEditors.getById["bContent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
	
</script>
</script>