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
			<th colspan="2">${evnetboard.eId }번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${evnetboard.eTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${evnetboard.eWriter }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${evnetboard.eContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
			<c:if test="${ !empty evnetboard.eOriginalfilename }">
					<a href="/resources/euploadFiles/${evnetboard.fRenameFileName }"download>
					${evnetboard.eOriginalfilename }
					</a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:url var="eDelete" value="evnetBoardDelete.do">
			<c:param name="eId" value="${evnetboard.eId }"></c:param>
			</c:url>
			<c:url var="eList" value="eventBoardList.do">
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="eUpdate" value="eventBoardUpdateView.do">
			<c:param name="eId" value="${evnetboard.eId }"></c:param>
			<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<a href="${eUpdate }">수정하기</a> 
			<a href="${eDelete }">삭제하기</a>
			<a href="${eList }">목록으로</a></td>
		</tr>
	</table>
</body>
</html>