<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$(function () {
		$('#peanut').load('${path}/nolay/peanutList.do?amt=20');
	});
</script> -->
<style type="text/css">
.pic_container {
	height: 200px;
	background-image: url('${path}/resources/images/${member.m_bg}');
	background-size: 100% 100%;
}
</style>
</head>
<body>
<div id="container">
<div class="pic_container d-flex align-items-end">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100">
</div> 
<table class="table table-border">
	<tr>
		<td>${member.m_nickname }</td>
		<td colspan="2"></td>
	<c:if test="${member.m_id == my_id}">
		<td><a href="${path}/home/profileUpdateForm.do?m_id=${member.m_id }">프로필 수정</a></td>
	</c:if>
	<c:if test="${member.m_id != my_id}">
		<td><button id="followbt" onclick="follow('${member.m_id}')">팔로우</button></td>
	</c:if>
	</tr>
	<tr>
		<td>${member.m_id }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="4">${member.m_intro }</td>
	<tr>
		<td>${member.m_regdate }</td>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td><a href="${path}/home/followingList.do?m_id=${member.m_id}">팔로우 중</a></td>
		<td><a href="${path}/home/followerList.do?m_id=${member.m_id}">팔로워</a></td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="2">피넛</td>
		<td colspan="2">사진 피넛</td>
	</tr>
</table>
<div id="peanut"></div>
</div>
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
		btn.innerText = '언팔로우';
		btn.setAttribute("onclick","unfollow('${member.m_id}')");
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
	}
</script>
</body>
</html>