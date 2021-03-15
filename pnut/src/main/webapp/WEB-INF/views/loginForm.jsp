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
	.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
	html,
	body {
  		height: 100%;
	}
	.form-signin {
		width: 100%;
		max-width: 330px;
		padding: 15px;
		margin: auto;
		background: #464646
	}

	.form-signin .form-control {
		position: relative;
		box-sizing: border-box;
		height: auto;
		padding: 10px;
		font-size: 16px;
	}

	.form-signin .form-control:focus {
		z-index: 2;
	}

	.form-signin input[type="text"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}

	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
</style>
</head>
<body class="text-center">
<main class="form-signin">
  <form action="login.do" method="post">
    <img class="mb-4" src="${path}/resources/images/P-Nut.png" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal" style="color: white">P-Nut 로그인</h1>
    <label for="inputId" class="visually-hidden">아이디를 입력해주세요</label>
    <input type="text" id="inputId" name="m_id" 
    	class="form-control" placeholder="아이디를 입력해주세요" required autofocus>
    <label for="inputPassword" class="visually-hidden">비밀번호를 입력해주세요</label>
    <input type="password" id="inputPassword" name="m_pw"
    	class="form-control" placeholder="비밀번호를 입력해주세요" required>
    <button class="w-100 btn btn-lg" type="submit"
    	style="background: #D27D32 ">로그인</button>
    <p class="mt-5 mb-3 text-muted">
    	<a href="joinForm.do">
		<i class="bi-person-fill"></i>P-Nut 가입</a></p>
    <p class="mt-5 mb-3 text-muted">&copy; 2021-03-19</p>
  </form>
</main>
</div>
</body>
</html>