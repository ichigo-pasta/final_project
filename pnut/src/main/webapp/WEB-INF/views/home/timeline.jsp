<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
</head>
<body>
	<div class="container">	
		<table class="table table-border">
	<c:forEach items="${list }" var="pn">			
		<c:if test="${pn.renut != null}">
			<tr>
				<td colspan="2"><i class="bi bi-arrow-repeat"></i><c:out value="${pn.writer}"/> 님이 리넛하셨습니다.</td>
			<tr>
			<tr>
				<td rowspan="4">
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')"></td>
				<td><c:out value=" ${pn.member.re_nick}, ${pn.re_writer}, ${pn.regdate}"/></td>
			</tr>
		</c:if>
		<c:if test="${pn.renut == null}">
			<tr>
				<td rowspan="4">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')"> </td>
				<td><c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/></td>
			</tr>
		</c:if>
			<tr>
				<td class="contentRow"><pre>${pn.content}</pre></td>
			</tr>
		<c:if test="${pn.picture1 != null}">
			<tr class="gallery">
				<td>
					<a href="${path}/resources/images/${pn.picture1}">
						<img src="${path}/resources/images/${pn.picture1}" width="45%" onclick="baguetteBox.run('.gallery')">
					</a>
			<c:if test="${pn.picture2 != null}">
					<a href="${path}/resources/images/${pn.picture2}">
						<img src="${path}/resources/images/${pn.picture2}" width="45%" onclick="baguetteBox.run('.gallery')">
					</a>			
				<c:if test="${pn.picture3 != null}">
					<a href="${path}/resources/images/${pn.picture3}">
						<img src="${path}/resources/images/${pn.picture3}" width="45%" onclick="baguetteBox.run('.gallery')">
					</a>			
					<c:if test="${pn.picture4 != null}">
					<a href="${path}/resources/images/${pn.picture4}">
						<img src="${path}/resources/images/${pn.picture4}" width="45%" onclick="baguetteBox.run('.gallery')">
					</a>
					</c:if>	
				</c:if>		
			</c:if>
				</td>
			</tr>
		</c:if>
		<c:if test="${pn.picture1 == null}">
			<tr></tr>
		</c:if>
			<tr>
				<td>댓글, 리넛, 좋아요</td>
			</tr>		
	</c:forEach>
		</table>
	</div>	
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>
</body>
</html>
