<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<% 			SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
			String today = dateFormat.format(new Date());
			int num = 1;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <link rel="stylesheet" href="resources/expert/css/hp_intro.css">
    <link rel="stylesheet" href="resources/expert/css/hp_helperEdit1.css">
    <link rel="stylesheet" href="resources/expert/css/hp_helperEdit2.css">
    <title>helper MyPage</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/expert/hp_common.jsp" />
    <div class="inner"><a id ="hpTop"></a>
		<!--------------------------------------------------------------------------->
        <!-- 0 -->
        <!--------------------------------------------------------------------------->
        <div id ="intro_background" style="display:none"></div>
        <div id="intro_content" style="display:none">
            <img src ="resources/common/images/LogoWhite.png" alt="Logo">
            <p><b>-BucketList 기업/전문가 Home-</b></p><br>
            <p>어서오세요~~!! </p>
            <p><span id = "point">${com.coId}</span>님 환영합니다.</p>
            <p>꿈을 이뤄주는 기업/전문가 회원님들</p>
            <p>당신들이 있어 세상이 아름답습니다.</p>
            </div>
        </div>
		<!-- navigation -->
        <ul id ="navigation">
        	<img src = "resources/expert/images/moon2.png" alt="달" />
        	<li class="on"><a href="#hpTop">Helper Home</a></li>
            <li><a href="#HelperEdit" id="test">기업소개 변경</a></li>
            <li><a href="#HelperEdit2">회원정보 수정</a></li>
            <li><a href="#footer">Last</a></li>
        </ul>
        
        <!-- Today -->
        <div id ="today"><%=today %></div>
        
        <!-- Top 5 -->
        <div id="top5pointer">
            <table>
            <caption><p>Top 5 Point Rank</p></caption>
                <tr>
                    <th width="5%"></th>
                    <th width="10%">아이디</th>
                    <th width="10%">보유포인트</th>
                </tr>
            <c:forEach var="b" items="${ list }">
                <tr>
                    <td class="rowp" scope="row" align="center"><%=num++ %></td>
                    <td align="center">${ b.coId }</td>
                    <td align="center">${ b.point }</td>
                </tr>
            </c:forEach>
            </table>
        </div>
        
        <!--------------------------------------------------------------------------->
        <!-- 1 -->
        <!--------------------------------------------------------------------------->
        <input type="hidden" id ="insertResult" value ="${result }">
        <div class="inner_content" id="HelperEdit">
            <div class ="helperEdit">
                <h1 align="center">1</h1>
                <br>
                <form id="submitform" class="submitAreaOff" action="comUpdate.ex" method="post" enctype="Multipart/form-data"> 
                    <table class="et th1">
                        <tr>
                            <th colspan="3" class="title">기업소개 변경</th>
                        </tr>
                        <tr>
                            <th colspan="3"><p class="op">&nbsp;</p></th>
                        </tr>
                        <tr>
                            <td class="rown"><p>업체사진</p></td>
                            <td><div id="igm-area">
                                    <img id="foo" src="resources/muploadFiles/${com.checkImg }" /></div></td>
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
                            <td><input type="text" value="${cateName}" readonly></td> <%--${com.cateNum } --%>
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
                            <td colspan="2"><textarea id="textArea" name="coIntro">${com.coIntro}</textarea></td>
                        </tr>
                        <tr>
                            <th colspan="3"><p class="op">&nbsp;</p></th>
                        </tr>
                        <tr>
                            <td colspan="3" id="submitBtn-Area">
                                <button type="submit" class="btn btn--primary2" id="submitBtn">클릭하시면  정보를 변경합니다.</button>
                            </td>
                        </tr>
                    </table>
                    <br>
                 </form> 
            </div>
        </div>
        <!--------------------------------------------------------------------------->
        <!-- 2 -->
        <!--------------------------------------------------------------------------->
           <div class="inner_content2" id="HelperEdit2">
            <div class ="helperEdit2">
			<h1 align="center">2</h1>
			<br>
			<form id="submitform2" action="helperUpdate.ex" onsubmit="return submitCheck(this);">
				<table class="et th2">
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
                            type="hidden" value="${com.coId }" name="coId">
                            <input type ="text" value ="${com.coId}" readonly style="color:red"></td>
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
						<td><input type="text" id="newPwd" name="coPwd"></td>
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
						<td><input type="text" value="${com.busiEmail}" name="busiEmail"></td>
					</tr>
					<tr>
						<td class="rown">Phone</td>
						<td><input type="text" placeholder="-는 빼고 입력해주세요."
							value="${com.coTel}" name="coTel"></td>
					</tr>

					<tr>
						<td class="rown">Hompage</td>
						<td><input type="text" value="${com.homePage}" name="homePage"></td>
                    </tr>
                    
                    <tr>
                        <th colspan="3"><p class="op">&nbsp;</p></th>
                    </tr>
                    <tr>
                        <td colspan="3" id="submitBtn-Area">
                    <button type="submit" class="btn btn--primary2" id="submitBtn">클릭하시면 정보를 변경합니다.</button>
                        </td>
                    </tr>
				</table>
            </form>
            </div>
        </div>
        <!--------------------------------------------------------------------------->
        <!-- 3 -->
        <!--------------------------------------------------------------------------->
	<div class="inner_content" id="footer">
		<div class="helperEdit">
		sdfds
		</div>
	</div>
    <jsp:include page="/WEB-INF/views/expert/hp_upper.jsp" />
    <script src="resources/expert/js/intro.js"></script>
 
</body>
</html>