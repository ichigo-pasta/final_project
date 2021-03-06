<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="container">	
<c:if test="${empty list }">
	일상에서 일어나는 작은 일들을 간단하게 기록해보세요
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="pn">
		<c:if test="${pn.renut != null}">
			<div class="row">
				<div class="col">
					<i class="bi bi-arrow-repeat"></i><c:out value="${pn.writer}"/> 님이 리넛하셨습니다.
				</div>
			</div>
			<div class="row">
				<div class="col col-2">
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')">
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
							<c:out value=" ${pn.member.re_nick}, ${pn.re_writer}, ${pn.regdate}"/><br>
						</div>
					</div>
					<div class="row">
						<div class="col">
							${pn.content}
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${pn.renut == null}">
			<div class="row">
				<div class="col col-2">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')">
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
							<c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/><br>
						</div>
					</div>
					<div class="row">
						<div class="col">
							${pn.content}
						</div>
					</div>
				</div>
			</div>
		</c:if>
			<%-- <div class="row">
				<div class="col col-2"></div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
							${pn.content}
						</div>
					</div>
				</div>
			</div> --%>
		<c:if test="${pn.picture1 != null}">
			<div class="row">
				<div class="col col-2"></div>
				<div class="col col-10 gallery">
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
					<a href="${path}/resources/images/${pn.picture2}">
						<img src="${path}/resources/images/${pn.picture2}" 
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
	</c:forEach>
</c:if>			
</div>			
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>
