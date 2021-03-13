<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert('이미 차단중인 계정입니다');
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('차단과정에서 오류가 발생했습니다');
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert('해당 사용자를 차단 목록에 등록했습니다');
		location.href = "${path}/home/timeline.do";
	</script>
</c:if>