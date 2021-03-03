<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="my_id" value="${sessionScope.m_id}"></c:set>
<c:if test="${empty my_id }">
	<script>
		location.href="${path}/loginForm.do";
	</script>
</c:if>