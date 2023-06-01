<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/upload.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${link }" method="post" enctype="multipart/form-data" onsubmit="return checkFilevalidation();">
		<input type="file" name="fileName" id="fileInput">
		<c:if test="${link eq 'upload.needlogin.bundle.do' }">
			<input name="bundle_data_type">
		</c:if>
		<button >업로드</button>
	</form>
</body>
</html>