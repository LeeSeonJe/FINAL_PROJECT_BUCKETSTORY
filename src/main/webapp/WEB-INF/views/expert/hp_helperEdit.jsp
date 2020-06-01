<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_helperEdit.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
    <section>

      <div class="inner">

       <form id ="submitform">

        <table class ="et th1">
            <tr>
                <th colspan="3" class ="title">회원정보 수정(헬퍼)</th>
            </tr>
            <tr>
                <th colspan="3"><p class ="op">&nbsp;</p></th>
            </tr>
            <tr>
                <td class ="rown">회원아이디</td>
                <td><input type ="text"></td>
                <td>아이디는 변경 불가합니다.</td>
            </tr>
            <tr>
                <td class ="rown">비밀번호 </td>
                <td><input type ="text"></td>
                <td>검사1</td>
            </tr>
            <tr>
                <td class ="rown">비밀번호 확인</td>
                <td><input type ="text"></td>
                <td>검사2</td>
            </tr>
            <tr>
                <td class ="rown">Email</td>
                <td><input type ="text"></td>
            </tr>
            <tr>
                <td class ="rown">Phone</td>
                <td><input type ="text" placeholder="-는 빼고 입력해주세요."></td>
            </tr>
            <tr>
                <td class ="rown">주소</td>
                <td><input type ="text"></td>
                <td><button class ="btn">주소찾기</button></td>
            </tr>
            <tr>
                <td class ="rown">상세주소</td>
                <td><input type ="text"></td>
            </tr>
        </table>
  

        <br>
 
        <table class ="et th2">
            <tr>
                <th colspan="3" class ="title">기업소개 변경</th>
            </tr>
            <tr>
                <th colspan="3"><p class ="op">&nbsp;</p></th>
            </tr>
            <tr>
                <td class ="rown"><p>업체사진</p></td>
                <td><div id="igm-area">
                    <img src ="../image/barbara-girls.jpg" alt=""></div></td>
                <td><button class="btn">사진넣기</button></td>
            </tr>
            <tr>
                <td class ="rown"><p>업체이름</p></td>
                <td><input type="text"></td>
            </tr>

            <tr>
                <td class ="rown"><p>업체소개</p></td>
                <td colspan="2"><textarea id="textArea">저희 업체는 어쩌구~~</textarea></td>
            </tr>
            <tr>
                <th colspan="3"><p class ="op">&nbsp;</p></th>
            </tr>
            <tr>
                <td colspan="3" id ="submitBtn-Area">
                    <button type="submit" class ="btn btn--primary2" id="submitBtn">클릭하시면 정보를 변경합니다.</button>
                </td>
            </tr>
        </table>
        <br>
     
    </form>


        </div>
        
    </section>
</body>
</html>