<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
			<td><c:if test="${ !empty freeBoard.fOriginalFileName }">
					<a href="/resources/fuploadFiles/${freeBoard.fRenameFileName }"
						download> ${freeBoard.fOriginalFileName } </a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><c:url var="fDelete"
					value="freeBoardDelete.do">
					<c:param name="fId" value="${freeBoard.fId }"></c:param>
				</c:url> <c:url var="fList" value="freeBoardList.do">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url> <c:url var="fUpdate" value="freeBoardUpdateView.do">
					<c:param name="fId" value="${freeBoard.fId }"></c:param>
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url> 
				<c:if test="${freeBoard.fWriter eq sessionScope.loginMember.memberId }">
				<a href="${fUpdate }">수정하기</a> 
				<a href="${fDelete }">삭제하기</a> 
				</c:if>
				<a href="${fList }">목록으로</a></td>
		</tr>
	</table>
	<br>
	<br>

	<!-- 댓글등록 -->
		<table align="center" width="800" border="1" cellspacing="0">
			<tr>
				<td><textarea rows="3" cols="83" id="fbrContent" placeholder="댓글을 입력해주세요."></textarea></td>
				<td>		
				
					<button id="fbrSubmit" style="width:80px;">등록</button>
				</td>
		</table>
	<!-- 댓글 목록 -->
	<table align="center" width="800" border="1" cellspacing="0" id="fbrtb">
		<thead>
			<tr>
				<td colspan="4"><b id="fbrCount"></b></td>
			</tr>
		</thead>
		<tbody id="replyList">
<%-- 			<c:if test="${freeBoardReply.fbrWriter eq sessionScope.loginMember.memberId }">
			
				</c:if> --%>
		</tbody>
	</table>

		<script>
		$(function() {
			getReplyList(); 
			$("#fbrSubmit").on("click", function() {
				//댓글등록
				var fbrContent = $("#fbrContent").val();
				var refFBId = ${freeBoard.fId};
				

				$.ajax({
					url : "addFBReply.do",
					
					type : "post",
					data : {
						"fbrContent" : fbrContent,
						"refFBId" : refFBId
					},
					dataType: "text",
					success : function(data) {
						if (data == "success") {
							$("#fbrContent").val("");
							alert("댓글이 등록되었습니다.");
						} else {
							alert("댓글 등록 실패");
						}
					}
				});
			});
		});
		
		//댓글리스트 불러오기
		function getReplyList(){
			var fId = ${freeBoard.fId};
			$.ajax({
				url : "fbreplyList.do",
				type : "post",
				data : {"fId" : fId},
				dataType : "json",
				success : function(data){
					var htmls = "";
					$("#fbrCount").text("댓글(" + data.length + ")");
					if(data.length > 0){
						$(data).each(function(){
						
							htmls += '<div class="media text-muted pt-3" id="' +this.fbrId + '">';

							htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

							htmls += '<title>Placeholder</title>';

							htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

							htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

							htmls += '</svg>';

							htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

							htmls += '<span class="d-block">';

							htmls += '<strong class="text-gray-dark">' + this.fbrWriter + '</strong>';
						
							htmls += '<span style="padding-left: 7px; font-size: 9pt">';

							htmls += '<a href="javascript:void(0)" onclick="editFBReply(' + this.fbrId + ', \'' + this.fbrWriter + '\', \'' + this.fbrContent + '\' )" style="padding-right:5px">수정</a>';

							htmls += '<a href="javascript:void(0)" onclick="deleteFBReply(' + this.fbrId + ', \'' +this.fbrWriter + '\', \'' + this.refFBId + '\' )" >삭제</a>';

							htmls += '</span>';
							
							htmls += '</span>';

							htmls += this.fbrContent;

							htmls += '</p>';
							

							htmls += '</div>';
							console.log(this.fbrContent);
						});
						
						}else{
						htmls = "등록된 댓글이 없습니다."
					}
					$("#replyList").html(htmls);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function editFBReply(fbrId, fbrWriter, fbrContent){

			var htmls = "";

			htmls += '<div class="media text-muted pt-3" id="'+fbrId+'">';

			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			htmls += '<title>Placeholder</title>';

			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			htmls += '</svg>';

			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			htmls += '<span class="d-block">';

			htmls += '<strong class="text-gray-dark">' + fbrWriter + '</strong>';

			htmls += '<span style="padding-left: 7px; font-size: 9pt">';

			htmls += '<a href="javascript:void(0)" onclick="updateFBReply(' + fbrId + ', \'' + fbrWriter + '\')" style="padding-right:5px">저장</a>';

			htmls += '<a href="javascript:void(0)" onClick="getReplyList()">취소<a>';

			htmls += '</span>';

			htmls += '</span>';		

			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

			htmls += fbrContent;

			htmls += '</textarea>';


			htmls += '</p>';

			htmls += '</div>';


			
			$('#' + fbrId).replaceWith(htmls);

			$('#' + fbrId + ' #editContent').focus();

		}
		
		function updateFBReply(fbrId, fbrWriter){

			var fbrId = fbrId;
			
			var fbrContent = $('#editContent').val();
			
			
			if( '${ sessionScope.loginMember.memberId }' == fbrWriter){
			$.ajax({

				url: "updateReply.do"
				, data : {"fbrContent" : fbrContent, "fbrId" : fbrId}

				, type : "post"

				, success: function(result){
					if(result == "success"){
					alert("댓글이 수정되었습니다.");
	                getReplyList();
					}else{
						alert("작성자가 아닙니다!");
					}
				}
			});
			}
		}
		
		
		function deleteFBReply(fbrId, fbrWriter, refFBId){

			var fbrId = fbrId;
			
			var refFBId = refFBId;

			if( '${ sessionScope.loginMember.memberId }' == fbrWriter){

			$.ajax({

				url: "deleteReply.do"

				, data : {"fbrId" : fbrId, "refFBId" : refFBId}
				, type : "post"
				, success: function(result){
					if(result == "success"){
					alert("댓글이 삭제되었습니다.");
					getReplyList();
					}else{
						alert("댓글 삭제 실패!");
					}
				}
			});
			}else{
				alert("작성자가 아닙니다.");
			}
		}
	</script>
</body>
</html>