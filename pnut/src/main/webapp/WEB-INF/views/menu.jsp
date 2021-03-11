<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div style="display: flex; flex-direction: column; justify-content: space-between; height: 90vh" >
	<div class="btn-group-vertical" role="group" style="width: 110px">
		<button type="button"
			onclick="location.href='${path}/home/timeline.do'"
			class="btn btn-outline-secondary">
			<i class="bi-house-door-fill"></i>&nbsp;&nbsp;홈
		</button>
		<button type="button" onclick="location.href='${path}/home/notice.do'"
			class="btn btn-dark">
			<i class="bi-bell-fill"></i>&nbsp;&nbsp;알림
		</button>
		<button type="button"
			onclick="location.href='${path}/home/message.do'"
			class="btn btn-dark">
			<i class="bi-envelope-fill"></i>&nbsp;&nbsp;메시지
		</button>
		<button type="button" onclick="bookmark('${m_id}');"
			class="btn btn-dark">
			<i class="bi-bookmark-fill"></i>&nbsp;&nbsp;북마크
		</button>
		<button type="button" class="btn btn-dark"
			onclick="profile('${m_id}');">
			<i class="bi-person-fill"></i>&nbsp;&nbsp;프로필
		</button>
		<button type="button"
			onclick="location.href='${path}/home/writeForm.do'"
			class="btn btn-dark">
			<i class="bi-pencil-fill"></i>&nbsp;&nbsp;글쓰기
		</button>
	</div>
	<div>
		<div>
			<img alt="" src="${path}/resources/images/${m_profile}" width="50"
				height="50">
		</div>
		<div>
			<div>
				<div class="col"><b>${m_nickname}</b></div>
				<div class="col">@${m_id}</div>
				<a href="${path}/logout.do"
				class="list-group-item list-group-item-action list-group-item-warning">&nbsp;로그아웃</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id=" + m_id;
	}
	function bookmark(m_id) {
		location.href = "${path}/home/bookmarkForm.do?m_id=" + m_id;
	}
</script>