<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	<div style="text-align: center;"><br>팔로워가 없습니다.</div>
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="pn">
		<div class="row" style="margin: 25px 15px 12px 3px">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${pn.m_profile}" width="80px" height="80px"
					onclick="profile('${pn.m_id}')" class="profile_pic">
			</div>
			<div class="col" style="margin: 0 25px; padding: 0px; border-bottom: 1px solid gray;">
				<b>${pn.m_nickname}</b><br>
				@${pn.m_id }<br>
				${pn.m_intro }
			</div>
		</div>
	</c:forEach>
</c:if>
</div>
<script type="text/javascript">
function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>