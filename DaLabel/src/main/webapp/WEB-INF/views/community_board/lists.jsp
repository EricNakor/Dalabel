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
	<input name="token" value="${token }" type="hidden">
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
					<table id="boardSearchArea">
						<tr>
							<td><input name="search" maxlength="20" autocomplete="off">
							<td><button>검색</button></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td align="center">
				<c:if test="${prev}">
					<span>[ <a href="board.page.change?p=${page - 1}">이전</a> ]</span>
				</c:if> 
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
 					<span>
						<c:if test="${page != num}">
							<a href="board.page.change?p=${num}">${num}</a>
						</c:if>    
						<c:if test="${page == num}">
							<b>${num}</b>
						</c:if>
					</span>
				</c:forEach>
				<c:if test="${next}">
					<span>[ <a href="board.page.change?p=${page + 1}">다음</a> ]</span>
				</c:if> 
			
			</td>
		</tr>
	</table>
</body>
</html>