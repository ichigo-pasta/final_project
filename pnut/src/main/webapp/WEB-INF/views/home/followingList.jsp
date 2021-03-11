<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container">
	<c:forEach items="${list }" var="pn">
		<div class="row">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${pn.m_profile}" width="80px" height="80px"">
			</div>
			<div class="col">
				<b>${pn.m_nickname}</b><br>
				@${pn.m_id }<br>
				${pn.m_intro } 
			</div>
		</div>
	</c:forEach>
</div>