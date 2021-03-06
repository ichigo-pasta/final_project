<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	<c:if test="${type != 'user'}" >
		<c:if test="${empty list}">
			데이터가 없습니다.
		</c:if>
		<c:if test="${not empty list}">
		<c:forEach items="${list }" var="pn">
			<div class="row">
				<div class="col col-2">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')">
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
							<c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/>
						</div>
					</div>
					<div class="row">
						<div class="col">
							${pn.content}
						</div>
					</div>
			<c:if test="${pn.picture1 != null}">
					<div class="row">
						<div class="col gallery">
							<a href="${path}/resources/images/${pn.picture1}">
							<img src="${path}/resources/images/${pn.picture1}" 
								width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
				<c:if test="${pn.picture2 != null}">
							<a href="${path}/resources/images/${pn.picture2}">
							<img src="${path}/resources/images/${pn.picture2}" 
								width="45%" onclick="baguetteBox.run('.gallery')">
							</a>			
					<c:if test="${pn.picture3 != null}">
							<a href="${path}/resources/images/${pn.picture3}">
							<img src="${path}/resources/images/${pn.picture3}" 
								width="45%" onclick="baguetteBox.run('.gallery')">
							</a>			
						<c:if test="${pn.picture4 != null}">
							<a href="${path}/resources/images/${pn.picture4}">
							<img src="${path}/resources/images/${pn.picture4}" 
								width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
						</c:if>
					</c:if>
				</c:if>
						</div>
					</div>
			</c:if>	
			<c:if test="${pn.picture1 == null}">
				<div class="row">
					<div class="col col-2"></div>
					<div class="col col-10">&nbsp;</div>
				</div>
			</c:if>
				<div class="row">
					<div class="col col-2"></div>
					<div class="col col-10">
						<div class="row">
							<div class="col col-4">
								<a href="${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}"><i class="bi-chat"></i></a>
							</div>
							<div class="col col-4">
								<a href="#"><i class="bi-arrow-clockwise"></i></a>
							</div>
							<div class="col col-4">
								<a href="#"><i class="bi-hand-thumbs-up"></i></a>
			 				</div>
						</div>
					</div>
				</div>	
				</div>
			</div>
		</c:forEach>
		</c:if>
	</c:if>
	<c:if test="${type == 'user'}" >
		<c:if test="${empty list2 }">
			데이터가 없습니다.
		</c:if>
		<c:if test="${not empty list2 }">
			<c:forEach items="${list2 }" var="mem">
				<div class="row">
					<div class="col col-2">
						<img alt="" src="${path}/resources/images/${mem.m_profile}"
							width="100" height="100" onclick="profile('${mem.m_id}')">
					</div>
					<div class="col col-10">
						<c:out value="${mem.m_nickname}, ${mem.m_id}, ${mem.m_regdate}"/>	
					</div>
				</div>
			</c:forEach>
		</c:if>
	</c:if>
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