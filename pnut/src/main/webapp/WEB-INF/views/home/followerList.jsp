<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	<div style="text-align: center;"><br>팔로워가 없습니다.</div>
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="mem">
		<div class="row" style="margin: 25px 15px 12px 3px">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${mem.m_profile}" width="80px" height="80px"
					onclick="profile('${mem.m_id}')" class="profile_pic">
			</div>
			<div class="col content_col" id="content${mem.m_id}" style="margin: 0 25px; padding: 0px; border-bottom: 1px solid gray;">
				<b id="conbold${mem.m_id}"><c:out value="${mem.m_nickname}"/></b> <c:out value="@${mem.m_id}"/><br>			
				<pre id="contpre${mem.m_id}">${mem.m_intro }</pre>
			</div>
			<c:if test="${mem.followByMe == true }">
			<div class="col col-1 align-self-center" style="width: 120px">
				<button id="fbt${mem.m_id}" onclick="unfollow('${mem.m_id}')" 
					onmouseover="this.innerText='언팔로우'" 
					onmouseout="this.innerText='팔로우 중'"
					class="btn btn-outline-info">팔로우 중</button>
			</div>
			</c:if>
			<c:if test="${mem.followByMe == false }">
			<div class="col col-1 align-self-center" style="width: 120px">
				<button id="fbt${mem.m_id}" onclick="follow('${mem.m_id}')"
					class="btn btn-outline-info">팔로우</button>
			</div>
			</c:if>
			
		</div>
	</c:forEach>
</c:if>
</div>
<script type="text/javascript">
	var startX;
	var startY;
	const judge = 5;
	var cont_rows = document.getElementsByClassName('content_col');
	for(var cont_row of cont_rows) {
		cont_row.addEventListener('mousedown', function(event) {				
			startX = event.pageX;
			startY = event.pageY;
		});			
		cont_row.addEventListener('mouseup', function(event) {
			var diffX = Math.abs(startX - event.pageX);
			var diffY = Math.abs(startY - event.pageY);
			if(diffX < judge || diffY < judge) {
				var cr_id = event.target.id.substring(7);
				location.href="${path}/home/profileForm.do?m_id="+cr_id;
			}				
		});
	}
	function profile(m_id) {
			location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function follow(m_id) {	
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('follow success');
				buttonChange3(m_id);
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/follow.do?m_id="+m_id,false);
		xhr.send(null);
	}
	function buttonChange3() {
		var btn = document.getElementById('fbt' + arguments[0]);		
		btn.setAttribute("onclick","unfollow('" + arguments[0] + "')");
		btn.setAttribute("onmouseover","this.innerText='언팔로우'");
		btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
	}
	function unfollow(m_id) {	
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('unfollow success');
				buttonChange4(m_id);
			} else {alert('요청오류: '+xhr.status);}
		}
		xhr.open("get","${path}/unfollow.do?m_id="+m_id,false);
		xhr.send(null);
	}
	function buttonChange4() {
		var btn = document.getElementById('fbt' + arguments[0]);
		btn.innerText = '팔로우';
		btn.setAttribute("onclick","follow('" + arguments[0] + "')");
		btn.removeAttribute("onmouseover");
		btn.removeAttribute("onmouseout");
	}
</script>