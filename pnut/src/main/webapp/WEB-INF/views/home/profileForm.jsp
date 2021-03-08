<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../getMyId.jsp" %>
<div id="container">
	<div class="pic_container d-flex align-items-end">
		<img alt="" src="${path}/resources/images/${member.m_profile}"
			width="100" height="100">
	</div> 
	<div class="row">
		<div class="col col-10">
			<c:out value="${member.m_nickname }"></c:out>
		</div>
		<div class="col col-2">
			<c:if test="${member.m_id == my_id}">
				<a href="${path}/home/profileUpdateForm.do?m_id=${member.m_id }">프로필 수정</a>
			</c:if>
			<c:if test="${member.m_id != my_id}">
				<c:if test="${isFollow == true }">
					<button id="followbt" onclick="unfollow('${member.m_id}')" 
						onmouseover="this.innerText='언팔로우'" 
						onmouseout="this.innerText='팔로우 중'">팔로우 중</button>
				</c:if>
				<c:if test="${isFollow == false }">
					<button id="followbt" onclick="follow('${member.m_id}')">팔로우</button>	
				</c:if>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col"> 
			<c:out value="${member.m_id }"/>
		</div>
	</div>
	<div class="row" style="height: 200px">
		<div class="col"> 
			자기소개 :<c:out value="${member.m_intro }"/>
		</div>
	</div>
	<div class="row">
		<div class="col"> 
			<c:out value="${member.m_regdate }"/>
		</div>
	</div>
	<div class="row">
		<div class="col col-2"> 
			<a href="${path}/home/followingList.do?m_id=${member.m_id}">팔로우 중</a>
		</div>
		<div class="col col-2"> 
			<a href="${path}/home/followerList.do?m_id=${member.m_id}">팔로워</a>
		</div>
	</div>
	<div class="row">
		<div class="col col-6"> 
			피넛
		</div>
		<div class="col col-6"> 
			사진 피넛
		</div>
	</div>
</div>
<div id="peanut"></div>

<script type="text/javascript">
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
		btn.setAttribute("onclick","unfollow('${member.m_id}')");
		btn.setAttribute("onmouseover","this.innerText='언팔로우'");
		btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
	}
	function unfollow(m_id) {
		buttonChange2();
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/unfollow.do?m_id="+m_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('success');
			} else {alert('요청오류: '+xhr.status);}
		}
		xhr.send(null);
	}
	function buttonChange2() {
		var btn = document.getElementById('followbt');
		btn.innerText = '팔로우';
		btn.setAttribute("onclick","follow('${member.m_id}')");
		btn.removeAttribute("onmouseover");
		btn.removeAttribute("onmouseout");
	}	
	//	$(function () {
	//		$('#peanut').load('${path}/nolay/peanutList.do?amt=20');
	//	});	
</script>