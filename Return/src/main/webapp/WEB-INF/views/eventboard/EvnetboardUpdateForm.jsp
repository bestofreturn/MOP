<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게시판 수정</title>
</head>
<body>
	<h1 align="center">${eventboard.eId }번게시글수정</h1>
	<br>
	<form action="eventBoardUpdate.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }"> 
		<input type="hidden" name="fId" value="${eventboard.eId }"> 
		<input type="hidden" name="eOriginalFilename" value="${eventboard.eOriginalFileName }">
     	
     	 
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="eTitle"
					value="${eventboard.eTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="eWriter"
					value="${eventboard.eWriter }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="eContent">${eventboard.eContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile"> <c:if
						test="${ !empty eventboard.eOriginalFilename }">
						<br>현재 업로드한 파일: <a href="/resources/euploadFiles/${eventboard.eOriginalFilename }" download>
							${eventboard.eOriginalFilename }"</a>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">&nbsp;
					<c:url var="fList" value="eventBoardList.do">
						<c:param name="page" value="${currentPage }"></c:param>
					</c:url> <a href="${eList }">목록으로</a> <a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>