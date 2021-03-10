<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>	
<div class="container" id="tl">
</div>
<script type="text/javascript">
	var a = ${amt };	
	var refresh;
	
	window.onpageshow = function() {		
		refreshTl(a);
		startRefresh();			
	}
	
	function refreshTl(amt) {		
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
		xhr.send("amt="+amt);		
	}
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function setBm(peanut_no) {		
		changeBmBtn1(peanut_no);		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,false);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('set bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
		refreshTl(a);		
	}
	function changeBmBtn1(peanut_no) {		
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "deleteBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: blue");
	}
	function deleteBm(peanut_no) {		
		changeBmBtn2(peanut_no);
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,false);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('remove bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
		refreshTl(a);		
	}
	function changeBmBtn2(peanut_no) {		
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "setBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: gray");		
	}	
	function stopRefresh() {
		clearInterval(refresh);
	}
	function startRefresh() {
		refresh = setInterval(refreshTl, 10000, a);
	}
	function doRenut(peanut_no) {
		location.href="${path}/renut.do?peanut_no="+peanut_no;
	}
	function cancelRenut(peanut_no) {
		location.href="${path}/cancelRenut.do?peanut_no="+peanut_no;
	}
</script>