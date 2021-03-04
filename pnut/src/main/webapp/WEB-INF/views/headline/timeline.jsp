<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 class="text-primary">타임라인</h4>
	<span>
		
		<input type="text" name="keyword" id="keyword" placeholder="검색">
		<button onclick="search()">검색</button>
	</span>
<script type="text/javascript">
	function search() {
		var keyword = document.getElementById("keyword").value;
		location.href = "${path}/home/search.do?type=peanut&keyword="+keyword+"&amt=20";
	}
</script>
</body>
</html>