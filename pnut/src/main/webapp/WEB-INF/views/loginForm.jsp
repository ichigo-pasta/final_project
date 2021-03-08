<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><%@ include file="header.jsp" %><%@ include file="header2.jsp" %>
<title>P-Nut</title>
<style type="text/css">
	
	.in {
		display: flex;
		height: 100vh;
		justify-content: center;
		align-items: center;
	}
</style>
</head>
<body>
<div class="container">
<form action="login.do" method="post">
	<div class="in">
	<div class="row" align="center">
		<div class="col" align="center">
			<div class="row">
				<div class="col">
					<h2 class="text-primary">로그인</h2>
				</div>
			</div>
			<div class="row">
				<div class="col col-6">
					<i class="bi-person-fill">&nbsp;</i>아이디
				</div>
				<div class="col col-6">
					<input type="text" name="m_id" 
						required="required" autofocus="autofocus">
				</div>
			</div>
			<div class="row">
				<div class="col col-6">
					<i class="bi-lock-fill">&nbsp;</i>비밀번호
				</div>
				<div class="col col-6">
					<input type="password" name="m_pw" 
						required="required">
				</div>
			</div>
			<div class="row">
				<div class="col" align="center">
					<input type="submit" value="로그인" class="btn btn-warning">
					<a href="joinForm.do" class="btn btn-success">
					<i class="bi-person-fill">회원가입</i></a>
				</div>
			</div>
		</div>
	</div>
	</div>
</form>
</div>
</body>
</html>