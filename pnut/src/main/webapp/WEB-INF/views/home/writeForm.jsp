<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div style="padding: 0px 12px;">
<form action="${path}/home/write.do" method="post" enctype="multipart/form-data">
	<div class="row" style="padding-top: 20px">
		<div style="width: 120px">
			<img alt="" src="${path}/resources/images/${m_profile}"
					width="100" height="100" class="profile_pic">
		</div>
		<div class="col">
			<div class="row">
				<textarea rows="9" required="required" 
					name="content" id="content" style="resize: none; background: #3c3c3c; color: lightgray" 
					onchange="checkByte(e);" ></textarea>
			</div>
			<div class="row" align="right">
				<span id="count">0/400</span>
			</div>
			<div class="row" align="right">
				<div class="col">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-outline-warning" onclick="img_upload();" 
							style="display: flex; align-items:center; padding: 5px 12px; background: #3c3c3c;">
							<i class="bi bi-card-image" style="font-size: 2rem; color: skyblue; line-height: 36px"></i> 
							<font style="color: lightgray;">&nbsp;사진추가</font>
						</button>
						<button type="button" class="btn btn-outline-warning" onclick="img_delete();" 
							style="display: flex; align-items: center; padding: 5px 12px; background: #3c3c3c;">
							<i class="bi bi-card-image" style="font-size: 2rem; color: red; line-height: 36px"></i>
							<font style="color: lightgray;">&nbsp;사진삭제</font>
						</button>
					</div>
				</div>
			</div>
			<div class="row" align="right" style="margin-top: 10px;">
				<div class="col">
					<button class="btn btn-warning">피넛</button>
				</div>
			</div>		
			<div class="row">
				<div class="col-6" id="img_container1"></div>
				<div class="col-6" id="img_container2"></div>
				<div class="col-6" id="img_container3"></div>
				<div class="col-6" id="img_container4"></div>
			</div> 
		</div>
	</div>
<input type="file" accept="image/*" id="file1" name="file1" hidden="hidden" onchange="setThumbnail(event);">
<input type="file" accept="image/*" id="file2" name="file2" hidden="hidden" onchange="setThumbnail(event);">
<input type="file" accept="image/*" id="file3" name="file3" hidden="hidden" onchange="setThumbnail(event);">
<input type="file" accept="image/*" id="file4" name="file4" hidden="hidden" onchange="setThumbnail(event);">
</form>
</div>
<script type="text/javascript">
	document.getElementById('content').addEventListener('keyup', checkByte);
	var countSpan = document.getElementById('count');
	var msg = '';
	var MAX_MESSAGE_BYTE = 400;
	
	function count(msg) {
		var totalByte = 0;
		for (var i = 0; i < msg.length; i++) {
			var currentByte = msg.charCodeAt(i);
			(currentByte > 128) ? totalByte += 2 : totalByte++;
		}
		return totalByte;
	}
	
	function checkByte(e) {
		const totalByte = count(e.target.value);
		if (totalByte <= MAX_MESSAGE_BYTE) {
			countSpan.innerText = totalByte.toString()+"/"+MAX_MESSAGE_BYTE;
			msg = e.target.value;
		} else {
			alert(MAX_MESSAGE_BYTE + '까지만 입력가능합니다');
			countSpan.innerText = count(msg).toString()+"/"+MAX_MESSAGE_BYTE;
			e.target.value = msg;
		}
	}
	
	function setThumbnail(event) {
		if (event.target && event.target.files[0].size > (10 * 1024 * 1024)) {
			alert("파일 사이즈가 10mb 를 넘습니다.");
		    event.target.value = null;
		}
		var evt;
		switch (event.target.name) {
		case "file1":
			var i_con = document.getElementById('img_container1');
			while(i_con.hasChildNodes()) {
				i_con.removeChild(i_con.lastChild);
			}
			evt = 1;
			break;
		case "file2":
			var i_con = document.getElementById('img_container2');
			while(i_con.hasChildNodes()) {
				i_con.removeChild(i_con.lastChild);
			}	
			evt = 2;
			break;
		case "file3":
			var i_con = document.getElementById('img_container3');
			while(i_con.hasChildNodes()) {
				i_con.removeChild(i_con.lastChild);
			}
			evt = 3;
			break;
		case "file4":
			var i_con = document.getElementById('img_container4');
			while(i_con.hasChildNodes()) {
				i_con.removeChild(i_con.lastChild);
			}
			evt = 4;
		}		
		var image = event.target.files;		
		var reader = new FileReader();
		reader.onload = function(event) {			
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "100%");
			img.setAttribute("class", "img-thumbnail");
			document.getElementById('img_container' + evt).appendChild(img);						
		}
		reader.readAsDataURL(image[0]);
	}
	
	function img_upload() {
		if (!document.getElementById('img_container1').hasChildNodes()) {
			document.getElementById('file1').click();
		} else if (!document.getElementById('img_container2').hasChildNodes()) {
			document.getElementById('file2').click();
		} else if (!document.getElementById('img_container3').hasChildNodes()) {
			document.getElementById('file3').click();
		} else if (!document.getElementById('img_container4').hasChildNodes()) {
			document.getElementById('file4').click();
		} else {
			alert('사진은 4장까지만 올릴 수 있습니다');
		}
	}
	
	function img_delete() {
		var i_con;
		for (var i=1; i<=4; i++) {
			document.getElementById('file' + i).value = "";
			i_con = document.getElementById('img_container' + i);
			while(i_con.hasChildNodes()) {
				i_con.removeChild(i_con.lastChild);
			}
		}
	}	
</script>