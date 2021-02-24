<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
</head>
<body>
	<div class="container">
		<h2 class="text-primary">타임라인</h2>
	<c:forEach items="${list }" var="pn">
			<div class="gallery">
				<table class="table table-border">
		<c:if test="${pn.renut != null}">
					<tr>
						<td colspan="2"><i class="bi bi-arrow-repeat"></i>${pn.writer}님이 리넛하셨습니다.</td>
					<tr>
		</c:if>
					<tr>
						<td rowspan="5"></td>
						<td>, ${pn.writer}, ${pn.regdate}</td>
					<tr>
					<tr>
						<td>${pn.content }</td>
					</tr>
		<c:if test="${pn.picture1 != null}">
					<tr>
						<td>
							<a href="${path}/resources/images/${pn.picture1}">
								<img src="${path}/resources/images/${pn.picture1}" width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
			<c:if test="${pn.picture2 != null}">
							<a href="${path}/resources/images/${pn.picture2}">
								<img src="${path}/resources/images/${pn.picture2}" width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
			</c:if>
			<c:if test="${pn.picture3 != null}">
							<a href="${path}/resources/images/${pn.picture3}">
								<img src="${path}/resources/images/${pn.picture3}" width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
			</c:if>
			<c:if test="${pn.picture4 != null}">
							<a href="${path}/resources/images/${pn.picture4}">
								<img src="${path}/resources/images/${pn.picture4}" width="45%" onclick="baguetteBox.run('.gallery')">
							</a>
			</c:if>
						</td>
					</tr>
		</c:if>
					<tr>
						<td>댓글, 리넛, 좋아요</td>
					</tr>
				</table>
			</div>
	</c:forEach>
	</div>	
</body>
</html>
