<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="container">	
<c:if test="${empty list }">
	일상에서 일어나는 작은 일들을 간단하게 기록해보세요
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="pn">
		<div class="peanut_container">
		<c:if test="${pn.renut != null}">
			<div class="row">
				<div class="col">
					<i class="bi bi-arrow-repeat"></i><c:out value="${pn.writer}"/> 님이 리넛하셨습니다.
				</div>
			</div>
		</c:if>
			<div class="row">
				<div class="col col-2">
		<c:if test="${pn.renut != null}">
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')">
		</c:if>
		<c:if test="${pn.renut == null}">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')">
		</c:if>
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
		<c:if test="${pn.renut != null}">
							<c:out value=" ${pn.member.re_nick}, ${pn.re_writer}, ${pn.regdate}"/>
		</c:if>
		<c:if test="${pn.renut == null}">
							<c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/>
		</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col" style="min-height: 5vw">
							${pn.content}
						</div>
					</div>
		<c:if test="${pn.picture1 != null}">					
					<div class="row gallery">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${pn.picture1}">									
								<img src="${path}/resources/images/${pn.picture1}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>								
			<c:if test="${pn.picture2 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${pn.picture2}">
								<img src="${path}/resources/images/${pn.picture2}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
				<c:if test="${pn.picture3 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${pn.picture2}">
								<img src="${path}/resources/images/${pn.picture2}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
					<c:if test="${pn.picture4 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${pn.picture4}">
								<img src="${path}/resources/images/${pn.picture4}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
					</c:if>
				</c:if>
			</c:if>
					</div>
											
		</c:if>
		<c:if test="${pn.picture1 == null}">
					<div class="row">
						<div class="col col-10">&nbsp;</div>
					</div>
		</c:if>
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
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
	</c:forEach>
</c:if>	<%-- test="${not empty list }" --%>			
</div>	<%-- container --%>
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>