<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container" id="tl">
</div>
<script type="text/javascript">
	var a = ${amt };	
	var refresh;
	var startX;
	var startY;
	const judge = 5;	
	
	window.onpageshow = function() {
		refreshTl(a);
		startRefresh();
	}
	
	function refreshTl(amt) {
		a = amt;
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				document.getElementById('tl').innerHTML = xhr.responseText;
				setEvent();
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("post","${path}/tlContents.do", true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send("amt="+a);		
	}
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function setBm(peanut_no) {		
		changeBmBtn1(peanut_no);		
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('set bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,false);
		xhr.send(null);		
	}
	function changeBmBtn1(peanut_no) {		
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "deleteBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: blue");
	}
	function deleteBm(peanut_no) {		
		changeBmBtn2(peanut_no);
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('remove bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,false);
		xhr.send(null);				
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
	function doRenut(peanut_no, redirect) {
		location.href="${path}/renut.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function cancelRenut(peanut_no, redirect) {
		location.href="${path}/cancelRenut.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function setEvent() {		
		var cont_rows = document.getElementsByClassName('content_col');
		for(var cont_row of cont_rows) {
			cont_row.addEventListener('mousedown', function(event) {				
				startX = event.pageX;
				startY = event.pageY;
			});			
			cont_row.addEventListener('mouseup', function(event) {
				var diffX = Math.abs(startX - event.pageX);
				var diffY = Math.abs(startY - event.pageY);
				if(diffX < judge && diffY < judge) {
					var cr_id = event.target.id.substring(7);					
					location.href="${path}/home/peanutDetail.do?peanut_no="+cr_id;
				}				
			});
		}
	}
	function more_read(amt) {
		refreshTl(amt);
		stopRefresh();
		startRefresh();
	}
</script>