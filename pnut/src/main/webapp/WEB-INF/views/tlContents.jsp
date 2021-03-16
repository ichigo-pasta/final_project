<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="getMyId.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
<c:if test="${empty list }">
	일상에서 일어나는 작은 일들을 간단하게 기록해보세요
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="pn">
		<div class="peanut_container">
		<c:if test="${pn.renut != null}"> <!-- 리넛 여부 표시 -->
			<div class="row">
				<div class="col col-10" style="padding-bottom: 13px;">
					<i class="bi bi-arrow-repeat"></i><c:out value="${pn.writer}"/> 님이 리넛하셨습니다.
				</div>
			</div>
		</c:if>
			<div class="row">	<!-- 리넛 여부 표시줄 -->
				<div style="width: 120px">
		<c:if test="${pn.renut != null}"> 
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')"
						class="profile_pic" >
		</c:if>
		<c:if test="${pn.renut == null}"> 
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')"
						class="profile_pic">
		</c:if>
				</div>			<!-- 리넛 여부 표시줄  끝 -->
				<div class="col">	
					<div class="row">
						<div class="col-11">	<!-- 리넛 여부에 따른 닉네임, 아이디, 작성일 표시줄 -->
		<c:if test="${pn.renut != null}">
							<c:out value=" ${pn.member.re_nick} @${pn.re_writer}"/>							
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
		</c:if>
		<c:if test="${pn.renut == null}">
							<c:out value="${pn.member.m_nickname} @${pn.writer}"/>							
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
		</c:if>
						</div>			<!-- 리넛 여부에 따른 닉네임, 아이디, 작성일 표시줄  끝 -->
						<div class="col col-1">		<!-- 삭제/팔로우,차단 드롭다운 메뉴 -->
							<div class="btn-group">
								<a class="btn dropdown" type="button"
									id="dropdownMenuButton" data-bs-toggle="dropdown"
									aria-expanded="false"><i class="bi bi-three-dots" style="color: lightgray"></i></a>
						<c:if test="${pn.renut != null }">
								<c:if test="${pn.re_writer == m_id }">
									<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
										<li>
											<a class="dropdown-item" href="${path}/deletePd.do?peanut_no=${pn.peanut_no}">
											<i class="bi bi-trash" style="color: red"></i>&nbsp;삭제</a></li>
									</ul>
								</c:if>
								<c:if test="${pn.re_writer != m_id }">
									<c:if test="${isFollow == true }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-x" id="followbt">&nbsp;&nbsp;팔로우 중</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${pn.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${pn.writer}'"></button>&nbsp;차단</a></li>	
										</ul>
									</c:if>	
									<c:if test="${isFollow == false }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-plus" id="followbt">&nbsp;&nbsp;팔로우</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${pn.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${pn.writer}'"></button>&nbsp;차단</a></li>
										</ul>
									</c:if>
								</c:if>
						</c:if>
						<c:if test="${pn.renut == null }">
								<c:if test="${pn.writer == m_id }">
									<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
										<li>
											<a class="dropdown-item" href="${path}/deletePd.do?peanut_no=${pn.peanut_no}">
											<i class="bi bi-trash" style="color: red"></i>&nbsp;삭제</a></li>
									</ul>
								</c:if>
								<c:if test="${pn.writer != m_id }">
									<c:if test="${isFollow == true }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-x" id="followbt">&nbsp;&nbsp;팔로우 중</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${pn.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${pn.writer}'"></button>&nbsp;차단</a></li>	
										</ul>
									</c:if>	
									<c:if test="${isFollow == false }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-plus" id="followbt">&nbsp;&nbsp;팔로우</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${pn.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${pn.writer}'"></button>&nbsp;차단</a></li>
										</ul>
									</c:if>
								</c:if>
						</c:if>
							</div>
						</div>		<!-- 삭제/팔로우,차단 드롭다운 메뉴 끝 -->
					</div>
					<div class="row">
						<div class="col content_col" id="content${pn.peanut_no }" style="min-height: 5vw; cursor: pointer">
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
					</div> <!-- 갤러리 종료 부분 -->
		</c:if> 
		<c:if test="${pn.picture1 == null}">
					<div class="row">
						<div class="col col-10">&nbsp;</div>
					</div>
		</c:if> <!-- 사진 없을 때 -->
					<div class="row btBox"> <!-- 댓글, 리넛, 북마크 박스 -->
						<div class="col col-4">
							<button onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'"
								class="btnBox">
							<c:if test="${pn.repCnt != 0}">
								<i class="bi-chat" style="color: #D27D32"></i>
								${pn.repCnt }
							</c:if>
							<c:if test="${pn.repCnt == 0}">
								<i class="bi-chat" style="color: gray"></i>								
							</c:if>
							</button>
						</div>
						<div class="col col-4">
							<c:if test="${pn.renuted == false }">
							<button data-bs-toggle="modal" data-bs-target="#set${pn.peanut_no}" onclick="stopRefresh()"
								class="btnBox">
								<i class="bi-arrow-clockwise" style="color: gray"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
							</c:if>
							<c:if test="${pn.renuted == true }">
							<button data-bs-toggle="modal" data-bs-target="#cancel${pn.peanut_no}" onclick="stopRefresh()"
								class="btnBox">
								<i class="bi-arrow-clockwise" style="color: #D27D32"></i>
								<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
							</button>
							</c:if>
						</div>
						<div class="col col-4">
							<c:if test="${pn.bookmarked == true}">
								<button onclick="deleteBm('${pn.peanut_no}'); refreshTl('${amt }');" id="bmBtn${pn.peanut_no}"
									class="btnBox">
									<i class="bi-bookmark" style="color: #D27D32;" id="bmBtnI${pn.peanut_no}"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
							</c:if>							
							<c:if test="${pn.bookmarked == false}">								
								<button onclick="setBm('${pn.peanut_no}'); refreshTl('${amt }');" id="bmBtn${pn.peanut_no}"
									class="btnBox">
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
	<c:if test="${more == 1 }">
		<div class="d-grid gap-2">
			<br>		
  			<button class="btn btn-outline-info btn-lg" type="button" onclick="more_read('${amt+20}')">more...</button>
		</div>
	</c:if>	
</c:if>	<%-- test="${not empty list }" --%>		