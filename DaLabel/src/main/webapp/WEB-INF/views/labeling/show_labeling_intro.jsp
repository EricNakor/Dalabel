<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	function moveStart(no){
		location.href="doLabeling.needlogin.start?project_no="+no
	}
</script>
</head>
<body class="u-body u-xl-mode">
	<div>${project.project_guide }</div>
	<c:if test="${param.flag eq 1 }">
		<div>
			<button onclick="alertJoin(${project.project_no });">신청하기</button>
		</div>
	</c:if>
	<c:if test="${param.flag eq 2 }">
		<div>
			<button onclick="moveStart(${project.project_no });">시작하기</button>
		</div>
	</c:if>
</body>
</html>