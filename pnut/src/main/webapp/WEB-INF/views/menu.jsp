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
		<td><a href="${path}/home/timeline.do?amt=20" class="btn btn-warning">
				<i class="bi-house-door-fill">홈</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/search.do" class="btn btn-warning">
				<i class="bi-search">검색</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/notice.do" class="btn btn-warning">
				<i class="bi-bell-fill">알림</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/message.do" class="btn btn-warning">
				<i class="bi-envelope-fill">메시지</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/bookmark.do" class="btn btn-warning">
				<i class="bi-bookmark-fill">북마크</i></a></td>
	</tr>
	<tr>
		<td><a class="btn btn-warning" onclick="profile('${id}')">
				<i class="bi-person-fill">프로필</i></a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/writeForm.do" class="btn btn-warning">
				<i class="bi-pencil-fill">글쓰기</i></a></td>
	</tr>
</table>
</body>
</html>