<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>P-Nut</title>
</head>
<body>
<div class="container">
<table class="table table-bordered">
	<tr height="50">
		<td><img alt="" src="${path }/resources/images/P-Nut.png" height="50" onclick="">
		<td style="display: flex; justify-content: space-between; align-items: center;"><tiles:insertAttribute name="headline"/></td>
	</tr>
	<tr>
		<td width="20%"><tiles:insertAttribute name="menu"/></td>
		<td><tiles:insertAttribute name="body"/></td>
	</tr>
</table>
</div>
</body>
</html>