<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<style>
#boardDetailTable{ 
	border-spacing: 1; 
	border-collapse: collapse; 
	background:white;
	border-radius:6px;
	max-width:800px; 
	width:100%;
	margin:0 auto;
	position: absolute;
    right: 24em;
    top: 12em;
}
#boardDetailTable th { 
	width:80px;
	background:#FFED86;
	font-size:16px;
	border-bottom:1px solid gray ;
	padding: 5px 0px ;
}
  
#boardDetailTable td { 
	border-bottom:1px solid gray ;
	color: gray;
	padding: 3px 3px 3px 10px;
}
button{
	width: 70px;
	color: gray; 
	font-weight: bold;
	border: 2px solid gray;
	border-radius:8px;
	padding: 3px 3px;
}
button:hover{
	background-color: gray; 
	color: whitesmoke; 
	border: 1px solid rgb(168, 168, 154);
	box-shadow: 3px 3px 3px gray;
}
</style>
</head>
<body>
	<h1 align="center" style="margin:1.5em" >Drawing View</h1>
	
	<table id="boardDetailTable">
		<tr>
			<th>No</th>
			<td>${ b.boardId }</td>
			<th>Title</th>
			<td>${ b.boardTitle }</td>
		</tr>
		<tr>
			<th>Date</th>
			<td>${ b.boardCreateDate }</td>
			<th>Writer</th>
			<td>${ b.boardWriter }</td>
		</tr>
		<tr>
			<th>Content</th>			
			<% pageContext.setAttribute("newLineChar", "\n"); %>
			<td colspan="3">${ fn:replace(b.boardContent, newLineChar, "<br>") }</td> <!-- 줄바꿈 DB 치환 -->
		</tr>
		<tr>
			<th>Canvas</th>
			<td colspan="3">
				${ b.originalFileName }
			</td>
		</tr>
		<c:url var="bupView" value="bupView.bo">
			<c:param name="boardId" value="${ b.boardId }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<c:url var="bdelete" value="bdelete.bo">
			<c:param name="boardId" value="${ b.boardId }"/>
		</c:url>
		<c:url var="blist" value="boardList">
			<c:param name="page" value="${ page }"/>
		</c:url>
		<tr>
			<td colspan="4" align="center">
				<button onclick="location.href='boardList'">BACK</button>
				<button onclick="location.href='${ bupView }'">EDIT</button>
				<button onclick="location.href='${ bdelete }'">DELETE</button>
			</td>
		</tr>
	</table>
</body>
</html>