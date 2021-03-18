<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../getMyId.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
<div>	
<c:if test="${empty peanut }">
	<script type="text/javascript">
		alert('삭제되었거나 접근할 수 없는 피넛입니다');
		location.href="${path}/home/timeline.do";
	</script>
</c:if>
<c:if test="${not empty peanut }">	
		<div class="peanut_container">
			<div class="row">
				<div style="width: 110px">		
					<img alt="" src="${path}/resources/images/${peanut.member.m_profile}"
						width="100" height="100" onclick="profile('${peanut.writer}')"
						class="profile_pic">		
				</div>
				<div class="col">
					<div class="row">
						<div class="col col-11">							
							<c:out value="${peanut.member.m_nickname} @${peanut.writer}"/>
							<c:choose>
								<c:when test="${(now - peanut.regdate.time) > (1000*60*60*24*7*4)}">
									<fmt:formatDate value="${peanut.regdate }" pattern="yyyy년 MM월 dd일"/>
								</c:when>
								<c:when test="${(now - peanut.regdate.time) <= (1000*60*60*24*7*4) and (now - peanut.regdate.time) > (1000*60*60*24*7)}">
									<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60*24*7) }" integerOnly="true"/>주 전
								</c:when>
								<c:when test="${(now - peanut.regdate.time) <= (1000*60*60*24*7) and (now - peanut.regdate.time) > (1000*60*60*24)}">
									<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60*24) }" integerOnly="true"/>일 전
								</c:when>
								<c:when test="${(now - peanut.regdate.time) <= (1000*60*60*24) and (now - peanut.regdate.time) > (1000*60*60)}">
									<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60) }" integerOnly="true"/>시간 전
								</c:when>
								<c:when test="${(now - peanut.regdate.time) <= (1000*60*60) and (now - peanut.regdate.time) > (1000*60)}">
									<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60) }" integerOnly="true"/>분 전
								</c:when>
								<c:otherwise>
									1분 이내
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col col-1">
							<div class="btn-group">
								<a class="btn dropdown" type="button"
									id="dropdownMenuButton" data-bs-toggle="dropdown"
									aria-expanded="false"><i class="bi bi-three-dots" style="color: lightgray"></i></a>
								<c:if test="${peanut.writer == my_id }">
									<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton" 
										style="background: #464646;">
										<li>
											<a class="dropdown-item" href="${path}/deletePd.do?peanut_no=${peanut.peanut_no}" style="color: lightgray">
											<i class="bi bi-trash" style="color: red"></i>&nbsp;&nbsp;삭제</a></li>
									</ul>
								</c:if>
								<c:if test="${peanut.writer != my_id }">
									<c:if test="${isFollow == true }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-x" id="followbt">&nbsp;&nbsp;팔로우 중</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${peanut.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${peanut.writer}'"></button>&nbsp;차단</a></li>	
										</ul>
									</c:if>	
									<c:if test="${isFollow == false }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<button class="bi bi-person-plus" id="followbt"
													>&nbsp;&nbsp;팔로우</button></a></li>
											<li><a class="dropdown-item" href="${path}/block.do?m_id=${peanut.writer}">
												<button class="bi bi-x-circle" id="blockbt"
													onclick="location.href='${path}/block.do?m_id=${peanut.writer}'"></button>&nbsp;차단</a></li>
										</ul>
									</c:if>
								</c:if>				
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col" style="min-height: 5vw">
							<pre>${peanut.content}</pre>
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
					<div class="row btBox"> <!-- 댓글, 리넛, 북마크 박스 -->
						<div class="col col-4">
							<button class="btnBox">
							<c:if test="${peanut.repCnt != 0}">
								<i class="bi-chat" style="color: #D27D32"></i>
								${peanut.repCnt }
							</c:if>
							<c:if test="${peanut.repCnt == 0}">
								<i class="bi-chat" style="color: gray"></i>								
							</c:if>
							</button>
						</div>
						<div class="col col-4">
							<c:if test="${peanut.renuted == false }">
							<button data-bs-toggle="modal" data-bs-target="#set${peanut.peanut_no}" class="btnBox">
								<i class="bi-arrow-clockwise" style="color: gray"></i>
								<c:if test="${peanut.renutCnt != 0}">${peanut.renutCnt }</c:if>								
							</button>
							</c:if>
							<c:if test="${peanut.renuted == true }">
							<button data-bs-toggle="modal" data-bs-target="#cancel${peanut.peanut_no}" class="btnBox">
								<i class="bi-arrow-clockwise" style="color: #D27D32"></i>
								<c:if test="${peanut.renutCnt != 0}">${peanut.renutCnt }</c:if>								
							</button>
							</c:if>
						</div>
						<div class="col col-4">
							<c:if test="${peanut.bookmarked == true}">
								<button onclick="deleteBm2('${peanut.peanut_no}')" class="btnBox">
									<i class="bi-bookmark" style="color: #D27D32"></i>
									<c:if test="${peanut.bmCnt != 0}">${peanut.bmCnt }</c:if>
								</button>
							</c:if>							
							<c:if test="${peanut.bookmarked == false}">								
								<button onclick="setBm2('${peanut.peanut_no}')" class="btnBox">
									<i class="bi-bookmark" style="color: gray"></i>
									<c:if test="${peanut.bmCnt != 0}">${peanut.bmCnt }</c:if>
								</button>
							</c:if>
						</div>
					</div>
					<!-- 리넛 설정 Modal -->
					<div class="modal fade" id="set${peanut.peanut_no}" aria-labelledby="set${peanut.peanut_no}Label" data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="set${peanut.peanut_no}Label">리넛하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${peanut.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="doRenut2('${peanut.peanut_no}','detail')">리넛</a>
      							</div>
							</div>
						</div>
					</div>
					<!-- 리넛 취소 Modal -->
					<div class="modal fade" id="cancel${peanut.peanut_no}" aria-labelledby="cancel${peanut.peanut_no}Label" data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="cancel${peanut.peanut_no}Label">리넛 취소하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">
											${peanut.content}
										</div>
									</div>
								</div>
								<div class="modal-footer">									
	        						<a type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</a>
	        						<a type="button" class="btn btn-primary" onclick="cancelRenut2('${peanut.peanut_no}','detail')">리넛 취소</a>
      							</div>
							</div>
						</div>
					</div>
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
		<div class="reply_container"> <!-- 댓글 -->
			<c:forEach items="${list}" var="rep">
		<c:if test="${rep.ref_level == 0}"> <!-- 댓글일 때(들여쓰기가 0일때) -->
			<div class="row rep_row">	<!-- 댓글 Form -->
				<div class="col col-2 align-self-center" style="width: 100px;">
					<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
						width="80" height="80" onclick="profile('${rep.writer}')"
						align="right" class="profile_pic">
				</div>
				<div class="col" style="background: #3c3c3c; color: lightgray; border-radius: 10px; margin: 0 10px 0 0 ;" >
				<c:if test="${rep.del == 'n'}">
					<c:if test="${rep.blockRep == false }">
					${rep.member.m_nickname}, @${rep.writer}<br>
					<pre>${rep.content}</pre>
					<c:choose>
						<c:when test="${(now - rep.regdate.time) > (1000*60*60*24*7*4)}">
							<fmt:formatDate value="${rep.regdate }" pattern="yyyy년 MM월 dd일"/>
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24*7*4) and (now - rep.regdate.time) > (1000*60*60*24*7)}">
							<fmt:parseNumber value="${(now - rep.regdate.time) / (1000*60*60*24*7) }" integerOnly="true"/>주 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24*7) and (now - rep.regdate.time) > (1000*60*60*24)}">
							<fmt:parseNumber value="${(now - rep.regdate.time) / (1000*60*60*24) }" integerOnly="true"/>일 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24) and (now - rep.regdate.time) > (1000*60*60)}">
							<fmt:parseNumber value="${(now - rep.regdate.time) / (1000*60*60) }" integerOnly="true"/>시간 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60) and (now - rep.regdate.time) > (1000*60)}">
							<fmt:parseNumber value="${(now - rep.regdate.time) / (1000*60) }" integerOnly="true"/>분 전
						</c:when>
						<c:otherwise>
							1분 이내
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;
					<button id="commentbt" onclick="comIns('${rep.reply_no}')" 
						style="border: none; color: lightgray; background: none" >답글 쓰기</button>
						<c:if test="${rep.writer == my_id }">
					<button id="deletebt" onclick="comDel('${rep.reply_no}')"
						style="border: none; color: lightgray; background: none">삭제</button>
						</c:if>
					</c:if>
					<c:if test="${rep.blockRep == true }">
					<br>
					<p align="center"><b class="text-secondary">[조회할 수 없는 댓글입니다]</b></p>
					</c:if>
				</c:if>
			<c:if test="${rep.del == 'y'}">
				${rep.member.m_nickname}, @${rep.writer}<br>
				<p align="center"><b class="text-secondary">[삭제된 댓글입니다]</b>
			</c:if>
				</div>	<!-- 댓글 Form 끝 -->
				<!-- 댓글에 대한 답글(대댓글) 작성 Form -->
				<div class="row recome" id="comIns${rep.reply_no}" style="display: none">
					<div style="width: 100px"></div>
					<div class="col">
						<div class="row">
							<div class="col"><b><c:out value="${m_nickname}"/></b></div>
						</div>
					<form action="${path}/home/comment.do" method="post">	
						<div class="row">
							<div class="col col-10">
								<div class="row">
									to : ${rep.member.m_nickname}
									<textarea id="cont${rep.reply_no}"
										rows="5" style="resize: none; background: #3c3c3c; color: lightgray" 
										name="content" required="required" 
										placeholder="답글을 입력해주세요" maxlength="200"></textarea>
								</div>
							</div>
							<div class="col col-2 align-self-end">
								<div class="row">
									<button class="btn" style="height: 111px; background: #D27D32">등록</button>
								</div>
							</div>
						</div>
						<input type="hidden" value="${rep.writer}" name="rep_target">
						<input type="hidden" value="${peanut.peanut_no}" name="peanut_no">
						<input type="hidden" value="${rep.ref}" name="ref">
						<input type="hidden" value="${my_id }" name="writer">
					</form>
					</div>
				</div> <!-- 댓글에 대한 답글(대댓글) 작성 Form 끝 -->
			</div>
		</c:if>		<!-- 댓글일 때(들여쓰기가 0일때)끝 -->
		<c:if test="${rep.ref_level == 1}">	<!-- 대댓글 일 때(들여쓰기가 1일때) -->
			<div class="row rep_row">	<!-- 대댓글 Form -->					
				<div class="align-self-center" style="width: 150px">					
					<div class="col">
						<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
							width="80" height="80" onclick="profile('${rep.writer}')"
							align="right" class="profile_pic">
					</div>					
				</div>
				<div class="col" 
					style="background: #3c3c3c; color: lightgray; border-radius: 10px; margin-right: 10px;" >	<!-- 대댓글 Form -->
			<c:if test="${rep.del == 'n'}">
				<c:if test="${rep.blockRep == false }">
					${rep.member.m_nickname}, @${rep.writer}<br>
					<pre><b>${rep.member.target_nn}</b>&nbsp;${rep.content}</pre>
					<c:choose>
						<c:when test="${(now - rep.regdate.time) > (1000*60*60*24*7*4)}">
							<fmt:formatDate value="${rep.regdate }" pattern="yyyy년 MM월 dd일"/>
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24*7*4) and (now - rep.regdate.time) > (1000*60*60*24*7)}">
							<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60*24*7) }" integerOnly="true"/>주 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24*7) and (now - rep.regdate.time) > (1000*60*60*24)}">
							<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60*24) }" integerOnly="true"/>일 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60*24) and (now - rep.regdate.time) > (1000*60*60)}">
							<fmt:parseNumber value="${(now - peanut.regdate.time) / (1000*60*60) }" integerOnly="true"/>시간 전
						</c:when>
						<c:when test="${(now - rep.regdate.time) <= (1000*60*60) and (now - rep.regdate.time) > (1000*60)}">
							<fmt:parseNumber value="${(now - rep.regdate.time) / (1000*60) }" integerOnly="true"/>분 전
						</c:when>
						<c:otherwise>
							1분 이내
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;
					<button id="commentbt" onclick="comIns('${rep.reply_no}')"
						style="border: none; color: lightgray; background: none">답글 쓰기</button>
					<c:if test="${rep.writer == my_id }">
					<button id="deletebt" onclick="comDel('${rep.reply_no}')"
						style="border: none; color: lightgray; background: none">삭제</button>
					</c:if>
				</c:if>	<!-- rep.blockRep == false end -->
				<c:if test="${rep.blockRep == true }">
					<br>
					<p align="center"><b class="text-secondary">[조회할 수 없는 댓글입니다]</b></p>
				</c:if>				
			</c:if>
			<c:if test="${rep.del == 'y'}">
				${rep.member.m_nickname}, @${rep.writer}<br>
				<p align="center"><b class="text-secondary">[삭제된 댓글입니다]</b>
			</c:if>
				</div>	<!-- 대댓글 Form 끝 -->			
						
				<div class="row recome" id="comIns${rep.reply_no}" style="display: none">	<!-- 대댓글 쓰기 -->
					<div style="width: 150px"></div>
					<div class="col">
						<div class="row">
							<div class="col"><b><c:out value="${m_nickname}"/></b></div>
						</div>
					<form action="${path}/home/comment.do" method="post">	
						<div class="row">
							<div class="col col-10">
								<div class="row">
									to : ${rep.member.m_nickname}
									<textarea id="cont${rep.reply_no}"
										rows="5" style="resize: none; background: #3c3c3c; color: lightgray"
										name="content" required="required" 
										placeholder="답글을 입력해주세요" maxlength="200"></textarea>
								</div>
							</div>
							<div class="col col-2 align-self-end">
								<div class="row">
									<button class="btn" style="height: 111px; background: #D27D32">등록</button>
								</div>
							</div>
						</div>
						<input type="hidden" value="${rep.writer}" name="rep_target">
						<input type="hidden" value="${peanut.peanut_no}" name="peanut_no">
						<input type="hidden" value="${rep.ref}" name="ref">
						<input type="hidden" value="${my_id }" name="writer">
					</form>
					</div>
				</div>
			</div>	<!-- 대댓글 Form 끝-->
		</c:if>	<!-- 대댓글 일 때(들여쓰기가 1일때) 끝 -->	
			</c:forEach>
			<c:if test="${more == 1 }">
			<div class="d-grid gap-2">
				<br>		
	  			<button class="btn btn-outline-info btn-lg" type="button" onclick="more_read('${peanut.peanut_no}','${amt+20}')">more...</button>
			</div>
			</c:if>
			<form action="${path}/home/reply.do" method="post">
				<div class="row" style="margin: 0 5px;">
					<div class="col"><b><c:out value="${m_nickname}"/></b></div>
				</div>
				<div class="row" style="margin: 0 5px;">
					<div class="col col-10">
						<div class="row">
							<textarea rows="5" style="resize: none; border-radius: 5px;
								background: #3c3c3c; color: lightgray" 
								name="content" required="required" 
								placeholder="댓글을 입력해주세요" maxlength="200"></textarea>
						</div>
					</div>
					<div class="col col-2">
						<div class="row">
							<button class="btn" style="height: 110px; background: #D27D32;">등록</button>
						</div>
					</div>
				</div>
		<input type="hidden" value="${peanut.writer}" name="rep_target">
		<input type="hidden" value="${peanut.peanut_no}" name="peanut_no">
		<input type="hidden" value="${my_id }" name="writer">
			</form>
		</div> <!-- reply_container -->
		
