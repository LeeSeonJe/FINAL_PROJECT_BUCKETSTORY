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

<a href="main.ho?menuNum=1&category=1">메인 이동</a>

<a href="writer.me">멤버이동</a>


<a href="info.ex?coid=TEST">전문가이동</a>

</body>
</html>
