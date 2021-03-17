<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	팔로잉하는 유저가 없습니다.
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="mem">
		<div class="row" style="margin: 25px 15px 12px 3px">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${mem.m_profile}" width="80px" height="80px"
					onclick="profile('${mem.m_id}')" class="profile_pic">
			</div>
			<div class="col" style="margin: 0 25px; padding: 0px; border-bottom: 1px solid gray;">
				<b>${mem.m_nickname}</b><br>
				@${mem.m_id }<br>
			<c:if test="${mem.followMe == true}">
				나를 팔로우중입니다.	
			</c:if>				
				${mem.m_intro } 
			</div>
			<div class="col col-1 align-self-center" style="width: 120px">
				<button id="fbt${mem.m_id}" onclick="unfollow('${mem.m_id}')" 
					onmouseover="this.innerText='언팔로우'" 
					onmouseout="this.innerText='팔로우 중'"
					class="btn btn-outline-info">팔로우 중</button>
			</div>
		</div>
	</c:forEach>
</c:if>
</div>

<script type="text/javascript">
function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
function follow(m_id) {
	buttonChange();
	var xhr = new XMLHttpRequest();
	xhr.open("get","${path}/follow.do?m_id="+m_id,true);
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
	btn.setAttribute("onclick","unfollow('${mem.m_id}')");
	btn.setAttribute("onmouseover","this.innerText='언팔로우'");
	btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
}
function unfollow(m_id) {
	buttonChange4(m_id);
	var xhr = new XMLHttpRequest();
	xhr.open("get","${path}/unfollow.do?m_id="+m_id,true);
	xhr.onload = function() {
		if (xhr.status == 200 || xhr.status == 201) {
			console.log('success');
		} else {alert('요청오류: '+xhr.status);}
	}
	xhr.send(null);
}
function buttonChange4(m_id) {
	var btn = document.getElementById('fbt'+m_id);
	btn.innerText = '팔로우';
	btn.setAttribute("onclick","follow('${mem.m_id}')");
	btn.removeAttribute("onmouseover");
	btn.removeAttribute("onmouseout");
}	
</script>