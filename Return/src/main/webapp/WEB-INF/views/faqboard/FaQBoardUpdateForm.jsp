<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">
<title>FAQ게시판 수정</title>
</head>
<body>
	<h1 align="center">${faqBoard.faqId }번게시글수정</h1>
	<br>
	<form action="faqBoardUpdate.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="faqId" value="${faqBoard.faqId }"> 
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="faqTitle"
					value="${faqBoard.faqTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text"  readonly name="faqWriter"
					value="${faqBoard.faqWriter }" ></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="faqContent">${faqBoard.faqContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">&nbsp;
					<c:url var="faqList" value="FaQBoardList.do">
					</c:url> <a href="${faqList }">목록으로</a> <a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>