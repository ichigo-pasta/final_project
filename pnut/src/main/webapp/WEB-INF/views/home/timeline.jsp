<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>	
<div class="container" id="tl">
</div>
<script type="text/javascript">
	var a = ${amt };
	var timeout;
	window.onpageshow = function() {
		autoRefresh(a);
		setInterval(function() {
			autoRefresh(a);
		}, 10000);
	}
	function autoRefresh(amt) {
		timeout = 0;
		var xhr = new XMLHttpRequest();
		xhr.open("post","${path}/tlContents.do", true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				document.getElementById('tl').innerHTML = xhr.responseText;
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send("amt="+amt+"&timeout="+timeout);		
	}
	function refreshTl(amt) {
		timeout = 1;
		var xhr = new XMLHttpRequest();
		xhr.open("post","${path}/tlContents.do", true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				document.getElementById('tl').innerHTML = xhr.responseText;
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send("amt="+amt+"&timeout="+timeout);		
	}
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function setBm(peanut_no) {		
		setTimeout(changeBmBtn1, 2000, peanut_no);		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
		refreshTl(a);		
	}
	function changeBmBtn1(peanut_no) {
		btnAble();
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "deleteBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: blue");
	}
	function deleteBm(peanut_no) {		
		setTimeout(changeBmBtn2, 2000, peanut_no);
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
		refreshTl(a);		
	}
	function changeBmBtn2(peanut_no) {
		btnAble();
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "setBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: gray");		
	}
	function btnAble() {
		var bmBtn = document.getElementsByClassName('bmBtn');
		for (var b of bmBtn) {
			b.disabled = false;
		}
	}
</script>