<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form action="${path}/home/updateProfile.do" 
	method="post" enctype="multipart/form-data">
<input type="text" name="m_id" value="${member.m_id }"> 

<div class="pic_container d-flex align-items-end">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100">
</div> 

<table class="table table-border">
	<tr>
		<td>${member.m_profile }<input type="file" name="file_p"></td>
		<td colspan="3">${member.m_bg }<input type="file" name="file_b"></td>
	</tr>
	<tr>
		<td><input type="text" name="m_nickname" value="${member.m_nickname }"
				required="required"></td>
		<td colspan="2"></td>
		<td><input type="submit" value="저장"></td>
	</tr>
	<tr>
		<td>${member.m_id }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea cols="30" rows="5" name="m_intro"></textarea></td>
	</tr>
</table>
</form>
<div id="peanut"></div>
</div>

<script type="text/javascript">
	function thumbnail() {
		
	}
</script>
</body>
</html>