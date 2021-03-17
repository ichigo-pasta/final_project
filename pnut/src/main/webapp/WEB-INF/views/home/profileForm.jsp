<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../getMyId.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
<div>
	<div class="pic_container d-flex align-items-end" style="margin: 12px 0;">
		<img alt="" src="${path}/resources/images/${member.m_profile}"
			width="100" height="100">
	</div> 
	<div class="row">
		<div class="col col-9 align-self-center" style="margin: 2px 0;">
			<c:out value="${member.m_nickname }"></c:out>
		</div>
		<div class="col row justify-content-end" style="margin: 2px 0;"> <!-- 본인 : 프로필 수정, 다른 사람 : 팔로우, 언팔로우 -->
			<c:if test="${member.m_id == my_id}"> <!-- 본인일시 프로필 수정 -->
				<a href="${path}/home/profileUpdateForm.do?m_id=${member.m_id }"
					class="btn btn-outline-info">프로필 수정</a>
			</c:if>
			<c:if test="${member.m_id != my_id}"> <!-- 다른 사람 프로필에서는 팔로우 언팔로우 -->
				<c:if test="${isFollow == true }">
					<button id="followbt" onclick="unfollow('${member.m_id}')" 
						onmouseover="this.innerText='언팔로우'" 
						onmouseout="this.innerText='팔로우 중'"
						class="btn btn-outline-info">팔로우 중</button>
					<button id="blockbt" onclick="block('${member.m_id}')"						
						class="btn btn-outline-info">차단하기</button>
				</c:if>
				<c:if test="${isFollow == false }">
					<c:if test="${member.blockByMe == true }">
					<button id="blockbt" onclick="unblock('${member.m_id}')"						
						class="btn btn-outline-info"
						onmouseover="this.innerText='차단 해제'" 
						onmouseout="this.innerText='차단됨'">차단 해제</button>
					</c:if>
					<c:if test="${member.blockByMe == false }">
						<c:if test="${member.blockMe == true }">
					<button id="blockbt" onclick="block('${member.m_id}')"						
						class="btn btn-outline-info">차단하기</button>	
						</c:if>
						<c:if test="${member.blockMe == false }">
					<button id="followbt" onclick="follow('${member.m_id}')"						
						class="btn btn-outline-info">팔로우</button>
					<button id="blockbt" onclick="block('${member.m_id}')"						
						class="btn btn-outline-info">차단하기</button>	
						</c:if>
					</c:if>
				</c:if>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col" style="margin: 2px 0;"> 
			<c:out value="@${member.m_id }"/>
		</div>
	</div>
	<c:if test="${member.blockMe == false && member.blockByMe == false }">
	<div class="row">
		<div class="col" style="margin: 2px 0;"> 
			<pre>${member.m_intro }</pre>
		</div>
	</div>
	<div class="row">
		<div class="col" style="margin: 2px 0;"> 
			가입일 : <c:out value="${member.m_regdate }"/>
		</div>
	</div>
	<div class="row">
		<div class="col col-2" style="margin: 2px 0;"> 
			<a href="${path}/home/followingList.do?m_id=${member.m_id}">${followLtSize } 팔로우 중</a>
		</div>
		<div class="col col-2" style="margin: 2px 0;"> 
			<a href="${path}/home/followerList.do?m_id=${member.m_id}">${followerLtSize } 팔로워</a>
		</div>
	</div>
	<ul class="nav nav-tabs nav-fill">
  		<li class="nav-item">
  			<a class="nav-link" id="pean"  style="color: #D27D32"
  				href="${path}/home/profileForm.do?m_id=${member.m_id}&type=peanut">피넛</a>
 		</li>
 		<li class="nav-item">
  			<a class="nav-link" id="peanPic"  style="color: #D27D32"
  				href="${path}/home/profileForm.do?m_id=${member.m_id}&type=peanutPic">사진 피넛</a>
  		</li>
	</ul>
	</c:if>
	<c:if test="${member.blockMe == true || member.blockByMe == true }">
		<h5 class="text-info">정보를 볼 수 없습니다</h5>
	</c:if>
