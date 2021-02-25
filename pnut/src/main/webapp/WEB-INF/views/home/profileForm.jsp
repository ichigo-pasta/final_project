<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		$('#peanut').load('${path}/nolay/peanutList.do?amt=20');
	});
</script>
</head>
<body>
<div id="container">
<table class="table table-border">
	<tr>
		<td>프로필 사진</td>
		<td colspan="3">배경 사진</td>
	</tr>
	<tr>
		<td>${member.m_name }</td>
		<td colspan="2"></td>
		<td>프로필 수정</td>
	</tr>
	<tr>
		<td>${member.m_id }</td>
		<td colspan="3"></td>
	</tr>
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
<div id="peanut"></div>
</div>
</body>
</html>