<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 멤버 라벨링 유저 --%>
	<c:forEach var="mlu" items="${mlu }">
		<table>
			<tr>
				<td><h1>${mlu.dolabel_user}</h1></td>
				<td><form action="update.user.access">
						<input type="hidden" name="dolabel_user" value="${mlu.dolabel_user }">
						<input type="hidden" name="dolabel_project_no" value="${mlu.dolabel_project_no }">
						<input type="hidden" name="dolabel_state" value="1">
						<button>수락</button>
					</form></td>
			</tr>
			<tr>
				<td><form action="update.user.access">
						<input type="hidden" name="dolabel_user" value="${mlu.dolabel_user }">
						<input type="hidden" name="dolabel_project_no" value="${mlu.dolabel_project_no }">
						<input type="hidden" name="dolabel_state" value="2">
						<button>거절</button>
					</form></td>
			</tr>
			<tr>
				<td><form action="update.user.access">
						<input type="hidden" name="dolabel_user" value="${mlu.dolabel_user }">
						<input type="hidden" name="dolabel_project_no" value="${mlu.dolabel_project_no }">
						<input type="hidden" name="dolabel_state" value="3">
						<button>킥</button>
					</form></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>