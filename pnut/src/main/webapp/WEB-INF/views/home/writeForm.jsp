<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setThumbnail(event) {
	   var images = event.target.files;
	   
	   for (var i in images) {
	      var reader = new FileReader();
	      reader.onload = function(event) {
	         var img = document.createElement("img");
	         img.setAttribute("src", event.target.result);
	         img.setAttribute("width", "50%");
	         document.querySelector("#img_container").appendChild(img);
	      };
	      /* 이 위치에 놓는게 맞는지 모르겠네요 */
	      if (images.length > 4) {
	    	   alert('이미지는 최대 4매까지 올릴 수 있습니다');
	    	   event.target.value = null;            
	    	   return;
	    	}
	      reader.readAsDataURL(images[i]);
	   }
	}
</script>
</head>
<body>
<div class="container">
<form action="write.do">
	<table class="table table-border">
		<tr>
			<td rowspan="2">프로필 사진</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>
				<label><i class="bi bi-card-image" style="font-size: 30px"></i>
   				<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" 
   					name="picture" multiple="multiple" hidden="hidden"></label>
				<div id="img_container" style="width: 800px"></div>
				<input type="submit" value="피넛" class="btn btn-success"></td>
		</tr>
	</table>	
<a data-fslightbox="gallery" href="${path }/resources/images/P-Nut.png">로고</a>
<a data-fslightbox="gallery" href="${path }/resources/images/jung.jpg">1</a>
<script src="fslightbox.js"></script> 
</form>
</div>
</body>
</html>