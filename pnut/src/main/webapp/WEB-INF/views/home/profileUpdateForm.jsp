<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div id="container">
<form action="${path}/home/updateProfile.do" 
	method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="${member.m_id }"> 

<div class="pic_container d-flex align-items-end">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100" id="profileArea">
</div> 
<div class="row">
	<div class="col">
		<div class="row" id="profileUpdateBorder">
			<div class="col">
				프로필&nbsp;<input type="file" name="file_p">
			</div>
			<div class="col">
				배경사진&nbsp;<input type="file" name="file_b">
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
			<textarea rows="5" name="m_intro" style="resize: none;"></textarea>
		</div>
	</div>
</div>
</form>
<div id="peanut"></div>
</div>
<script type="text/javascript">
</script>