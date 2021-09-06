<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canvas Board</title>
<style type="text/css">

#tb{ 
	border-spacing: 1; 
	border-collapse: collapse; 
	background:white;
	border-radius:6px;
	max-width:800px; 
	width:100%;
	margin:0 auto;
	position: absolute;
    right: 24em;
    top: 14em;
}
thead tr { 
	height:50px;
	background:#FFED86;
	font-size:16px;
}
  
tbody tr { 
	height:48px; 
	border-bottom:1px solid gray ;
	color: gray;
}
tbody tr:hover { 
	color: gray; 
	background-color: #FFED86; 
	text-decoration: none;
}
.writeBtn{
	width: 50px;
	color: gray; 
	background-color: #FFE674; 
	font-weight: bold;
	border: 2px solid rgb(168, 168, 154);
	border-radius:8px;
	box-shadow: 3px 3px 3px rgba(168, 168, 154, 0.726);
	transition-duration:0.3s;
	padding: 3px 3px;
	position: absolute;
    right: 29em;
    top: 13em;
}
.writeBtn:hover{
	background-color: gray; 
	color: whitesmoke; 
	border: 1px solid rgb(168, 168, 154);
	box-shadow: 3px 3px 3px black;
}
.writeBtn:active{
	background-color: gray; 
	color: #FFED86; 
	border: 1px solid rgb(168, 168, 154);
	box-shadow: none;
	margin-left:5px;
	margin-top:5px;
}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: gray; text-decoration: none;}
.pNo:link{color: black; text-decoration: none; font-size:15px;}
.pNo:hover{color: gray; background-color: white; text-align:center; padding:5px 5px 5px 5px; border-radius:20px; font-size:15px; text-decoration: none;}
#pagingTr {
	background-color: rgba(160, 160, 158, 0.726);
	color: black; 
	font-weight: bold;
	height: 30px !important;
	overflow:hidden 
}
.NextBack:hover{
	color:whitesmoke; 
	font-weight: bold;
}
</style>
</head>
<body>
	
	<h1 align="center" style="margin:3em"> - Eunbi's Canvas Board - </h1>
	<h3 align="left" style="margin:-2.5em 18em; color:gray;"> &nbsp; Total : ${ pi.listCount }</h3>
	<button onclick="location.href='boardInsertView';" class="writeBtn">글쓰기</button>
	<table id="tb">
		<thead>
			<tr style="background: #FFE674;">
				<th>No</th>
				<th width="300">TITLE</th>
				<th> WRITER</th>
				<th> DATE</th>
				<th> VIEW</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="bo" items="${ boardList }">
		<tr>
			<td align="center">${ bo.boardId }</td>
			<td align="center">
				<c:url var="bdetail" value="boardDetail">
					<c:param name="boardId" value="${ bo.boardId }"/>
					<c:param name="page" value="${ pi.currentPage }"/>
				</c:url>
				<a id="selectBoard" href="${ bdetail }">${ bo.boardTitle }</a>
			</td>
			<td align="center">${ bo.boardWriter }</td>
			<td align="center">${ bo.boardCreateDate }</td>
			<td align="center">${ bo.boardCount }</td>
		</tr>
		</c:forEach>
		
		<!-- 페이징  -->
		<tr align="center" id="pagingTr">
			<td>
				<!-- back-->
				<c:if test="${ pi.currentPage <= 1 }">
					Back
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="boardList">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><p class="NextBack">Back</p></a> &nbsp;
				</c:if>
			</td>
			<td colspan="3" style="color:black !important; font-size:15px !important; letter-spacing:15px;">	
				<!-- 페이지 번호 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						${ p }
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="Pagination" value="boardList">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a class="pNo" href="${ Pagination }">${ p }</a> 
					</c:if>
				</c:forEach>
			</td>
			<td>	
				<!-- next -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					Next	
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="boardList">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><p class="NextBack">Next</p></a>
				</c:if>
			</td>
		</tr>
		</tbody>
	</table>

</body>
</html>