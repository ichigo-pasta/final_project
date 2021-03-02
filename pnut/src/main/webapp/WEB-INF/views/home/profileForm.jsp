<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$(function () {
		$('#peanut').load('${path}/nolay/peanutList.do?amt=20');
	});
</script> -->
<style type="text/css">
.pic_container {
	height: 200px;
	background-image: url('${path}/resources/images/${member.m_bg}');
	background-size: 100% 100%;
}
</style>
</head>
<body>
<div id="container">
<div class="pic_container d-flex align-items-end">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100">
</div> 
<table class="table table-border">
	<tr>
		<td>${member.m_nickname }</td>
		<td colspan="2"></td>
		<td><a href="${path}/home/profileUpdateForm.do?m_id=${member.m_id }">프로필 수정</a></td>
	</tr>
	<tr>
		<td>${member.m_id }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="4">${member.m_intro }</td>
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