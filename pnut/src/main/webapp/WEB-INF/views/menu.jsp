<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
	<tr>
		<td><a href="${path}/menu/home" class="btn btn-warning">로고</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/home" class="btn btn-warning">홈</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/search" class="btn btn-warning">검색</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/notice" class="btn btn-warning">알림</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/message" class="btn btn-warning">메시지</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/bookmark" class="btn btn-warning">북마크</a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/follow" class="btn btn-warning">팔로우</a></td>
	</tr>
</table>
</body>
</html>