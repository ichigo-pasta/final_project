<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="header.jsp"%>
<%@ include file="header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P-Nut</title>
</head>
<body>
	<div class="container" style="border: 1px soild red">
		<div class="row sticky-top" id="headline" style="background-color: #323232; z-index: 50">
			<div class="col col-lg-2 col-md-3 col-sm-4 col-4" style="padding: 0 36px">
				<img alt="" src="${path }/resources/images/P-Nut.png" height="50" onclick="location.href='${path}/home/timeline.do'">
			</div>
			<div class="col col-lg-10 col-md-9 col-sm-8 col-8">
				<tiles:insertAttribute name="headline" />
			</div>
		</div>
		<div class="row">
			<div class="col col-lg-2 col-md-3 col-sm-4 col-4" style="background-color: #323232;">
				<tiles:insertAttribute name="menu" />
			</div>
			<div class="col col-lg-10 col-md-9 col-sm-8 col-8" 
				style="border-right: 1px solid #323232" >
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>	
</body>
</html>