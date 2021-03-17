<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("그 동안 P-Nut을 이용해주셔서 감사합니다.");
		location.href = "${path}/loginForm.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("탈퇴가 실행되지 않았습니다.");
		history.back();
	</script>
</c:if>