<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<c:forEach items="${list}" var="pn">
	<p class="contentRow">${pn.content}, ${pn.member.m_profile}</p>
</c:forEach>
</div>
</body>
</html>