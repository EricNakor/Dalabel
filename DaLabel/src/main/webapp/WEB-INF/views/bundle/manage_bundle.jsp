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
	<a href="get.myUpload.labeling">라벨링 프로젝트 관리</a>
	<table>
		<tr>
			<td><c:forEach var="b" items="${bundles }">
					<table border="1">
						<tr>
							<td><a href="reg.labeling.go">${b.bundle_uploaded_filename }</a></td>
						</tr>
					</table>
				</c:forEach></td>
		</tr>
		<tr>
			<td><c:forEach var="p" begin="1" end="${bundlePageCount }">
						<a href="bundle.page.change?page=${p }">${p }</a>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>