<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<form action="${path}/home/updateProfile.do" 
	method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="${member.m_id }"> 

<div class="pic_container d-flex align-items-end" style="margin-top: 10px" id="bg_preview">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100" id="profileArea" class="profile_pic">
</div> 
<div class="row">
	<div class="col">
		<div class="row" id="profileUpdateBorder" style="margin: 10px 0;">
			<div class="col">
				프로필&nbsp;<input type="file" name="file_p" onchange="set_pf(event)">
			</div>
			<div class="col">
				배경사진&nbsp;<input type="file" name="file_b" onchange="set_bg(event)">
			</div>
			<div class="col-1">
				<input type="submit" value="저장">
			</div>					
		</div>
		<div class="row" id="profileUpdateBorder">
			<div class="col">
				닉네임<br>
				<input type="text" name="m_nickname" 
					value="${member.m_nickname }"
					required="required">
			</div>
		</div>
		<div class="row" id="profileUpdateBorder">
			<div class="col">
				아이디<br>
				<c:out value="${member.m_id }"/>					
			</div>
		</div>
		<div class="row" id="profileUpdateBorder" style="padding: 0 12px 5px 12px">
			자기소개<br>
			<textarea rows="5" name="m_intro" style="resize: none;" maxlength="200">${member.m_intro }</textarea>
		</div>
	</div>
</div>
</form>
<div id="peanut"></div>
</div>
<script type="text/javascript">
	function set_pf(event) {
		var image = event.target.files;
		if (image.length == 0) {
			document.getElementById("profileArea").src = "${path}/resources/images/${member.m_profile}";
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(event) {			
			var img = document.getElementById("profileArea");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "100px");
			img.setAttribute("height", "100px");
		}
		reader.readAsDataURL(image[0]);
	}
	
	function set_bg(event) {
		var image = event.target.files;
		if (image.length == 0) {
			document.getElementById("bg_preview").style.backgroundImage = "url('${path}/resources/images/${member.m_bg}')";
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(event) {			
			var img = document.getElementById("bg_preview");
			img.style.backgroundImage = "url("+event.target.result+")";			
		}
		reader.readAsDataURL(image[0]);
	}
</script>