<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	팔로워가 없습니다.
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="pn">
		<div class="row">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${pn.m_profile}" width="80px" height="80px"
					onclick="profile('${pn.m_id}')" class="profile_pic">
			</div>
			<div class="col">
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