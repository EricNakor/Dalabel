<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 리스트</title>
</head>
<body>
	<c:if test="${page != 1 }">
	<div class = "boardL" onclick="boardPageChange(${page - 1});">&lt;</div>
	</c:if>
	<c:if test="${page != pageCount }">
	<div class = "boardR" onclick="boardPageChange(${page + 1});">&gt;</div>
	</c:if>
	<c:forEach var="p" items="${posts }">
				${p.board_id }<br>
				${p.board_category }<br>
				${p.user_id }<br>
				${p.board_title }<br>
				${p.board_regist }<br>
	</c:forEach>
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td>글넘버</td>
						<td>글제목</td>
						<td>글쓴사람</td>
					</tr>

					<tr>
						<td>글넘버1</td>
						<td>글제목1</td>
						<td>글쓴사람1</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>페이지 이동 1 2 3 4 5</td>
			<td>
				<a href="board.post.write">글쓰기</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<form action="boardSearchForm" onsubmit="return boardSearchCheck();">
					<input name="search" maxlength="20"><button>검색</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>