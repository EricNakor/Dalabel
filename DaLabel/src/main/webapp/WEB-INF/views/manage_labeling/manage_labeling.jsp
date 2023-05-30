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
	<a href="get.my.bundle">내 데이터 관리</a>
	<table>
		<tr>
			<td><c:forEach var="p" items="${projects }">
					<table border="1">
						<tr>
							<td><a
								href="detail.myproject.go?project_no=${p.project_no }">${p.project_title }</a>
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