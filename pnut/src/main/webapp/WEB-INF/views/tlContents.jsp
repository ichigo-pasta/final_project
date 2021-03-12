<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
				<div style="width: 120px">
		<c:if test="${pn.renut != null}">
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')"
						class="profile_pic">
		</c:if>
		<c:if test="${pn.renut == null}">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')"
						class="profile_pic">
		</c:if>
				</div>
				<div class="col">
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
						<div class="col content_col" id="content${pn.peanut_no }" style="min-height: 5vw; cursor: pointer">
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
					<div class="row"> <!-- 댓글, 리넛, 북마크 박스 -->
						<div class="col col-4">
							<button onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'">
							<c:if test="${pn.repCnt != 0}">
								<i class="bi-chat" style="color: blue"></i>
								${pn.repCnt }
							</c:if>
							<c:if test="${pn.repCnt == 0}">
								<i class="bi-chat" style="color: gray"></i>								
							</c:if>
							</button>
						</div>
						<div class="col col-4">
							<c:if test="${pn.renuted == false }">
							<button data-bs-toggle="modal" data-bs-target="#set${pn.peanut_no}" onclick="stopRefresh()">
								<i class="bi-arrow-clockwise" style="color: gray"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
							</c:if>
							<c:if test="${pn.renuted == true }">
							<button data-bs-toggle="modal" data-bs-target="#cancel${pn.peanut_no}" onclick="stopRefresh()">
								<i class="bi-arrow-clockwise" style="color: blue"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
							</c:if>
						</div>
						<div class="col col-4">
							<c:if test="${pn.bookmarked == true}">
								<button onclick="deleteBm('${pn.peanut_no}'); refreshTl('${amt }');" id="bmBtn${pn.peanut_no}">
									<i class="bi-bookmark" style="color: blue;" id="bmBtnI${pn.peanut_no}"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
							</c:if>							
							<c:if test="${pn.bookmarked == false}">								
								<button onclick="setBm('${pn.peanut_no}'); refreshTl('${amt }');" id="bmBtn${pn.peanut_no}">
									<i class="bi-bookmark" style="color: gray" id="bmBtnI${pn.peanut_no}"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
							</c:if>
						</div>
					</div>
					<!-- 리넛 설정 Modal -->
					<div class="modal fade" id="set${pn.peanut_no}" aria-labelledby="set${pn.peanut_no}Label" data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="set${pn.peanut_no}Label">리넛하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="startRefresh()"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${pn.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="startRefresh()">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="doRenut('${pn.peanut_no}','timeline')">리넛</a>
      							</div>
							</div>
						</div>
					</div>
					<!-- 리넛 취소 Modal -->
					<div class="modal fade" id="cancel${pn.peanut_no}" aria-labelledby="cancel${pn.peanut_no}Label" data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="cancel${pn.peanut_no}Label">리넛 취소하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="startRefresh()"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${pn.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="startRefresh()">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="cancelRenut('${pn.peanut_no}','timeline')">리넛 취소</a>
      							</div>
							</div>
						</div>
					</div>
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
	</c:forEach>
</c:if>	<%-- test="${not empty list }" --%>		