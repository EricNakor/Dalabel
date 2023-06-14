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
	<form action="board.post.update.go?board_id=${detailBoard.board_id }">
		<input type="hidden" value="${detailBoard.board_id }" name="board_id">
		<table>
			<tr>
				<td>말 머 리: ${detailBoard.board_category }</td>
			</tr>
			<tr>
				<td>등 록 일: ${detailBoard.board_regist }</td>
			</tr>
			<tr>
				<td>제 목: ${detailBoard.board_title }</td>
			</tr>
			<tr>
				<td>글쓴사람 : ${detailBoard.board_writer }</td>
			</tr>
			<tr>
				<td>글 내 용 : ${detailBoard.board_content }</td>
			</tr>
			<c:if test="${sessionScope.loginUserID == detailBoard.board_writer }">
				<tr>
					<td>
						<button>수정</button>
						<button type="button"
							onclick="postDelete(${detailBoard.board_id })">삭제</button>
					</td>
				</tr>
			</c:if>
		</table>
	</form>
	--------------------------------
	<table>
		<tr>
			 <td><jsp:include page="reply.jsp" /></td>
		</tr>
	</table>
</body>
</html>