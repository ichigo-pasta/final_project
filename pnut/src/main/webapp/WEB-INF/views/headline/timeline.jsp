<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="row">
	<div class="col col-7" style="color: #eeeeee;">
		<h5>Timeline</h5>
	</div>
	<div class="col col-5">
	<span class="input-group input-group-sm" align="right">
		<span class="input-group-text"><i class="bi bi-search"></i></span>
		<input type="text" id="kw" class="form-control" placeholder="Search..." onkeypress="enter(event)">
		<button class="btn btn-outline-secondary" onclick="search('peanut')">검색</button>
	</span>
	</div>
</div>
<script type="text/javascript">	
	function search() {
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', '${path}/home/search.do');
		
		var type = document.createElement('input');
		type.setAttribute('type', 'hidden');
		type.setAttribute('name', 'type');
		type.setAttribute('value', arguments[0]);		
		
		var keyword = document.createElement('input');
		keyword.setAttribute('type', 'hidden');
		keyword.setAttribute('name', 'keyword');
		if(arguments.length == 1) {
			keyword.setAttribute('value', document.getElementById("kw").value);			
		} else {
			keyword.setAttribute('value', arguments[1]);
		}
		if (keyword.value == "") return false;
		
		var amt = document.createElement('input');
		amt.setAttribute('type', 'hidden');
		amt.setAttribute('name', 'amt');
		amt.setAttribute('value', '20');
		
		form.appendChild(type);
		form.appendChild(keyword);
		form.appendChild(amt);
		
		document.body.appendChild(form);
		form.submit();		
	}	
	function enter(event) {
		if(event.keyCode == 13) {
			search('peanut');			
		}
	}
</script>