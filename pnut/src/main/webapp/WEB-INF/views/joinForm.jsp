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
<div class="container" align="center">
	<h2 class="text-primary">회원가입</h2>
<form action="join.do" method="post">
<table class="table table-striped">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" required="required"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="pwConfirm" required="required"></td>	
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" required="required"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="email" required="required"></td>
	</tr>
	<tr>	
		<td>전화번호</td>
		<td><input type="tel" name="tel" required="required"></td>
	</tr>
	<tr>	
		<td colspan="2"><input type="submit" value="가입"></td>
	</tr>
</table>
</form>
<a href="loginForm.do">로그인 화면</a>
</div>
</body>
</html>