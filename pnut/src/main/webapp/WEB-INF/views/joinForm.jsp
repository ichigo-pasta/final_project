<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><%@ include file="header.jsp" %><%@ include file="header2.jsp" %>
<title>P-Nut</title>
<script type="text/javascript">
	var id_pw_regexp = /^[a-zA-Z0-9]{5,20}$/;	// 영문/숫자 5~20자리 가능한 정규식
	function chk() {
		if (form.m_pw.value != form.m_pwConfirm.value) {
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
			form.m_pw.focus();  	// 커서를 m_pw에 올림
			form.m_pw.value = ""; // m_pw 입력값 삭제
			return false;  		// action을 하지않음
		}
	}
	function idChk() {
		if (!form.m_id.value) {
			alert("아이디를 입력하고 중복체크 하세요");
			form.m_id.focus();
			return false;
		} else if(!id_pw_regexp.test(form.m_id.value)) {
			alert("영문/숫자만으로 5~20자로 만들어주세요");
			form.m_id.focus();
			return false;
		}
		// jquery에 있는 ajax를 사용
		// data는 Controller가 보내준 msg가 들어온다
		$.post("idChk.do", "m_id="+form.m_id.value, function(data) {
			$('#disp').html(data);
		});
	}
</script>
</head>
<body>
<div class="container" align="center" style="width: 400px;">
	<h2 class="text-primary">회원가입</h2>
<form action="join.do" method="post" 
	onsubmit="return chk()" name="form">
<table class="table table-striped" style="width: 400px;">
<!-- 아이디 체크 -->
	<tr>
		<td style="color: #D27D32">아이디</td>
		<td><input type="text" name="m_id" required="required" autofocus="autofocus"
				pattern="^([a-zA-Z0-9]){5,20}$" placeholder="영문/숫자 5~20자" title="영문/숫자 5~20자">
			<input type="button" onclick="idChk()"
				class="btn btn-info btn-sm" value="중복체크"
				style="background: #D27D32;">
			<div id="disp" class="err"></div></td>
	</tr>
<!-- 비밀번호, 비밀번호 확인 체크 -->	
	<tr>
		<td style="color: #D27D32">비밀번호</td>
		<td><input type="password" name="m_pw" required="required" pattern="^([a-zA-Z0-9]){5,20}$" placeholder="영문/숫자 5~20자" title="영문/숫자 5~20자"></td>
	</tr>
	<tr>
		<td style="color: #D27D32">비밀번호 확인</td>
		<td><input type="password" name="m_pwConfirm" required="required" pattern="^([a-zA-Z0-9]){5,20}$"></td>	
	</tr>
	<tr>
		<td style="color: #D27D32">이름</td>
		<td><input type="text" name="m_name" required="required"></td>
	</tr>
	<tr>
		<td style="color: #D27D32">별명</td>
		<td><input type="text" name="m_nickname" required="required"></td>
	</tr>
	<tr>
		<td style="color: #D27D32">이메일</td>
		<td><input type="email" name="m_email" required="required"></td>
	</tr>
	<tr>	
		<td style="color: #D27D32">전화번호</td>
		<td><input type="tel" name="m_tel" required="required" placeholder="00*-000*-0000"
			pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" title="00*-000*-0000"></td>
	</tr>
	<tr>	
		<td colspan="2" align="center"><input type="submit" value="가입" style="background: #D27D32;"></td>
	</tr>
</table>
</form>
<a href="loginForm.do">로그인 화면</a>
</div>
</body>
</html>