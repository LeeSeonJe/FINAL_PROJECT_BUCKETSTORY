<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel ="stylesheet" href ="resources/expert/css/hp_helperBucketList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/expert/hp_common.jsp"/>
  <section class ="section">
       

        <div class ="wraper">
        <aside class ="side-bar">
            <div class ="side-header">카테고리</div>
            <div class ="side-item"><p>ALL</p></div>
            <div class ="side-item"><p>여행</p></div>
            <div class ="side-item"><p>운동</p></div>
            <div class ="side-item">c4</div>
            <div class ="side-item">c5</div>
            <div class ="side-item">c6</div>
        </aside>
        <div class="inner">
            <div class="inner-title"><p>BucketList for Helper</p></div>

            <div class="container clearfix">

                <!-- db에서 -->
                <!-- <c:foreach >-->
                <div class ="content content__left">  
                   
                    <div class ="content__img"><img src="resources/expert/images/test.jpg" alt=""></div>
                    <div class ="content__title"><p>무작정 평택부터 서울까지 걸어가기 -- JUST RUN!</p></div>
                    <div class ="content__detail"><p>버킷리스트 설명입니다. 혼자서 엄청나게 합니다.계속 합니다.좋아합니다. 굳입니다. 계속 걸어 걸어!</p></div>
                </div>

                <div class ="content content__right">  
                    <div class ="content__img"><img src="resources/expert/images/barbara-girls.jpg" alt=""></div>
                    <div class ="content__title"><p>KH정보교육원에 있는 모든 여자 번호 따기</p></div>
                    <div class ="content__detail"><p>막장입니다. 그냥 합니다. do it !</p></div>
                </div>
                <!--</c:foreach> -->
                <div class ="content content__left">  
                   
                    <div class ="content__img"><img src="resources/expert/images/test.jpg" alt=""></div>
                    <div class ="content__title"><p>무작정 평택부터 서울까지 걸어가기 -- JUST RUN!</p></div>
                    <div class ="content__detail"><p>버킷리스트 설명입니다. 혼자서 엄청나게 합니다.계속 합니다.좋아합니다. 굳입니다. 계속 걸어 걸어!</p></div>
                </div>

                <div class ="content content__right">  
                    <div class ="content__img"><img src="resources/expert/images/barbara-girls.jpg" alt=""></div>
                    <div class ="content__title"><p>KH정보교육원에 있는 모든 여자 번호 따기</p></div>
                    <div class ="content__detail"><p>막장입니다. 그냥 합니다. do it !</p></div>
                </div>

                <div class ="content content__left">  
                   
                    <div class ="content__img"><img src="resources/expert/images/test.jpg" alt=""></div>
                    <div class ="content__title"><p>무작정 평택부터 서울까지 걸어가기 -- JUST RUN!</p></div>
                    <div class ="content__detail"><p>버킷리스트 설명입니다. 혼자서 엄청나게 합니다.계속 합니다.좋아합니다. 굳입니다. 계속 걸어 걸어!</p></div>
                </div>

                <div class ="content content__right">  
                    <div class ="content__img"><img src="resources/expert/images/barbara-girls.jpg" alt=""></div>
                    <div class ="content__title"><p>KH정보교육원에 있는 모든 여자 번호 따기</p></div>
                    <div class ="content__detail"><p>막장입니다. 그냥 합니다. do it !</p></div>
                </div>

                <div class ="content content__left">  
                   
                    <div class ="content__img"><img src="resources/expert/images/test.jpg" alt=""></div>
                    <div class ="content__title"><p>무작정 평택부터 서울까지 걸어가기 -- JUST RUN!</p></div>
                    <div class ="content__detail"><p>버킷리스트 설명입니다. 혼자서 엄청나게 합니다.계속 합니다.좋아합니다. 굳입니다. 계속 걸어 걸어!</p></div>
                </div>

                <div class ="content content__right">  
                    <div class ="content__img"><img src="resources/expert/images/barbara-girls.jpg" alt=""></div>
                    <div class ="content__title"><p>KH정보교육원에 있는 모든 여자 번호 따기</p></div>
                    <div class ="content__detail"><p>막장입니다. 그냥 합니다. do it !</p></div>
                </div>
              

                <!-- end container -->
            </div>
             <footer class="inner__bottom">

             </footer>
        </div>
    </div>
    <script>

        $(function(){
            $('#overlay').hide();
            $('#content-detail-modal').hide();
         });

        /* 가운데 정렬 */
        jQuery.fn.center = function () { 
            this.css('top', Math.max(0,(($(window).height()-$(this).outerHeight())/2) )+'px'); 
         // this.css('top', Math.max(0,(($(window).height()-$(this).outerHeight())/2) + $(window).scrollTop())+'px'); 
            this.css('left', Math.max(0,(($(window).width()-$(this).outerWidth())/2) + $(window).scrollLeft())+'px'); 
        return this; }

        $('.content').on('click',function(){
           $('#overlay').fadeIn(500);
           $('#content-detail-modal').center().fadeIn(300);
        });

        function test(){  
            $('#overlay').fadeOut(500);
            $('#content-detail-modal').fadeOut(300);
        }
    </script>


    <!-- 오버레이div-->
    <div id="overlay"></div>

    <!-- 버킷리스트 상세 모달창-->
    <div id="content-detail-modal">

        <div>
            <button id="modal-close-Btn" onclick="test();">X</button>

            <div class ="content content__center">  
                <div class ="content__title-c"><p>무작정 평택부터 서울까지 걸어가기 -- JUST RUN!</p></div>

                <div class ="content__img-c"><img src="resources/expert/images/test.jpg" alt=""></div>
               
                <div class ="content__detail-c"><p>버킷리스트 설명입니다. 혼자서 엄청나게 합니다.계속 합니다.좋아합니다. 굳입니다. 계속 걸어 걸어!</p></div>
           
            </div>
        </div>
    </div>
       
    </section>
</body>
</html>