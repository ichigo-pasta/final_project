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
<style type="text/css">
div.relative {
  position: relative;
  width: auto; height: auto;
  max-width: 100%;
  max-height: 200px;
  z-index: 0;
  border: 3px solid #73AD21;
  overflow: hidden;
} 

div.absolute {
  position: absolute;
  bottom: 0px;
  left: 0px;
  max-width: 100px;
  max-height:100px;
  object-fit: cover;
  border: 3px solid #73AD21;
}
</style>
</head>
<body>
<div id="container">
<div class="relative">
	<img alt="" src="${path}/resources/images/${member.m_bg}">
		<div class="absolute">
			<img alt="" src="${path}/resources/images/${member.m_profile}"></div>
</div> 
<table class="table table-border">
	<%-- <tr>
		<td><img alt="" src="${path}/resources/images/${member.m_bg}">
			<img alt="" src="${path}/resources/images/${member.m_profile}"></td>
	</tr> --%>
	<tr>
		<td>${member.m_name }</td>
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
<a href="${path}/logout.do">로그아웃</a>
<div id="peanut"></div>
</div>
</body>
</html>