</div>
<c:if test="${member.blockMe == false && member.blockByMe == false }">
<div>
	<c:if test="${empty list}">
			데이터가 없습니다.
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach items="${list }" var="pn">
			<div class="row peanut_container">			
			<c:if test="${not empty pn.renut }">
			<div class="row">
				<div class="col" style="padding-bottom: 10px ">
					<i class="bi bi-arrow-repeat"></i><c:out value="${pn.writer}"/> 님이 리넛하셨습니다.
				</div>
			</div>
			</c:if>
			<div style="width: 110px">
		<c:if test="${empty pn.renut }">
					<img alt="" src="${path}/resources/images/${pn.member.m_profile}"
						width="100" height="100" onclick="profile('${pn.writer}')"
						class="profile_pic">
		</c:if>
		<c:if test="${not empty pn.renut }">					
					<img alt="" src="${path}/resources/images/${pn.member.re_pf}"
						width="100" height="100" onclick="profile('${pn.re_writer}')"
						class="profile_pic">
		</c:if>
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
				<c:if test="${empty pn.renut }">
							<c:out value="${pn.member.m_nickname} @${pn.writer}" />
				</c:if>
				<c:if test="${not empty pn.renut }">
							<c:out value="${pn.member.re_nick} @${pn.re_writer}" />
				</c:if>
							<c:choose>
								<c:when test="${(now - pn.regdate.time) > (1000*60*60*24*7*4)}">
									<fmt:formatDate value="${pn.regdate }" pattern="yyyy년 MM월 dd일" />
								</c:when>
								<c:when
									test="${(now - pn.regdate.time) <= (1000*60*60*24*7*4) and (now - pn.regdate.time) > (1000*60*60*24*7)}">
									<fmt:parseNumber
										value="${(now - pn.regdate.time) / (1000*60*60*24*7) }"
										integerOnly="true" />주 전
								</c:when>
								<c:when
									test="${(now - pn.regdate.time) <= (1000*60*60*24*7) and (now - pn.regdate.time) > (1000*60*60*24)}">
									<fmt:parseNumber
										value="${(now - pn.regdate.time) / (1000*60*60*24) }"
										integerOnly="true" />일 전
								</c:when>
								<c:when
									test="${(now - pn.regdate.time) <= (1000*60*60*24) and (now - pn.regdate.time) > (1000*60*60)}">
									<fmt:parseNumber
										value="${(now - pn.regdate.time) / (1000*60*60) }"
										integerOnly="true" />시간 전
								</c:when>
								<c:when
									test="${(now - pn.regdate.time) <= (1000*60*60) and (now - pn.regdate.time) > (1000*60)}">
									<fmt:parseNumber
										value="${(now - pn.regdate.time) / (1000*60) }"
										integerOnly="true" />분 전
								</c:when>
								<c:otherwise>
									1분 이내
								</c:otherwise>
							</c:choose>
						</div>
						
					</div>
					<div class="row">
						<div class="col content_col" id="content${pn.peanut_no }" style="min-height: 5vw; cursor: pointer">
							<pre id="contpre${pn.peanut_no }">${pn.content}</pre>
						</div>						
					</div>
					<c:if test="${pn.picture1 != null}">
						<div class="row gallery">
							<div class="col col-6 tl_image">
								<a href="${path}/resources/images/${pn.picture1}"> <img
									src="${path}/resources/images/${pn.picture1}" width="100%"
									onclick="baguetteBox.run('.gallery')">
								</a>
							</div>
							<c:if test="${pn.picture2 != null}">
								<div class="col col-6 tl_image">
									<a href="${path}/resources/images/${pn.picture2}"> <img
										src="${path}/resources/images/${pn.picture2}" width="100%"
										onclick="baguetteBox.run('.gallery')">
									</a>
								</div>
								<c:if test="${pn.picture3 != null}">
									<div class="col col-6 tl_image">
										<a href="${path}/resources/images/${pn.picture3}"> <img
											src="${path}/resources/images/${pn.picture3}" width="100%"
											onclick="baguetteBox.run('.gallery')">
										</a>
									</div>
									<c:if test="${pn.picture4 != null}">
										<div class="col col-6 tl_image">
											<a href="${path}/resources/images/${pn.picture4}"> <img
												src="${path}/resources/images/${pn.picture4}" width="100%"
												onclick="baguetteBox.run('.gallery')">
											</a>
										</div>
									</c:if>
								</c:if>
							</c:if>
						</div>
						<!-- 갤러리 종료 부분 -->
					</c:if>
					<c:if test="${pn.picture1 == null}">
						<div class="row">
							<div class="col col-10">&nbsp;</div>
						</div>
					</c:if>
					<!-- 사진 없을 때 -->
					<div class="row btBox">
						<!-- 댓글, 리넛, 북마크 박스 -->
						<div class="col col-4">
							<!-- 댓글 아이콘 -->
							<button class="btnBox" 
								onclick="location.href='${path}/home/peanutDetail.do?peanut_no=${pn.peanut_no}'">
								<c:if test="${pn.repCnt != 0}">
									<i class="bi-chat" style="color: #D27D32;"></i>
							${pn.repCnt }
						</c:if>
								<c:if test="${pn.repCnt == 0}">
									<i class="bi-chat" style="color: gray"></i>
								</c:if>
							</button>
						</div>
						<!-- 댓글 아이콘 종료 -->
						<div class="col col-4">
							<!-- 리넛 아이콘 -->
							<c:if test="${pn.renuted == false }">
								<button data-bs-toggle="modal"
									data-bs-target="#set${pn.peanut_no}"
									class="btnBox">
									<i class="bi-arrow-clockwise" style="color: gray"></i>
									<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>
								</button>
							</c:if>
							<c:if test="${pn.renuted == true }">
								<button data-bs-toggle="modal"
									data-bs-target="#cancel${pn.peanut_no}"
									class="btnBox">
									<i class="bi-arrow-clockwise" style="color: #D27D32;"></i>
									<c:if test="${pn.renutCnt != 0}">${pn.renutCnt }</c:if>
								</button>
							</c:if>
						</div>
						<!-- 리넛 아이콘 종료 -->
						<div class="col col-4">
							<!-- 북마크 아이콘 -->
							<c:if test="${pn.bookmarked == true}">
								<button onclick="deleteBm('${pn.peanut_no}')" class="btnBox">
									<i class="bi-bookmark" style="color: #D27D32;"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
							</c:if>
							<c:if test="${pn.bookmarked == false}">
								<button onclick="setBm('${pn.peanut_no}')" class="btnBox">
									<i class="bi-bookmark" style="color: gray"></i>
									<c:if test="${pn.bmCnt != 0}">${pn.bmCnt }</c:if>
								</button>
							</c:if>
						</div>
						<!-- 북마크 아이콘  종료-->
					</div>
					<!-- 댓글, 리넛, 북마크 박스  종료-->
					
					<!-- 리넛 설정 Modal -->
					<div class="modal fade" id="set${pn.peanut_no}"
						aria-labelledby="set${pn.peanut_no}Label"
						data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="set${pn.peanut_no}Label">리넛하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">${pn.content}</div>
									</div>
								</div>
								<div class="modal-footer">
									<a type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</a> <a type="button"
										class="btn btn-primary"
										onclick="location.href='${path}/renut.do?peanut_no=${pn.peanut_no}&redirect=profile&m_id=${member.m_id }'">리넛</a>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal 종료 -->
					<!-- 리넛 취소 Modal -->
					<div class="modal fade" id="cancel${pn.peanut_no}"
						aria-labelledby="cancel${pn.peanut_no}Label"
						data-bs-backdrop="static" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="cancel${pn.peanut_no}Label">리넛
										취소하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col" style="min-height: 5vw">${pn.content}</div>
									</div>
								</div>
								<div class="modal-footer">
									<a type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</a> <a type="button"
										class="btn btn-primary"
										onclick="location.href='${path}/cancelRenut.do?peanut_no=${pn.peanut_no}&redirect=profile&m_id=${member.m_id }'">리넛 취소</a>
								</div>
							</div>
						</div>
					</div>	<!-- 취소 Modal 종료 -->
				</div>
			</div>	<!-- peanut_container 종료 -->
		</c:forEach>
		<c:if test="${more == 1 }">
			<div class="d-grid gap-2">
				<br>		
	  			<button class="btn btn-outline-info btn-lg" type="button" onclick="more_read_pf('${amt+20}', '${type }')">more...</button>
			</div>
		</c:if>	
	</c:if>	
