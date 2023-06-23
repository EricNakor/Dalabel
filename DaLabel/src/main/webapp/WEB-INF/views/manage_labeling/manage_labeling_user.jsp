<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<%-- 멤버 라벨링 유저 --%>
	<table>
		<tr>
			<th>유저명</th>
			<th>현재상태</th>
		</tr>
		<c:forEach var="mlu" items="${mlu }">
			<tr>
				<td align="center">${mlu.dolabel_user}</td>
				<form action="update.needlogin.user.access">
					<td><input type="hidden" name="dolabel_user"
						value="${mlu.dolabel_user }"> <input type="hidden"
						name="dolabel_project_no" value="${mlu.dolabel_project_no }">
						<select name="dolabel_state" class="selectLevel">
							<option value="0" ${mlu.dolabel_state=='0'?"selected":""}>대기

							
							<option value="1" ${mlu.dolabel_state=='1'?"selected":""}>수락

							
							<option value="2" ${mlu.dolabel_state=='2'?"selected":""}>거절

							
							<option value="3" ${mlu.dolabel_state=='3'?"selected":""}>밴
							
					</select>
						<button>수정</button></td>
				</form>
			</tr>
		</c:forEach>
	</table>
</body>
</html>