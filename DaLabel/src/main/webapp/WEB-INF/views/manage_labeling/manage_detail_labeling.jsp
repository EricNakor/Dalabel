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
				<form action="manage.labeling.user">
					<input type="hidden" name="project_no" value="${project.project_no }">
					<button>참가자 관리</button>
				</form>
				<h1>수락 IS UPDATE</h1> #a
				<h1>아직 NO 수락 IS 대기</h1> #w
				<h1>거절</h1> #r
				<h1>킥</h1> #k
			</td>
		</tr>
	</table>
</body>
</html>