<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>FAQ 리스트</title>
<style type="text/css">
 	th{
 		color:white
 	}
	html, body {
	    margin: 0;
	    height: 100%;
	    overflow: hidden;
	}
</style>
</head>
<body>
	<h1 align="center">FAQ 목록</h1>
	<div class="container">
		<table class="table table-bordered" align="center" border="0"
			cellspacing="0" width="700">
			<tr style ="background-color: black">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>

			<c:forEach items="${faqList }" var="faqBoard">
				<tr>
					<td style="background-color:gray">${faqBoard.faqId }</td>
					<td><c:url var="faqDetail" value="faqBoardDetail.do">
							<c:param name="faqId" value="${faqBoard.faqId }"></c:param>
						</c:url> <a href="${faqDetail}">${faqBoard.faqTitle }</a></td>
					<td>${faqBoard.faqWriter }</td>
					<td>${faqBoard.faqWriteDate }</td>
				</tr>
			</c:forEach>
		</table>
		
		
		<button type="button" class="btn btn-default pull-right"
			onclick="location.href='FaQBoardWriteView.do'">글쓰기</button>
  		<nav aria-label="Page navigation example" class="text-center">
		  	<ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  	</ul>
		</nav>
</div>
<script src = "js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>