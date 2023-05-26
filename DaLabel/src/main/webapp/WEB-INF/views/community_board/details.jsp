<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
</head>
<body>
	<c:forEach var="p" items="${posts }">
				${p.board_id }<br>
				${p.board_category }<br>
				${p.board_regist }<br>
				${p.user_id }<br>
				${p.board_title }<br>
				${p.board_content }<br>
				${p.board_file }<br>
	</c:forEach>
		<table>
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