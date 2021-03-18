<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div style="display: flex; flex-direction: column; justify-content: space-between; height: 91.35vh; top: 85px" class="sticky-top">
	<div class="btn-group-vertical" role="group" style="width: 123px; margin-top: 10px">
		<button type="button"
			onclick="location.href='${path}/home/timeline.do'"
			class="btn btn-outline-secondary menuBt" id="timelineBt" style="text-align: left">
			<i class="bi-house-door-fill"></i>&nbsp;&nbsp;홈
		</button>
		<button type="button" onclick="location.href='${path}/home/notice.do'"
			class="btn btn-outline-secondary menuBt" id="noticeBt" style="text-align: left">
			<i class="bi-bell-fill"></i>&nbsp;&nbsp;알림
			<span class="badge rounded-pill bg-info text-dark invisible" id="notice_cnt"></span>
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
	<div style="padding: 10px 10px 10px 10px; border: 1px solid white; border-radius: 5px; background: #f0aa5f;
		 margin-bottom: 3vh">
		<div style="display: flex; justify-content: space-between;">
			<img alt="" src="${path}/resources/images/${m_profile}" width="50"
				height="50" style="border-radius: 5px;">
			<div class="btn-group dropup">
				<a class="btn dropdown" type="button"
					id="dropdownMenuButton" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="bi bi-three-dots"></i></a>
				<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
					<li>
						<a class="dropdown-item" 
							href="${path}/logout.do" style="color: black">로그아웃</a></li>
					<li>
						<a class="dropdown-item" 
							href="${path}/home/blockList.do"  style="color: black">차단 목록</a></li>
					<li>
						<a class="dropdown-item" 
							style="color: black" onclick="del()">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div>
				<div class="col" style="color: black"><b>${m_nickname}</b></div>
				<div class="col" style="color: black">
					<small>
						<c:if test="${fn:length(m_id) gt 14 }">
							<c:out value="@${fn:substring(m_id, 0, 12) }..." />	
						</c:if>
						<c:if test="${fn:length(m_id) lt 15 }">
							<c:out value="${m_id }"/>
						</c:if>
					</small>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var notice_refresh;
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id=" + m_id;
	}
	function bookmark(m_id) {
		location.href = "${path}/home/bookmarkForm.do?m_id=" + m_id;
	}
	window.addEventListener('load', function() {
		notice_load();
		notice_refresh = setInterval(notice_load, 10000);
		var currentPage = location.href.split("/")[location.href.split("/").length-1];
		if (currentPage.startsWith('timeline.do')) {
			btnReset();
			document.getElementById('timelineBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		} else if (currentPage.startsWith('notice.do')) {
			btnReset();
			document.getElementById('noticeBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
		else if (currentPage.startsWith('message.do')) {
			btnReset();
			document.getElementById('messageBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
		else if (currentPage.startsWith('bookmarkForm.do')) {
			btnReset();
			document.getElementById('bookmarkBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
		else if (currentPage.startsWith('profileForm.do')) {
			btnReset();
			document.getElementById('profileBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
		else if (currentPage.startsWith('profileUpdateForm.do')) {
			btnReset();
			document.getElementById('profileBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
		else if (currentPage.startsWith('writeForm.do')) {
			btnReset();
			document.getElementById('writeFormBt').setAttribute('class','btn btn-dark btn-outline-light menuBt');
		}
	});	
	function btnReset() {
		var buttons = document.getElementsByClassName('menuBt');
		for (var bt of buttons) {
			bt.setAttribute('class','btn btn-outline-secondary menuBt');
		}
	}
	function notice_load() {
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				var notice_count = xhr.responseText;
				if(notice_count <= 0) {
					document.getElementById('notice_cnt').setAttribute('class','badge rounded-pill bg-info text-dark invisible');
				} else if (notice_count < 10) {
					document.getElementById('notice_cnt').setAttribute('class','badge rounded-pill bg-info text-dark');
					document.getElementById('notice_cnt').innerHTML = notice_count;
				} else {
					document.getElementById('notice_cnt').setAttribute('class','badge rounded-pill bg-info text-dark');
					document.getElementById('notice_cnt').innerHTML = '9+';
				}
				
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/noticeLoad.do",true);
		xhr.send(null);
	}
	function del() {
		var con = confirm("정말로 탈퇴하시겠습니까?");
		if (con) location.href = "${path}/deleteMember.do";
		else {
			alert("탈퇴가 취소되었습니다.");
			return;
		}
	}
</script>