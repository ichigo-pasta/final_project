<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("피넛이 삭제되었습니다..");
		location.href = "${path}/home/timeline.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("피넛이 삭제되지 않았습니다.");
		history.back();
	</script>
</c:if>