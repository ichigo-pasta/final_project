<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../getMyId.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
<c:if test="${empty bmList }">
	<div style="text-align: center;"><br>간직하고 싶은 피넛들을 북마크해보세요</div>
</c:if>
<c:if test="${not empty bmList }">
	<c:forEach items="${bmList }" var="pn">
		<div class="peanut_container">
			<div class="row">
				<div style="width: 120px; margin: 8px;">
					<img class="profile_pic" alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')">
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
							<c:out value="${pn.member.m_nickname} @${pn.writer}"/>
							<small>
							<c:choose>
								<c:when test="${(now - pn.regdate.time) > (1000*60*60*24*7*4)}">
									<fmt:formatDate value="${pn.regdate }" pattern="yyyy년 MM월 dd일"/>
								</c:when>
								<c:when test="${(now - pn.regdate.time) <= (1000*60*60*24*7*4) and (now - pn.regdate.time) > (1000*60*60*24*7)}">
									<fmt:parseNumber value="${(now - pn.regdate.time) / (1000*60*60*24*7) }" integerOnly="true"/>주 전
								</c:when>
								<c:when test="${(now - pn.regdate.time) <= (1000*60*60*24*7) and (now - pn.regdate.time) > (1000*60*60*24)}">
									<fmt:parseNumber value="${(now - pn.regdate.time) / (1000*60*60*24) }" integerOnly="true"/>일 전
								</c:when>
								<c:when test="${(now - pn.regdate.time) <= (1000*60*60*24) and (now - pn.regdate.time) > (1000*60*60)}">
									<fmt:parseNumber value="${(now - pn.regdate.time) / (1000*60*60) }" integerOnly="true"/>시간 전
								</c:when>
								<c:when test="${(now - pn.regdate.time) <= (1000*60*60) and (now - pn.regdate.time) > (1000*60)}">
									<fmt:parseNumber value="${(now - pn.regdate.time) / (1000*60) }" integerOnly="true"/>분 전
								</c:when>
								<c:otherwise>
									1분 이내
								</c:otherwise>
							</c:choose>
							</small>
						</div>
					</div>
					<div class="row">
						<div class="col content_col" id="content${pn.peanut_no }">
							<pre id="contpre${pn.peanut_no }">${pn.content}</pre>
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
					<div class="row btBox">
						<div class="col col-4">
							<button onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'" class="btnBox">
							<c:if test="${pn.repCnt != 0}">
								<i class="bi-chat" style="color: #D27D32"></i>
								${pn.repCnt }
							</c:if>
							<c:if test="${pn.repCnt == 0}">
								<i class="bi-chat" style="color: gray"></i>								
							</c:if>&nbsp;
							</button>
						</div>
						<div class="col col-4">
							<c:if test="${pn.renuted == false }">
							<button data-bs-toggle="modal" data-bs-target="#set${pn.peanut_no}" class="btnBox">
								<i class="bi-arrow-clockwise" style="color: gray"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>&nbsp;								
							</button>
							</c:if>
							<c:if test="${pn.renuted == true }">
							<button data-bs-toggle="modal" data-bs-target="#cancel${pn.peanut_no}" class="btnBox">
								<i class="bi-arrow-clockwise" style="color: #D27D32"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
							</c:if>
						</div>
						<div class="col col-4">
							<button onclick="confirmDelBm('${pn.peanut_no}')" id="bmBtn${pn.peanut_no}" class="btnBox">
									<i class="bi-bookmark" style="color: #D27D32;" id="bmBtnI${pn.peanut_no}"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
							</button>
						</div>
					</div>
				<!-- 리넛 설정 Modal -->
					<div class="modal fade" id="set${pn.peanut_no}" aria-labelledby="set${pn.peanut_no}Label" data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="set${pn.peanut_no}Label">리넛하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${pn.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="doRenut2('${pn.peanut_no}','bookmark')">리넛</a>
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
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${pn.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="cancelRenut2('${pn.peanut_no}','bookmark')">리넛 취소</a>
      							</div>
							</div>
						</div>
					</div>
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
	</c:forEach>
	<c:if test="${more == 1 }">
		<div class="d-grid gap-2">
			<br>		
  			<button class="btn btn-outline-info btn-lg" type="button" onclick="more_read_bm('${amt+20}')">more...</button>
		</div>
	</c:if>
</c:if>	<%-- test="${not empty list }" --%>
<script type="text/javascript">
	var startX;
	var startY;
	const judge = 5;
	var cont_rows = document.getElementsByClassName('content_col');
	for(var cont_row of cont_rows) {
		cont_row.addEventListener('mousedown', function(event) {				
			startX = event.pageX;
			startY = event.pageY;
		});			
		cont_row.addEventListener('mouseup', function(event) {
			var diffX = Math.abs(startX - event.pageX);
			var diffY = Math.abs(startY - event.pageY);
			if(diffX < judge && diffY < judge && event.button == 0) {
				var cr_id = event.target.id.substring(7);
				location.href="${path}/home/peanutDetail.do?peanut_no="+cr_id;
			}				
		});
	}
	function doRenut2(peanut_no, redirect) {
		location.href="${path}/renut2.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function cancelRenut2(peanut_no, redirect) {
		location.href="${path}/cancelRenut2.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function confirmDelBm(peanut_no) {
		var conf = confirm('북마크를 제거하시겠습니까?');
		if(conf) deleteBm2(peanut_no);
		else return false;
	}
	function deleteBm2(peanut_no) {
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				location.reload();
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);				
	}
	function more_read_bm(num) {		
		location.href = "${path}/home/bookmarkForm.do?m_id=${member.m_id}&amt="+num;
	}
</script>