<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/dalabelMove.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
</head>
<body>
	${detailBoard.board_id }
	<br> ${detailBoard.board_category }
	<br> ${detailBoard.board_regist }
	<br> ${detailBoard.board_writer }
	<br> <input value="${detailBoard.board_title }">
	<br> ${detailBoard.board_content }
	<table>
		<c:if test="${sessionScope.loginUserID == detailBoard.board_writer }">
			<tr>
				<td>
					<button>수정</button>
					<button onclick="postDelete(${detailBoard.board_id })">삭제</button>
				</td>
			</tr>
		</c:if>
		<tr>
			<td>제목: 갈매기의 꿈</td>
		</tr>
		<tr>
			<td>글쓴사람 : 조나단 리빙스턴</td>
		</tr>
		<tr>
			<td>글내용은 이렇게</td>
		</tr>
		<tr>
			<!-- <td><jsp:include page="reply.jsp" /></td>  --> <td>댓글</td>
		</tr>
	</table>
</body>
</html>