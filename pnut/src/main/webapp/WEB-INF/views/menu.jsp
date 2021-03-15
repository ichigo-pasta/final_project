<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div style="display: flex; flex-direction: column; justify-content: space-between; height: 90vh; top: 60px" class="sticky-top">
	<div class="btn-group-vertical" role="group" style="width: 110px;">
		<button type="button"
			onclick="location.href='${path}/home/timeline.do'"
			class="btn btn-outline-secondary menuBt" id="timelineBt" style="text-align: left">
			<i class="bi-house-door-fill"></i>&nbsp;&nbsp;홈
		</button>
		<button type="button" onclick="location.href='${path}/home/notice.do'"
			class="btn btn-outline-secondary menuBt" id="noticeBt" style="text-align: left">
			<i class="bi-bell-fill"></i>&nbsp;&nbsp;알림
		</button>
		<button type="button"
			onclick="location.href='${path}/home/message.do'"
			class="btn btn-outline-secondary menuBt" id="messageBt" style="text-align: left">
			<i class="bi-envelope-fill"></i>&nbsp;&nbsp;메시지
		</button>
		<button type="button" onclick="bookmark('${m_id}');"
			class="btn btn-outline-secondary menuBt" id="bookmarkBt" style="text-align: left">
			<i class="bi-bookmark-fill"></i>&nbsp;&nbsp;북마크
		</button>
		<button type="button" class="btn btn-outline-secondary menuBt"
			onclick="profile('${m_id}');" id="profileBt" style="text-align: left">
			<i class="bi-person-fill"></i>&nbsp;&nbsp;프로필
		</button>
		<button type="button"
			onclick="location.href='${path}/home/writeForm.do'"
			class="btn btn-outline-secondary menuBt" id="writeFormBt" style="text-align: left">
			<i class="bi-pencil-fill"></i>&nbsp;&nbsp;글쓰기
		</button>
	</div>
	<div>
		<div style="display: flex; justify-content: space-between;">
			<img alt="" src="${path}/resources/images/${m_profile}" width="50"
				height="50">
			<div class="btn-group dropup">
				<a class="btn btn-light dropdown" type="button"
					id="dropdownMenuButton" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="bi bi-three-dots"></i></a>
				<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
					<li>
						<a class="dropdown-item" 
							href="${path}/logout.do">로그아웃</a></li>
					<li>
						<a class="dropdown-item" 
							href="${path}/home/blockList.do?m_id=${m_id}">차단 목록</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div>
				<div class="col"><b>${m_nickname}</b></div>
				<div class="col">@${m_id}</div>
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
	window.onload = function () {
		var currentPage = location.href.split("/")[location.href.split("/").length-1];
		if (currentPage.startsWith('timeline.do')) {
			btnReset();
			document.getElementById('timelineBt').setAttribute('class','btn btn-dark menuBt');
		} else if (currentPage.startsWith('notice.do')) {
			btnReset();
			document.getElementById('noticeBt').setAttribute('class','btn btn-dark menuBt');
		}
		else if (currentPage.startsWith('message.do')) {
			btnReset();
			document.getElementById('messageBt').setAttribute('class','btn btn-dark menuBt');
		}
		else if (currentPage.startsWith('bookmarkForm.do')) {
			btnReset();
			document.getElementById('bookmarkBt').setAttribute('class','btn btn-dark menuBt');
		}
		else if (currentPage.startsWith('profileForm.do')) {
			btnReset();
			document.getElementById('profileBt').setAttribute('class','btn btn-dark menuBt');
		}
		else if (currentPage.startsWith('writeForm.do')) {
			btnReset();
			document.getElementById('writeFormBt').setAttribute('class','btn btn-dark menuBt');
		}
	}
	function btnReset() {
		var buttons = document.getElementsByClassName('menuBt');
		for (var bt of buttons) {
			bt.setAttribute('class','btn btn-outline-secondary menuBt');
		}
	}
</script>