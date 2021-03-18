<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time}" var="now" scope="page"/>
<c:if test="${empty list }">
	<div style="text-align: center;"><br>알림이 존재하지 않습니다</div>
</c:if>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="notice">
	<div class="notice_container" onclick="link_to('${notice.notice_no }')">
		<div class="row">
			<div style="padding: 12px; margin: 10px 0 0 5px; width: 110px;">
		<c:if test="${notice.n_type == 'renut' }">
				<i class="bi bi-arrow-clockwise text-success" style="font-size: 30px"></i>
		</c:if>
		<c:if test="${notice.n_type == 'reply' }">
				<i class="bi bi-arrow-return-right text-warning" style="font-size: 30px"></i>
		</c:if>
		<c:if test="${notice.n_type == 'follow' }">
				<i class="bi bi-person-plus text-primary" style="font-size: 30px"></i>
		</c:if>
				<img alt="" src="${path }/resources/images/${notice.active_pf}" width="50" height="50">
			</div>
			<div class="col content_col" style="padding: 5px; margin: 10px 10px 0 0; border-bottom: 1px solid gray;">
		<c:if test="${notice.n_type == 'renut' }">
				<c:out value="${notice.active_nn } @${notice.active}"/>님이 리넛하셨습니다
				<c:if test="${notice.read == 'n' }"><span class="badge bg-info text-dark">new</span></c:if>
				<br>
				<pre style="padding-left: 20px"><c:out value="${notice.n_content }"/></pre>
		</c:if>
		<c:if test="${notice.n_type == 'reply' }">
				<c:out value="${notice.active_nn } @${notice.active}"/>님이 댓글을 다셨습니다
				<c:if test="${notice.read == 'n' }"><span class="badge bg-info text-dark">new</span></c:if>
				<br>
				<pre style="padding-left: 20px"><c:out value="${notice.n_content }"/></pre>
		</c:if>
		<c:if test="${notice.n_type == 'follow' }">
				<c:out value="${notice.active_nn } @${notice.active}"/>님이 팔로우하셨습니다
				<c:if test="${notice.read == 'n' }"><span class="badge bg-info text-dark">new</span></c:if>
		</c:if>
			</div>
		</div>
	</div>
	</c:forEach>
</c:if>
<script type="text/javascript">
	window.addEventListener('load', function() {
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if (xhr.status == 200 || xhr.status == 201) {
				console.log('read check success');
			} else {
				alert('요청오류: '+xhr.status);
			}
		}
		xhr.open("get","${path}/noticeAllRead.do",true);
		xhr.send(null);
	});
	function link_to(notice_no) {
		location.href="${path}/linkTo.do?notice_no="+notice_no;
	}
</script>