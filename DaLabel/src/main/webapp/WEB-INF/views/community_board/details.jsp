<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/dalabelMove.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
</head>
<body>
	<table>
		<c:forEach var="p" items="${posts }">
				${p.board_id }<br>
				${p.board_category }<br>
				${p.board_regist }<br>
				${p.user_id }<br>
				${p.board_title }<br>
				${p.board_content }<br>
				${p.board_file }<br>
		</c:forEach>
		<c:if test="${sessionScope.loginMember.user_id == p.user_id }">
			<tr>
				<td>
					<button>수정</button>
					<button onclick="postDelete(${p.board_id })">삭제</button>
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
			<td><jsp:include page="reply.jsp" /></td>
		</tr>
	</table>
</body>
</html>