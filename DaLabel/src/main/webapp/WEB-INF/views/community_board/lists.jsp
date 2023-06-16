<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 리스트</title>
<script type="text/javascript" src="resources/js/dalabelMove.js"></script>
<script type="text/javascript" src="resources/js/dalabelCheck.js"></script>
</head>
<body>
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
							<td><a href="board.get.detail?board_id=${p.board_id }">${p.board_id }</a>
							</td>
							<td>${p.board_category }</td>
							<td>${p.board_title }</td>
							<td>${p.board_writer }</td>
							<td><fmt:formatDate value="${p.board_regist }" type="date"
									dateStyle="short" /></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
			<td><a href="board.post.write.go">글쓰기</a></td>
		</tr>
		<tr>
			<td align="center">
				<form action="board.search" name="boardSearchForm"
					onsubmit="return boardSearchCheck();">
					<table id="searchArea">
						<tr>
							<td><input name="search" maxlength="20">
								<button>검색</button></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<c:if test="${page != 1 }">
		<div class="boardL" onclick="boardPageChange(${page - 1});">&lt;</div>
	</c:if>
	<c:forEach var="p" begin="1" end="${pageCount }">
		<a href="board.page.change?p=${p }">${p }</a>
	</c:forEach>
	<c:if test="${page != pageCount }">
		<div class="boardR" onclick="boardPageChange(${page + 1});">&gt;</div>
	</c:if>
</body>
</html>