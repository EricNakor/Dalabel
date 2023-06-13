<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function alertJoin(no) {
		alert("신청되었습니다")
		location.href = "doLabeling.needlogin.askjoin?project_no=" + no
	}
</script>
</head>
<body>
	<div>${project.project_guide }</div>
	<div>
		<button onclick="alertJoin(${project.project_no });">신청하기</button>
	</div>
</body>
</html>