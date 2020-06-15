<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="resources/expert/css/hp_helperView.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
<%--  <jsp:include page="/WEB-INF/views/expert/hp_helperCon.jsp"/> --%>
    <section class="section">
       
        <div class="inner">
            <div class="inner__header">
                <p>Helper Viewer</p>
            </div>

            <div class="inner__content clearfix">
                <div class="c-img">
                    <img src ="resources/expert/images/barbara-girls.jpg" id ="">
                </div>
                <div class="c-cont">

                    <br>
                    <table class ="tbh">
                        <tr>
                            <td><p class="t-title">업체이름</p></td>
                            <td><input type="text" value ="화장품" style="margin-left: 50px; " readonly></td>
                        </tr>
                        <tr>
                            <td><p class="t-title">업체소개</p></td>
                            <td><textarea id="textArea" readonly>저희 업체는 의상디자인 전문업체입니다.세상에 단 하나뿐인 옷을 만들고 싶으신분? 저희가 도와드립니다. 어쩌구~~</textarea></td>
                        </tr>
                    </table>
                    <br>
                
                    <div class ="inner__review">
                       
                        <div class ="review">
                            <div>
                                <button class="btn btn--primary2">
                                    후기작성
                                </button>
                                </div>
                            <div><p>★★★☆☆</p></div>
                            <div><p>리뷰 평점(3)</p></div>
                            
                        </div>
                   
                     
                    <br>

            

                        <div class ="reply clearfix">
                            <div class ="reply__title"><p>Review</p></div>

                            <div class ="reply__area">
                               <!-- start -->
                                <div class ="r-user">
                                    <p>유저명1454545</p>
                                </div>

                                <div class ="r-content">
                                    <p>쓰레기 기업입니다.ghjghjgjghjgjjhhjhjkhjkhjkhjk</p>
                                </div>

                                <div class ="r-score">
                                    <p>★★☆☆☆</p>
                                </div>
                                 <!-- end -->                          
                            </div>

                            <div class ="reply__area">
                                <!-- start -->
                                 <div class ="r-user">
                                     <p>유저명1</p>
                                 </div>
 
                                 <div class ="r-content">
                                     <p>쓰레기 기업입니다.</p>
                                 </div>
 
                                 <div class ="r-score">
                                     <p>★☆☆☆☆</p>
                                 </div>
                                  <!-- end -->                          
                             </div>

                             <div class ="reply__area">
                                <!-- start -->
                                 <div class ="r-user">
                                     <p>유저명13</p>
                                 </div>
 
                                 <div class ="r-content">
                                     <p>쓰레기 기업입니다.dfdfddf</p>
                                 </div>
 
                                 <div class ="r-score">
                                     <p>★☆☆☆☆</p>
                                 </div>
                                  <!-- end -->                          
                             </div>

                        </div>
            
                    </div> <!--inner__review -->

                </div>
            </div> 

        </div> <!-- end inner-->

    </section>
</body>
</html>