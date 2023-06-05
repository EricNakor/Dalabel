<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/labeling.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="loadProjectAccessLevel(${project.project_access_level})">
	<table border="1">
		<tr>
			<th colspan="2" align="center">프로젝트</th>
		</tr>
		<tr>
			<td>프로젝트명</td>
			<td>${project.project_title }</td>
		</tr>
		<tr>
			<td>참여설정</td>
			<td>
				<form action="update.needlogin.project.accessLevel"
					onsubmit="return changeAccessLevel();">
					<input type="hidden" value="${project.project_no }"
						name="project_no"><input type="checkbox" value="1"
						class="access" onchange="selectAll();">전체 <input
						type="checkbox" value="2" class="access">숙련자 <input
						type="checkbox" value="4" class="access">이메일 인증된 사람 <input
						type="checkbox" value="8" class="access">요청 후 수락 <input
						type="radio" value="0" class="access" name="andor">or <input
						type="radio" value="16" class="access" name="andor">and <input
						name="project_access_level" type="hidden"
						id="project_access_level">
					<button>수정</button>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="manage.labeling.user">
					<input type="hidden" name="project_no"
						value="${project.project_no }">
					<button>참가자 관리</button>
				</form>
			</td>
		</tr>
	</table>
	${project.project_guide }
</body>
</html>