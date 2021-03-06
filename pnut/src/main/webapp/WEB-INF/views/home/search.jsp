<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link" id="peanut" href="javascript:search('peanut');">피넛</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="hashtag" href="javascript:search('hashtag');">해시태그</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="user" href="javascript:search('user');">사용자</a>
  </li>
</ul>
<div class="container">
<table class="table table-border">
	<c:if test="${type != 'user'}" >
	<c:if test="${empty list }">
		<tr>
			<td colspan="2">데이터가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
	<c:forEach items="${list }" var="pn">			
			<tr>
				<td rowspan="4">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')"> </td>
				<td><c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/></td>
			</tr>
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
	</c:if>
	</c:if>
	<c:if test="${type == 'user'}" >
	<c:if test="${empty list2 }">
		<tr>	
			<td>데이터가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list2 }">
		<c:forEach items="${list2 }" var="mem">
		<tr>
			<td>
				<img alt="" src="${path}/resources/images/${mem.m_profile}"
					width="100" height="100" onclick="profile('${mem.m_id}')"> </td>
			<td><c:out value="${mem.m_nickname}, ${mem.m_id}, ${mem.m_regdate}"/></td>
		</tr>
		</c:forEach>
	</c:if>
	</c:if>
</table>
</div>
<input type="hidden" value="${keyword}" id="keyword">
<input type="hidden" value="${type}" id="type"> 
<script type="text/javascript">
	window.onpageshow = function() {
		document.getElementById("kw").value = document.getElementById("keyword").value;
		if (document.getElementById("type").value == "peanut") {
			document.getElementById("peanut").setAttribute("class","nav-link active");
		} else if (document.getElementById("type").value == "hashtag") {
			document.getElementById("hashtag").setAttribute("class","nav-link active");
		} else {
			document.getElementById("user").setAttribute("class","nav-link active");
		}
	}
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>
</script>
</body>
</html>