</div>
</c:if>
<input type="hidden" value="${type}" id="types">
<script type="text/javascript">
	var cont_rows = document.getElementsByClassName('content_col');
	var startX;
	var startY;
	const judge = 5;
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
	window.onload = function() {
		if (document.getElementById("types").value == "peanut") {
			document.getElementById("pean").setAttribute("class","nav-link active");
		} else {
			document.getElementById("peanPic").setAttribute("class","nav-link active");
		}
		document.body.scrollTop = ${pf_scroll};
		
	}
	function follow(m_id) {		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/follow.do?m_id="+m_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {  	// 통신 성공
				if (xhr.responseText == 1) {				// 팔로우 성공
					console.log('follow success');
					buttonChange();					
				} else if (xhr.responseText == -2) {		// 차단한 사용하는 팔로우 못하게
					alert('팔로우 할 수 없는 사용자입니다');
				} else if (xhr.responseText == -1) {		// 본인 팔로우를 못하게
					alert('자기자신은 팔로우할 수 없습니다');
				} else {
					alert('팔로우 과정에서 오류가 발생했습니다');
				}				
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);
	}
	function buttonChange() {
		var btn = document.getElementById('followbt');		
		btn.setAttribute("onclick","unfollow('${member.m_id}')");
		btn.setAttribute("onmouseover","this.innerText='언팔로우'");
		btn.setAttribute("onmouseout","this.innerText='팔로우 중'");
	}
	function unfollow(m_id) {		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/unfollow.do?m_id="+m_id,true);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('unfollow success');
				buttonChange2();
			} else {alert('요청오류: '+xhr.status);}
		}
		xhr.send(null);
	}
	function buttonChange2() {
		var btn = document.getElementById('followbt');
		btn.innerText = '팔로우';
		btn.setAttribute("onclick","follow('${member.m_id}')");
		btn.removeAttribute("onmouseover");
		btn.removeAttribute("onmouseout");
	}	
	
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	
	function more_read_pf(num, ty) {
		var pf_scroll = document.scrollingElement.scrollTop;
		location.href = "${path}/home/profileForm.do?m_id=${member.m_id}&amt="+num+"&type="+ty+"&pf_scroll="+pf_scroll;
	}
	function block(m_id) {
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				if (xhr.responseText == 1) {
					alert("유저 "+m_id+"를 차단목록에 등록했습니다");
					location.reload();
				} else if (xhr.responseText == 0) {
					alert('차단 과정에서 오류가 발생했습니다');
				} else if (xhr.responseText == -1) {
					alert('이미 차단한 사용자입니다')
				} else if (xhr.responseText == -2) {
					alert('차단할 아이디 정보가 누락되었습니다');
				} else {
					alert('자기자신은 차단할 수 없습니다');
				}
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/block.do?m_id="+m_id,true);
		xhr.send(null);
	}
	function unblock(m_id) {
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				if (xhr.responseText == 1) {
					alert("유저 "+m_id+"의 차단을 해제했습니다");
					location.reload();
				} else if (xhr.responseText == 0) {
					alert('차단 해제 과정에서 오류가 발생했습니다');
				} else if (xhr.responseText == -1) {
					alert('차단 해제할 아이디 정보가 누락되었습니다');				
				}
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/unblock.do?m_id="+m_id,true);
		xhr.send(null);
	}
	function setBm(peanut_no) {
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				location.reload();
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,true);
		xhr.send(null);		
	}
	function deleteBm(peanut_no) {		
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				location.reload();
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,true);
		xhr.send(null);				
	}
</script>