<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><%@ include file="header.jsp" %><%@ include file="header2.jsp" %>
<title>P-Nut</title>
</head>
<body>
<div class="container">
<h2 class="text-primary">로그인</h2>
<form action="login.do" method="post">
	<table class="table table-bordered table-hover">
		<tr>
			<td>아이디<i class="bi-person-fill"></i></td>
			<td><input type="text" name="m_id" 
				required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<td>비밀번호<i class="bi-lock-fill"></i></td>
			<td><input type="password" name="m_pw" 
				required="required"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인"></td>
		</tr>	
	</table>

</form>
<div align="center">
	<a href="joinForm.do" class="btn btn-success">
		<i class="bi-person-fill">회원가입</i></a>
</div>
</div>
</body>
</html>