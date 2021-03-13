<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
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
			<div class="row peanut_container">
				<div style="width: 110px">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')" class="profile_pic">
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
							<c:out value="${pn.member.m_nickname}, ${pn.writer}"/>
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
						</div>
					</div>
					<div class="row">
						<div class="col">
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
					</div> <!-- 갤러리 종료 부분 -->
		</c:if> 
		<c:if test="${pn.picture1 == null}">
					<div class="row">
						<div class="col col-10">&nbsp;</div>
					</div>
		</c:if> <!-- 사진 없을 때 -->
				<div class="row btBox"> <!-- 댓글, 리넛, 북마크 박스 -->
					<div class="col col-4"> <!-- 댓글 아이콘 -->
						<button onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'">
						<c:if test="${pn.repCnt != 0}">
							<i class="bi-chat" style="color: blue"></i>
							${pn.repCnt }
						</c:if>
						<c:if test="${pn.repCnt == 0}">
							<i class="bi-chat" style="color: gray"></i>								
						</c:if>
						</button>
					</div> <!-- 댓글 아이콘 종료 -->
					<div class="col col-4"> <!-- 리넛 아이콘 -->
						<c:if test="${pn.renuted == false }">
						<button data-bs-toggle="modal" data-bs-target="#set${pn.peanut_no}">
							<i class="bi-arrow-clockwise" style="color: gray"></i>
							<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
						</button>
						</c:if>
						<c:if test="${pn.renuted == true }">
						<button data-bs-toggle="modal" data-bs-target="#cancel${pn.peanut_no}">
							<i class="bi-arrow-clockwise" style="color: blue"></i>
							<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>								
						</button>
						</c:if>
					</div> <!-- 리넛 아이콘 종료 -->
					<div class="col col-4"> <!-- 북마크 아이콘 -->
						<c:if test="${pn.bookmarked == true}">
							<button onclick="deleteBm('${pn.peanut_no}')" id="bmBtn${pn.peanut_no}">
								<i class="bi-bookmark" style="color: blue;" id="bmBtnI${pn.peanut_no}"></i>
								<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
							</button>
						</c:if>
						<c:if test="${pn.bookmarked == false}">								
							<button onclick="setBm('${pn.peanut_no}')" id="bmBtn${pn.peanut_no}">
								<i class="bi-bookmark" style="color: gray" id="bmBtnI${pn.peanut_no}"></i>
								<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
							</button>
						</c:if>
					</div>  <!-- 북마크 아이콘  종료-->
				</div>  <!-- 댓글, 리넛, 북마크 박스  종료-->
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
	        						<a type="button" class="btn btn-primary" onclick="rn_from_search('${pn.peanut_no}')">리넛</a>
      							</div>
							</div>
						</div>
					</div> <!-- Modal 종료 -->
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
	        						<a type="button" class="btn btn-primary" onclick="cancelRenut('${pn.peanut_no}','timeline')">리넛 취소</a>
      							</div>
							</div>
						</div>
					</div> <!-- 취소 Modal 종료 -->
				</div>
			</div>	<!-- peanut_container 종료 -->			
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
	<c:if test="${more == 1 }">
			<div class="d-grid gap-2">
				<br>		
	  			<button class="btn btn-outline-info btn-lg" type="button" onclick="search('${type }', '${keyword }', '${amt+20}')">more...</button>
			</div>
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