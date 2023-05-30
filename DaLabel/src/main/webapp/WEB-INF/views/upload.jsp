<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="upload.bundle.do" method="post" enctype="multipart/form-data">
	<input type="file" name="fileName">
	<input name="bundle_data_type">
	<button>업로드</button>
</form>
</body>
</html>