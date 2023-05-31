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
	<table border="1">
		<tr>
			<th colspan="2" align="center">프로젝트</th>
		</tr>
		<tr>
			<td>프로젝트명</td>
			<td>${project.project_title }</td>
		</tr>
		<tr>
			<td>공개설정</td>
			<td>
				<form action="update.needlogin.project.accessLevel">
					<input type="hidden" value="${project.project_no }" name="project_no">
					<input value="${project.project_access_level }" name="project_access_level">
					<button>수정</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>