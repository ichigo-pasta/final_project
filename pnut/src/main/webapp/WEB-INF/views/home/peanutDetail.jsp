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
		<div class="reply_container"> <!-- 댓글 -->
			<c:forEach items="${list}" var="rep">
		<c:if test="${rep.ref_level == 0}">
			<div class="row">
				<div class="col col-2">
					<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
						width="80" height="80" onclick="profile('${rep.writer}')">
				</div>
				<div class="col col-9">
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
								<textarea rows="5" style="resize: none" 
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
					<input type="hidden" value="${peanut.peanut_no}" name="peanut_no">
					<input type="hidden" value="${rep.ref}" name="ref">
					<input type="hidden" value="${my_id }" name="writer">
				</form>
				</div>
			</div>
		</c:if>	
		<c:if test="${rep.ref_level == 1}">
			<div class="row">
				<div class="col col-1"></div>				
				<div class="col col-2">
					<div class="row">
						<div class="col">
							<img alt="" src="${path}/resources/images/${rep.member.m_profile}"
								width="80" height="80" onclick="profile('${rep.writer}')">
						</div>
					</div>
				</div>
				<div class="col col-9">
					${rep.member.m_nickname}, @${rep.writer}<br>
					<pre>${rep.content}</pre>
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
								<textarea rows="5" style="resize: none" 
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
	}
</script>