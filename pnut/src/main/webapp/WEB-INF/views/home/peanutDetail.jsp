<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../getMyId.jsp" %>
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
						width="100" height="100" onclick="profile('${peanut.writer}')"
						class="profile_pic">		
				</div>
				<div class="col col-10">
					<div class="row">
						<div class="col col-11">
							<c:out value="${peanut.member.m_nickname}, ${peanut.writer}, ${peanut.regdate}"/>
						</div>
						<div class="col col-1">
							<div class="btn-group">
								<a class="btn btn-light dropdown" type="button"
									id="dropdownMenuButton" data-bs-toggle="dropdown"
									aria-expanded="false"><i class="bi bi-three-dots"></i></a>
								<c:if test="${peanut.writer == my_id }">
									<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
										<li>
											<a class="dropdown-item" href="${path}/deletePd.do?peanut_no=${peanut.peanut_no}">
											<i class="bi bi-trash" style="color: red"></i>&nbsp;삭제</a></li>
									</ul>
								</c:if>
								<c:if test="${peanut.writer != my_id }">
									<c:if test="${isFollow == true }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<i class="bi bi-person-x"></i>&nbsp;언팔로우</a></li>
											<li><a class="dropdown-item" href="#">
												<i class="bi bi-x-circle"></i>&nbsp;차단</a></li>	
										</ul>
									</c:if>	
									<c:if test="${isFollow == false }">
										<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#">
												<i class="bi bi-person-plus"></i>&nbsp;팔로우</a></li>
											<li><a class="dropdown-item" href="#">
												<i class="bi bi-x-circle"></i>&nbsp;차단</a></li>
										</ul>
									</c:if>
								</c:if>				
							</div>
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
				</div> <%-- peanut 오른쪽 column --%>
			</div>	<%-- peanut row --%>
		</div> <%-- peanut_container --%>
		<div class="reply_container"> <!-- 댓글 -->
			<c:forEach items="${list}" var="rep">
		<c:if test="${rep.ref_level == 0}">
			<div class="row rep_row">
				<div class="col col-2">
					<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
						width="80" height="80" onclick="profile('${rep.writer}')"
						align="right" class="profile_pic">
				</div>
				<div class="col col-9" style="background: #eee; border-radius: 10px" >
					${rep.member.m_nickname}, @${rep.writer}<br>
					<pre>${rep.content}</pre>
					${rep.regdate }&nbsp;&nbsp;<button id="commentbt" onclick="comIns('${rep.reply_no}')">답글 쓰기</button>
				</div>
			</div>
		
			<div class="row recome" id="comIns${rep.reply_no}" style="display: none">
				<div class="col col-1"></div>
				<div class="col col-10">
					<div class="row">
						<div class="col"><b><c:out value="${m_nickname}"/></b></div>
					</div>
				<form action="${path}/home/comment.do" method="post">	
					<div class="row">
						<div class="col col-10">
							<div class="row">
								${rep.member.m_nickname}
								<textarea id="cont${rep.reply_no}"
									rows="5" style="resize: none" 
									name="content" required="required" 
									placeholder="답글을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="col col-2">
							<div class="row">
								<button class="btn btn-info">등록</button>
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
		</c:if>	
		<c:if test="${rep.ref_level == 1}">
			<div class="row rep_row">
				<div class="col col-1"></div>				
				<div class="col col-2">
					<div class="row">
						<div class="col">
							<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
								width="80" height="80" onclick="profile('${rep.writer}')"
								align="right" class="profile_pic">
						</div>
					</div>
				</div>
				<div class="col col-9" style="background: #eee; border-radius: 10px" >
					${rep.member.m_nickname}, @${rep.writer}<br>
					<pre><b>${rep.member.target_nn}</b>&nbsp;${rep.content}</pre>
					${rep.regdate }&nbsp;&nbsp;
					<button id="commentbt" onclick="comIns('${rep.reply_no}')">답글 쓰기</button>
				</div>
			</div>
			
			<div class="row recome" id="comIns${rep.reply_no}" style="display: none">
				<div class="col col-1"></div>
				<div class="col col-10">
					<div class="row">
						<div class="col"><b><c:out value="${m_nickname}"/></b></div>
					</div>
				<form action="${path}/home/comment.do" method="post">	
					<div class="row">
						<div class="col col-10">
							<div class="row">
								${rep.member.m_nickname}
								<textarea id="cont${rep.reply_no}"
									rows="5" style="resize: none" 
									name="content" required="required" 
									placeholder="답글을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="col col-2">
							<div class="row">
								<button class="btn btn-info">등록</button>
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
		</c:if>		
			</c:forEach>
			<form action="${path}/home/reply.do" method="post">
				<div class="row">
					<div class="col"><b><c:out value="${m_nickname}"/></b></div>
				</div>
				<div class="row">
					<div class="col col-10">
						<div class="row">
							<textarea rows="5" style="resize: none" 
								name="content" required="required" 
								placeholder="댓글을 입력해주세요"></textarea>
						</div>
					</div>
					<div class="col col-2">
						<div class="row">
							<button class="btn btn-info">등록</button>
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
	// 댓글, 리넛, 북마크 자바스크립트
	function profile(m_id) {
		location.href = "${path}/home/profileForm.do?m_id="+m_id;
	}
	function setBm(peanut_no) {		
		changeBmBtn1(peanut_no);		
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/setBm.do?peanut_no="+peanut_no,false);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('set bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);		
	}
	function changeBmBtn1(peanut_no) {		
		document.getElementById('bmBtn'+peanut_no).setAttribute("onclick", "deleteBm('"+peanut_no+"')");
		document.getElementById('bmBtnI'+peanut_no).setAttribute("style", "color: blue");
	}
	function deleteBm(peanut_no) {		
		changeBmBtn2(peanut_no);
		var xhr = new XMLHttpRequest();
		xhr.open("get","${path}/deleteBm.do?peanut_no="+peanut_no,false);
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('remove bm success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.send(null);				
	}
	function doRenut(peanut_no) {
		location.href="${path}/renut.do?peanut_no="+peanut_no;
	}
	function cancelRenut(peanut_no) {
		location.href="${path}/cancelRenut.do?peanut_no="+peanut_no;
	}
</script>