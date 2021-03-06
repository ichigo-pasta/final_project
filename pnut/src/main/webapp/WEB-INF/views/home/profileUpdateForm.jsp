<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
<form action="${path}/home/updateProfile.do" 
	method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="${member.m_id }"> 

<div class="pic_container d-flex align-items-end">
	<img alt="" src="${path}/resources/images/${member.m_profile}"
		width="100" height="100">
</div> 
<div class="row">
	<div class="col">
		<div class="row">
			<div class="col-6">
				${member.m_profile}<input type="file" name="file_p">
			</div>
			<div class="col-6">
				${member.m_bg }<input type="file" name="file_b">
			</div>				
		</div>
		<div class="row">
			<div class="col-10">
				<input type="text" name="m_nickname" 
					value="${member.m_nickname }"
					required="required">
			</div>
			<div class="col-2">
				<input type="submit" value="저장">
			</div>				
		</div>
		<div class="row">
			<div class="col">
				<c:out value="${member.m_id }"/>					
			</div>
		</div>
		<div class="row">
			<div class="col col-12">
				<textarea rows="5" name="m_intro"></textarea>
			</div>
		</div>
	</div>
</div>
</form>
<div id="peanut"></div>
</div>

<script type="text/javascript">
	function thumbnail() {
		
	}
</script>
</body>
</html>