<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>P-Nut</title><%@ include file="header.jsp" %><%@ include file="header2.jsp" %>
</head>
<body>
<div class="container">
    <div class="row" id="headline">
    	<div class="col col-lg-2 col-md-3 col-sm-4" align="center">
    		<img alt="" src="${path }/resources/images/P-Nut.png" height="50" onclick=""></div>
    	<div class="col col-lg-10 col-md-9 col-sm-8" >
    		<tiles:insertAttribute name="headline"/></div>
    </div>
    <div class="row">
    	<div class="col col-lg-2 col-md-3 col-sm-4" align="right"><tiles:insertAttribute name="menu"/></div>
    	<div class="col col-lg-10 col-md-9 col-sm-8"><tiles:insertAttribute name="body"/></div>
  	</div>  	
  </div>
</body>
</html>