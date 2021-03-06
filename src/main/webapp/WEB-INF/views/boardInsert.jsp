<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
</head>
<style>
#InsertTable{ 
	border-spacing: 1; 
	border-collapse: collapse; 
	background:white;
	border-radius:6px;
	max-width:800px; 
	width:100%;
	margin:0 auto;
    right: 24em;
    top: 12em;
}
table th { 
	height:50px;
	background:#FFED86;
	font-size:16px;
}
  
table tr { 
	height:48px; 
	border-bottom:1px solid gray ;
	color: gray;
}
.writeBtn{
	width: 50px;
	color: gray; 
	font-weight: bold;
	border: 2px solid gray;
	border-radius:8px;
	padding: 3px 3px;
}
.writeBtn:hover{
	background-color: gray; 
	color: whitesmoke; 
	border: 1px solid rgb(168, 168, 154);
	box-shadow: 3px 3px 3px gray;
}
.input{
	border: 0;
	margin : 3px 0 3px 5px;
}
input:focus{
	outline: 1px solid #FFED86;
}
</style>
<body>

	<h1 align="center" style="margin:1.5em" >Board Drawing</h1>

	<form action="boardInsert" method="post" enctype="Multipart/form-data">
		<table id="InsertTable" border="1">
			<tr>
				<th>Title</th>
				<td>
					<input type="text" class="input" size="80" name="boardTitle">
				</td>
			</tr>
			<tr>
				<th>Writer</th>
				<td>
					<input type="text" class="input" name="boardWriter" id="boardWriter">
				</td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="10" class="input" cols="60" name="boardContent" style="resize: none;"></textarea></td>
			</tr>
			<tr>
				<th>Canvas</th>
				<td>
					<canvas class="canvas" width="750" height="300"></canvas>
					<input type="hidden" id="srcImg" name="srcImg" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="writeBtn" id="saveBtn" value="SAVE">
					<button class="writeBtn" id="resetBtn" onclick="resetImg()">Reset</button>
					<button class="writeBtn" onclick="location.href='boardList'">Home</button>
				</td>
			</tr>
		</table>
	</form>
	
<script>
	const canvas = document.querySelector('.canvas');
	const context = canvas.getContext('2d');
	const saveBtn = document.querySelector('#saveBtn');
	var srcImg = document.querySelector('#srcImg');
	
	//????????? ????????? ??????
	canvas.addEventListener('mousedown', downHandler);
	canvas.addEventListener('mousemove', moveHandler);
	canvas.addEventListener('mouseup', upHandler);
	saveBtn.addEventListener('click', createImage);
	
	let drawing; // ?????????????????? ?????? :true,false
	let colorVal = 'black'; //????????? ??????
	//true????????? ???????????? ??????
	function downHandler() {
	  drawing = true;
	}
	//?????????????????? ???????????? false
	function upHandler() {
	  drawing = false;
	}
	//???????????? ???????????? ????????? ?????????????????????
	function moveHandler(e) {
	  if (!drawing) return;
	  context.fillStyle = colorVal;
	  context.beginPath();
	  //???????????? ?????? x,y??????, ????????? ?????????
	  context.arc(e.layerX, e.layerY, 6, 0, Math.PI*2, false);
	  context.fill();
	}
	//????????? ??????
	function createImage() {
	  const url = canvas.toDataURL('image/png', 'image/octet-stream');
	  srcImg.attr('value',url);
	  console.log("imgsrc:",url);
	  debugger;
	}
	//????????? ?????? ?????????
	function resetImg(){
	  context.clearRect(0,0,canvas.width,canvas.height);
	}

</script>
</body>
</html>