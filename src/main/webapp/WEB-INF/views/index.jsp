<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Canvas</title>
</head>
<style>
	#goBtn {
		z-index: 50; color: #fff; font-size: 20px; border: 2px solid #fff;
		padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
	}
	#goBtn:hover {
		color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
		padding: 12px 24px; border-radius: 5px; cursor: pointer;
	}
	#iBtn {position: fixed; text-align: center}
	.center {position: absolute; top: 60%; left: 47%; margin: -50px 0 0 -50px;}
</style>
<body>

	<div id="iBtn" class="center">
		<button id="goBtn" onclick="javascript:location.href='boardList';"> Go Canvas </button>
	</div>

</body>
</html>