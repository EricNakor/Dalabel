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
	<form action="${link }" method="post" enctype="multipart/form-data"
		onsubmit="return checkFilevalidation();">
		<table>
			<c:if test="${link eq \"upload.needlogin.bundle.do\" }">
				<tr>
					<td>파일 타입</td>
					<td><select name="bundle_data_type">
							<option value="jpg">jpg
							<option value="png">png
							<option value="txt">txt
					</select></td>
				</tr>
				<tr>
					<td>간단한 설명</td>
					<td><input name="bundle_descript"></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><input type="file" placeholder="압축파일을 넣어주세요." name="fileName"
					id="fileInput"></td>
			</tr>
			<tr>
				<td colspan="2"><button>업로드</button></td>
			</tr>
		</table>
	</form>
</body>
</html>