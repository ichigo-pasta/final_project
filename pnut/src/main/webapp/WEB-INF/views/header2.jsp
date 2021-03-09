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
		word-break: break-word;
		white-space: pre-wrap;
	}
	.peanut_container button {
		border: none;
		background-color: transparent;
	}
	/* div {
		border: 1px solid black;
	} */
	#headline {
		display: flex;
		align-items: center;
		height: 60px;
	}
	.peanut_container {		
		padding: 10px 0;
		border-bottom: 1px solid black;
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
</style>