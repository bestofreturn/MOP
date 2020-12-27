<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<title>FAQ 상세보기</title>
</head>
<body>
	<h1 align="center">FAQ 상세보기</h1>
	<br>
	<table align="center" cellpadding="10" cellspacing="0" border="1"
		width="500">

		<tr align="center" valign="middle">
			<th colspan="2">${faqBoard.faqId }번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${faqBoard.faqTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${faqBoard.faqWriter }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${faqBoard.faqContent }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<a href="faqBoardUpdateView.do?faqId=${faqBoard.faqId }">수정하기</a> 
			<a href="faqBoardDelete.do?faqId=${faqBoard.faqId}">삭제하기</a>
			<a href="FaQBoardList.do">목록으로</a></td>
		</tr>
	</table>
</body>
</html>