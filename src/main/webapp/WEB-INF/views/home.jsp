<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>


<a href="writer.me">멤버이동</a>



<a href="info.ex?coId=TEST">전문가이동</a>

<a href="expertIntro.ex">전문가이동</a>



<a href="login.co">로그인 이동</a>

<a href="adminwrite.ad">관리자 이동</a>  

<a href="esrequest.ex?coId=TEST&bkNo=3">견적서 발송</a>

</body>
</html>
