<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("연결이 실패하였습니다.");
		history.back();
	</script>
</c:if>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href = "${path}/home/profileForm.do?m_id=${m_id}";
	</script>
</c:if>