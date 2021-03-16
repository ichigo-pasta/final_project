<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"  
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!-- JQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
<style>
	.err {color:red; font-weight: bold;}
	pre {
		word-break: break-all;
		white-space: pre-wrap;
		font-size: 18px;
	}
	body {
		display: flex;
		align-items: center;
		background: #282828;
		color: gray;
		font-size: 14px;
	}
	.container {
		min-width: 576px;
	}
	.btBox button {
		border: none;
		background-color: transparent;
	}
	#headline {
		display: flex;
		align-items: center;
		height: 85px;
	}
	.peanut_container {		
		padding: 10px 0;
		border-bottom: 1px solid gray;
	}
	.peanut_container:nth-last-child(1) {
		border-bottom: none
	}
	a:link {
		text-decoration: none
	}
	.tl_image {
		overflow: hidden;
		height: 20vw;
		display: flex;
		align-items: center;
		justify-content: center
	}
	.pic_container {
		height: 200px;
		background-image: url('${path}/resources/images/${member.m_bg}');
		background-size: 100% 100%;
	}
	.bi::before {
		vertical-align: -.125em;
	}
	.rep_row {
		padding: 5px 0;
	}
	.rep_row:first-child {
		padding: 10px 0 5px 0;
	} 
	.profile_pic {
		border-radius: 10px;
	}
	.btnBox {
		color: gray;
	}
	#profileUpdateBorder {
		border: 1px solid gray;
		border-radius: 10px;
		margin: 5px 0px;
	}
	#followbt {
		border: 0;
		outline: 0;
	}
	#blockbt {
		border: 0;
		outline: 0;
	}
	
</style>