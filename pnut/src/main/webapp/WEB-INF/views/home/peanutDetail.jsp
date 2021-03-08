<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="container">	
<c:if test="${empty peanut }">
	<script type="text/javascript">
		alert('삭제되었거나 접근할 수 없는 피넛입니다');
		location.href="${path}/home/timeline.do";
	</script>
</c:if>
<c:if test="${not empty peanut }">
	
		<div class="peanut_container">		
			<div class="row">
				<div class="col col-2">		
					<img alt="" src="${path}/resources/images/${peanut.member.m_profile}"
						width="100" height="100" onclick="profile('${peanut.writer}')">		
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col">
							<c:out value="${peanut.member.m_nickname}, ${peanut.writer}, ${peanut.regdate}"/>
						</div>
					</div>
					<div class="row">
						<div class="col" style="min-height: 5vw">
							${peanut.content}
						</div>
					</div>
		<c:if test="${peanut.picture1 != null}">					
					<div class="row gallery">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${peanut.picture1}">									
								<img src="${path}/resources/images/${peanut.picture1}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>								
			<c:if test="${peanut.picture2 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${peanut.picture2}">
								<img src="${path}/resources/images/${peanut.picture2}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
				<c:if test="${peanut.picture3 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${peanut.picture3}">
								<img src="${path}/resources/images/${peanut.picture3}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
					<c:if test="${peanut.picture4 != null}">
						<div class="col col-6 tl_image">
							<a href="${path}/resources/images/${peanut.picture4}">
								<img src="${path}/resources/images/${peanut.picture4}" 
									width="100%" onclick="baguetteBox.run('.gallery')">
							</a>
						</div>
					</c:if>
				</c:if>
			</c:if>
					</div>											
		</c:if>
		<c:if test="${peanut.picture1 == null}">
					<div class="row">
						<div class="col col-10">&nbsp;</div>
					</div>
		</c:if>
					<div class="row">
						<div class="col col-4">
							<a href="${path}/home/peanutDetail.do?peanut_no=${peanut.peanut_no}"><i class="bi-chat"></i></a>
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
	
</c:if>	<%-- test="${not empty peanut }" --%>			
</div>	<%-- container --%>
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
</script>