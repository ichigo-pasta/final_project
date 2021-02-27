<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<form action="updateProfile.do" method="post" enctype="multipart/form-data">
<table class="table table-border">
	<tr>
		<td>${member.m_profile }프로필</td>
		<td colspan="3">${member.m_bg }배경</td>
	</tr>
	<tr>
		<td>${member.m_name }<input type="text" ></td>
		<td colspan="2"></td>
		<td><a href="${path}/home/profileUpdate.do?m_id=${member.m_id }">저장</a></td>
	</tr>
	<tr>
		<td>${member.m_id }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea></textarea>자기소개</td>
	<tr>
		<td>${member.m_regdate }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td>팔로우</td>
		<td>팔로워</td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="2">피넛</td>
		<td colspan="2">사진 피넛</td>
	</tr>
</table>
</form>
<div id="peanut"></div>
</div>
</body>
</html>