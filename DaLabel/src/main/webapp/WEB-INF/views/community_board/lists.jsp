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
	<!--<c:if test="${page != 1 }">
	<div class = "boardL" onclick="boardPageChange(${page - 1});">&lt;</div>
	</c:if>
	<c:if test="${page != pageCount }">
	<div class = "boardR" onclick="boardPageChange(${page + 1});">&gt;</div>
	</c:if>-->
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td>글넘버</td>
						<td>머릿말</td>
						<td>글제목</td>
						<td>글쓴사람</td>
						<td>작성일</td>
					</tr>

					<c:forEach var="p" items="${posts }">
						<tr>
							<td><a href="board.get.detail?board_id=${p.board_id }">${p.board_id }</a></td>
							<td>${p.board_category }</td>
							<td>${p.board_title }</td>
							<td>${p.board_writer }</td>
							<td>${p.board_regist }</td>
						</tr>
					</c:forEach>
				</table>
		</td>
		</tr>
		<tr>
			<td>페이지 이동 1 2 3 4 5</td>
			<td><a href="board.post.write.go">글쓰기</a></td>
		</tr>
		<tr>
			<td align="center">
				<form name="boardSearchForm" onsubmit="return boardSearchCheck();">
					<input name="search" maxlength="20">
					<button>검색</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>