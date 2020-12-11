<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
</head>
<body>
	<h1 align="center">게시글 상세보기</h1>
	<br>
	<table align="center" cellpadding="10" cellspacing="0" border="1"
		width="500">

		<tr align="center" valign="middle">
			<th colspan="2">${freeBoard.fId }번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${freeBoard.fTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${freeBoard.fWriter }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${freeBoard.fContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
			<c:if test="${ !empty freeBoard.fOriginalFileName }">
					<a href="/resources/fuploadFiles/${freeBoard.fRenameFileName }"download>
					${freeBoard.fOriginalFileName }
					</a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:url var="fDelete" value="freeBoardDelete.do">
			<c:param name="fId" value="${freeBoard.fId }"></c:param>
			</c:url>
			<c:url var="fList" value="freeBoardList.do">
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="fUpdate" value="freeBoardUpdateView.do">
			<c:param name="fId" value="${freeBoard.fId }"></c:param>
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<a href="${fUpdate }">수정하기</a> 
			<a href="${fDelete }">삭제하기</a>
			<a href="${fList }">목록으로</a></td>
		</tr>
	</table>
</body>
</html>