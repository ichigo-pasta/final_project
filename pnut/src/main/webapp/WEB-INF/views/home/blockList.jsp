<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<c:if test="${empty list}">
	<div style="text-align: center;"><br>차단하는 유저가 없습니다.</div>
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list }" var="mem">
		<div class="row" style="margin: 25px 15px 12px 3px">
			<div style="width: 80px">
				<img alt="" src="${path}/resources/images/${mem.m_profile}" 
					width="80px" height="80px"
					onclick="profile('${mem.m_id}')" class="profile_pic">
			</div>
			<div class="col" style="margin: 0 25px; padding: 0px; border-bottom: 1px solid gray;">
				<b>${mem.m_nickname}</b><br>
				@${mem.m_id }<br>
				${mem.m_intro } 
			</div>
			<div class="col col-1 align-self-center" style="width: 120px">
				<button id="${mem.m_id}" onclick="unblock1('${mem.m_id}')" 
					onmouseover="this.innerText='차단 해제'" 
					onmouseout="this.innerText='차단됨'"
					class="btn btn-outline-danger">차단됨</button>
			</div>
		</div>
	</c:forEach>
</c:if>
</div>

<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function unblock1(m_id) {
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/unblock.do?m_id="+m_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				if (xhr.responseText == 1) {
					alert("유저 "+m_id+"의 차단을 해제했습니다");
					location.reload();
				} else if (xhr.responseText == 0) {
					alert('차단 해제 과정에서 오류가 발생했습니다');
				} else if (xhr.responseText == -1) {
					alert('차단 해제할 아이디 정보가 누락되었습니다');				
				}
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
	}
</script>