</c:if>	<%-- test="${not empty peanut }" --%>			
</div>	<%-- container --%>
<script type="text/javascript">
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function comIns(reply_no) {
		$(".recome").hide();
		$("#comIns"+reply_no).show();
		$("#cont"+reply_no).focus();
	}
	function comDel(reply_no) {
		var comD = confirm('댓글을 삭제하시겠습니까?');
		if(comD) replyDel(reply_no);
		else return false;
	}
	function replyDel(reply_no) {
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/replyDel.do?reply_no="+reply_no,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {  	// 통신 성공
				if (xhr.responseText == 1) {				// 댓글 제거 성공
					location.reload();						// 리로드 
				} else {
					alert('잘못된 접근입니다.');				// 댓글 제거 실페
				}				
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
	}
	// 댓글, 리넛, 북마크 자바스크립트
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function setBm2(peanut_no) {		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,false);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				location.reload();
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);		
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
	function doRenut2(peanut_no, redirect) {
		location.href="${path}/renut2.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function cancelRenut2(peanut_no, redirect) {
		location.href="${path}/cancelRenut2.do?peanut_no="+peanut_no+"&redirect="+redirect;
	}
	function follow(my_id) {
		buttonChange();
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/follow.do?m_id="+my_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
	}
	function buttonChange() {
		var btn = document.getElementById('followbt');		
		btn.setAttribute("onclick","unfollow('${peanut.member.m_id}')");
		btn.setAttribute("onmouseover","this.innerText='언팔로우'");
		btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
	}
	function unfollow(my_id) {
		buttonChange2();
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/unfollow.do?m_id="+m_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('success');
			} else {alert('요청오류: '+xhr.status);}
		}
		xhr.send(null);
	}
	function buttonChange2() {
		var btn = document.getElementById('followbt');
		btn.innerText = '팔로우';
		btn.setAttribute("onclick","follow('${peanut.member.m_id}')");
		btn.removeAttribute("onmouseover");
		btn.removeAttribute("onmouseout");
	}
	function more_read(peanut_no, amt) {
		location.href="${path}/home/peanutDetail.do?peanut_no="+peanut_no+"&amt="+amt;
	}
</script>