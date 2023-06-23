<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/upload.js"></script>
<link rel="stylesheet" href="resources/css/upload.css" media="screen">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${link }" method="post" enctype="multipart/form-data"
		onsubmit="return checkFilevalidation();">
		<table class="uploadTbl">
			<c:if test="${link eq \"upload.needlogin.bundle.do\" }">
				<th>압축 파일 내 존재하는 파일 타입</th>
				<tr>
					<td align="center"><select name="bundle_data_type">
							<option value="jpg">jpg
							<option value="png">png
							<option value="txt">txt
					</select></td>
				</tr>
				<tr id="noticeUpload">
					<td>※ 단일 확장자로 구성된 압축 파일을 업로드 해주세요.</td>
				</tr>
				<tr>
					<td>번들 이름 : <input id="uploadInput" name="bundle_descript"
						placeholder="구성된 이미지 번들의 간단하게 입력해주세요."></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" align="center"><input id="fileBox" type="file"
					name="fileName" placeholder="압축 파일을 선택해주세요. 예).zip"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button class="uploadBtn">
						<c:choose>
							<c:when test="${link eq \"upload.needlogin.bundle.do\" }">
				번들 업로드
				</c:when>
							<c:otherwise>
					이미지 업로드
				</c:otherwise>
						</c:choose>
					</button></td>
			</tr>
		</table>
	</form>
</body>
</html>