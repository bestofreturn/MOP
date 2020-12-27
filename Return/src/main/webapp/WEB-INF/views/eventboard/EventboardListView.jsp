 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://kit.fontawesome.com/a332c1cec6.js" crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>자유게시판 리스트</title>
<style>
.btn-form{position: relative;}
#listBtn{position: absolute; right: 0; top: 0;}
#writeBtn{position: absolute; right: 50px; top: 0;}
</style>
</head>
<body>
	<h1 align="center">이벤트 게시판 목록</h1>
	<div class="container">
	<div class="row justify-content-md-center">
		<div class="col-md-12 d-md-block b-2">
			<div class="d-flex">
			  <div class="mr-auto">
			  </div>
			  <nav class="main-content-nav pb-1">
			  </nav>
			</div>
			<div class="table-responsive-md bg-white">
				<table class="table table-hover">
				  <thead class="thead-dark">
					<tr class="text-truncate">
					  <th scope="col">번호</th>
					  <th scope="col">제목</th>
					  <th scope="col">작성자</th>
					  <th scope="col">날짜</th>
					  <th scope="col">조회수</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach items="${eList }" var="eventboard">
						<tr>
							<td>${eventboard.eId }</td>
							<td><c:url var="eDetail" value="eventBoardDetail.do">
									<c:param name="eId" value="${eventboard.eId }"></c:param>
									<c:param name="page" value="${pi.currentPage }"></c:param>
								</c:url> <a href="${eDetail}">${eventboard.eTitle }</a></td>
							<td>${eventboard.eWriter }</td>
							<td>${eventboard.eCreateDate }</td>
							<td>${eventboard.eCount }</td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
			<div class="text-center btn-form">
				<form action="submit" method="POST" class="form-inline">
				    <input type="radio" id="customRadioInline1" name="eTitle" class="custom-control-input" checked>
				    <label class="custom-control-label" for="customRadioInline1">제목</label>
				    <input type="radio" id="customRadioInline2" name="eContent" class="custom-control-input" value='c'>
				    <label class="custom-control-label" for="customRadioInline2">내용</label>
					<input type="text" name="q" class="form-control" placeholder="입력" required/>
					<button class="btn btn-primary mt-1" type="submit"><i class="fa fa-search"></i></button>
				</form>
				<button type="button" class="btn btn-secondary btn-sm" id="listBtn" onclick="location.href = 'eventBoardList.do';">목록</button>
				<button type="button" class="btn btn-secondary btn-sm" id="writeBtn" onclick="location.href = 'EventBoardWriteView.do';">쓰기</button>
			</div>
			<div class="row justify-content-center">
				<div class="us-center us-padding">
					<div class="us-bar">
						<nav aria-label="Page navigation example" class="text-center">
						  	<ul class="pagination">
						  		<c:if test="${pi.currentPage > 1 }">
									<c:url var="first" value="eventBoardList.do">
										<c:param name="page" value="${1}"></c:param>
									</c:url>
									<li class="page-item"><a class="page-link" href="${first }"><<</a>&nbsp;</li>
								</c:if>
							    <c:if test="${pi.currentPage > 5 }">
									<c:url var="before" value="eventBoardList.do">
										<c:param name="page" value="${pi.startPage-1 }"></c:param>
									</c:url>
									<li class="page-item"><a class="page-link" href="${before }"><</a>&nbsp;</li>
								</c:if>
							    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<li class="page-item"><a style="background: #eee">${p }</a>&nbsp;</li>
									</c:if>
									<c:url var="pagination" value="eventBoardList.do">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p ne pi.currentPage }">
										<li class="page-item"><a class="page-link" href="${pagination }">${p }</a>&nbsp;</li>
									</c:if>
								</c:forEach>
							    <c:if test="${pi.endPage ne pi.maxPage }">
									<c:url var="after" value="eventBoardList.do">
										<c:param name="page" value="${pi.endPage+1 }"></c:param>
									</c:url>
									<li class="page-item"><a class="page-link" href="${after }">></a>&nbsp;</li>
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="eventBoardList.do">
										<c:param name="page" value="${pi.maxPage }"></c:param>
									</c:url>
									<li class="page-item"><a class="page-link" href="${after }">>></a>&nbsp;</li>
								</c:if>
						  	</ul>
						</nav>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</body>
</html>