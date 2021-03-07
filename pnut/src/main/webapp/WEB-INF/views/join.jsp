<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><%@ include file="header.jsp" %><%@ include file="header2.jsp" %>
<title>P-Nut</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("P-Nut에 가입해주셔서 감사합니다.");
		location.href = "loginForm.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("회원가입이 되지 않았습니다.");
		history.back();
	</script>
</c:if>
</body>
</html>