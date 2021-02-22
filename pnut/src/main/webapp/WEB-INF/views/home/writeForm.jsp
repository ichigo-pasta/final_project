<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setThumbnail(number) {
		var file = document.getElementById("image"+number).files;
	   	var reader = new FileReader();
	   	reader.onload = function() {
	   		var img = document.createElement("img");
	   		img.setAttribute("src", file[0].result);
	   		img.setAttribute("width", "50%");
	  		reader.readAsDataURL(file[0]);
	  		console.log(reader.readAsDataURL(file[0]));
	   		switch (number){
	   		case "1":
	   			document.querySelector("#img_container1").appendChild(img);
	   			break;
	   		}
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
				<label>1.&nbsp;<i class="bi bi-card-image" style="font-size: 30px"></i>
   				<input type="file" id="image1" accept="image/*" onchange="setThumbnail(1);" 
   					name="picture1" hidden="hidden"></label>
   				<label>2.&nbsp;<i class="bi bi-card-image" style="font-size: 30px"></i>
   				<input type="file" id="image2" accept="image/*" onchange="setThumbnail(2);" 
   					name="picture2" hidden="hidden"></label>
   				<label>3.&nbsp;<i class="bi bi-card-image" style="font-size: 30px"></i>
   				<input type="file" id="image3" accept="image/*" onchange="setThumbnail(3);" 
   					name="picture3" hidden="hidden"></label>
   				<label>4.&nbsp;<i class="bi bi-card-image" style="font-size: 30px"></i>
   				<input type="file" id="image4" accept="image/*" onchange="setThumbnail(4);" 
   					name="picture4" hidden="hidden"></label>
				<span id="img_container1" style="width: 50%"></span>
				<span id="img_container2" style="width: 50%"></span><br>
				<span id="img_container3" style="width: 50%"></span>
				<span id="img_container4" style="width: 50%"></span><br>
				<input type="submit" value="피넛" class="btn btn-success"></td>
		</tr>
	</table>	
</form>
</div>
</body>
</html>