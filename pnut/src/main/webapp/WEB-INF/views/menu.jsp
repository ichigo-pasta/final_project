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
<table>
	<tr>
		<td><a href="${path}/menu/home" class="btn btn-warning">
				<i class="bi-house-door-fill">홈</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/search" class="btn btn-warning">
				<i class="bi-search">검색</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/notice" class="btn btn-warning">
				<i class="bi-bell-fill">알림</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/message" class="btn btn-warning">
				<i class="bi-envelope-fill">메시지</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/bookmark" class="btn btn-warning">
				<i class="bi-bookmark-fill">북마크</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/follow" class="btn btn-warning">
				<i class="bi-person-fill">팔로우</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/menu/write" class="btn btn-warning">
				<i class="bi-pencil-fill">글쓰기</a></td>
	</tr>
</table>
</body>
</html>