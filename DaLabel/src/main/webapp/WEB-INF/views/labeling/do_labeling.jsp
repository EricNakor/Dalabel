<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/dolabeling.js"></script>
</head>
<body>
	<!-- 방법1 onload 쓰던가 방법2 AJAX로 해야한다 -->
	<div>
		<img id="showImg"> <br>
		<c:choose>
			<c:when test="${projectInfo.어쩌구 == 어쩌구면 }">

			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>