<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../getMyId.jsp" %>
<c:if test="${empty bmList }">
	간직하고 싶은 피넛들을 북마크해보세요
</c:if>
<c:if test="${not empty bmList }">
	<c:forEach items="${bmList }" var="pn">
		<div class="peanut_container">
			<div class="row">
				<div style="width: 120px">
					<img class="profile_pic" alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')">
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
							<c:out value="${pn.member.m_nickname}, ${pn.writer}, ${pn.regdate}"/>
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
							<a href="${path}/resources/images/${pn.picture3}">
								<img src="${path}/resources/images/${pn.picture3}" 
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
							<button onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'">
								<i class="bi-chat" style="color: gray"></i>
								<c:if test="${pn.repCnt != 0}">${pn.repCnt }</c:if>
							</button>
						</div>
						<div class="col col-4">
							<button>
								<i class="bi-arrow-clockwise" style="color: gray"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
						</div>
						<div class="col col-4">
								<button onclick="deleteBm('${pn.peanut_no}')" id="bmBtn${pn.peanut_no}" class="bmBtn">
									<i class="bi-bookmark" style="color: blue;" id="bmBtnI${pn.peanut_no}"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
						</div>
					</div>
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
	</c:forEach>
</c:if>	<%-- test="${not empty list }" --%>			