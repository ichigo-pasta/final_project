<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	차단하는 유저가 없습니다.
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="mem">
		<div class="row">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${mem.m_profile}" width="80px" height="80px"
					onclick="profile('${mem.m_id}')" class="profile_pic">
			</div>
			<div class="col">
				<b>${mem.m_nickname}</b><br>
				@${mem.m_id }<br>
				${mem.m_intro } 
			</div>
			<div class="col col-1" style="width: 100px">
				<button id="bbt${mem.m_id}" onclick="unblock('${mem.m_id}')" 
					onmouseover="this.innerText='차단 해제'" 
					onmouseout="this.innerText='차단됨'">차단됨</button>
			</div>
		</div>
	</c:forEach>
</c:if>
</div>

<script type="text/javascript">
function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
function block(m_id) {
	buttonChange();
	var xhr = new XMLHttpRequest();
	xhr.open("get","${path}/block.do?m_id="+m_id,true);
	xhr.onload = function() {
		if (xhr.status == 200 || xhr.status == 201) {
			console.log('success');
		} else {
			alert('요청오류: '+xhr.status);
		}
	}
	xhr.send(null);
}
function buttonChange() {
	var btn = document.getElementById('followbt');		
	btn.setAttribute("onclick","unblock('${mem.m_id}')");
	btn.setAttribute("onmouseover","this.innerText='차단 해제'");
	btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
}
function unblock(m_id) {
	buttonChange4(m_id);
	var xhr = new XMLHttpRequest();
	xhr.open("get","${path}/unblock.do?m_id="+m_id,true);
	xhr.onload = function() {
		if (xhr.status == 200 || xhr.status == 201) {
			console.log('success');
		} else {alert('요청오류: '+xhr.status);}
	}
	xhr.send(null);
}
function buttonChange4(m_id) {
	var btn = document.getElementById('fbt'+m_id);
	btn.innerText = '차단';
	btn.setAttribute("onclick","block('${mem.m_id}')");
	btn.removeAttribute("onmouseover");
	btn.removeAttribute("onmouseout");
}	
</script>