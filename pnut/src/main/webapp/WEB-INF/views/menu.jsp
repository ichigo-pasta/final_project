<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<table>
	<tr>
		<td><a href="${path}/home/timeline.do" 
				class="list-group-item list-group-item-action list-group-item-warning">
			<i class="bi-house-door-fill"></i>&nbsp;&nbsp;홈</a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/notice.do"
		 		class="list-group-item list-group-item-action list-group-item-warning">
			<i class="bi-bell-fill"></i>&nbsp;&nbsp;알림</a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/message.do" 
				class="list-group-item list-group-item-action list-group-item-warning">
			<i class="bi-envelope-fill"></i>&nbsp;&nbsp;메시지</a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/bookmark.do" 
				class="list-group-item list-group-item-action list-group-item-warning">
			<i class="bi-bookmark-fill"></i>&nbsp;&nbsp;북마크</a></td>
	</tr>
	<tr>
		<td><a class="list-group-item list-group-item-action list-group-item-warning" 
				href="javascript:profile('${m_id}');">
			<i class="bi-person-fill"></i>&nbsp;&nbsp;프로필</a></td>
	</tr>
	<tr>
		<td><a href="${path}/home/writeForm.do" 
				class="list-group-item list-group-item-action list-group-item-warning">
			<i class="bi-pencil-fill"></i>&nbsp;&nbsp;글쓰기</a></td>
	</tr>
	<tr>
		<td><a href="${path}/logout.do"
				class="list-group-item list-group-item-action list-group-item-warning">&nbsp;로그아웃</a></td>
	</tr>
</table>
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>