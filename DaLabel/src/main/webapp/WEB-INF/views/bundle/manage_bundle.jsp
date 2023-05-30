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
	<a href="get.myUpload.labeling"> 라벨링 프로젝트 관리</a>
	<table>
		<tr>
			<td><c:forEach var="b" items="${bundles }">
					<table border="1">
						<tr>
							<td><a
								href="reg.labeling.go?bundle_name=${b.bundle_uploaded_filename }&bundle_no=${b.bundle_no }">${b.bundle_uploaded_filename }</a>
							<td>
								<form action="update.file.name">
									<input type="hidden" value="${b.bundle_no }" name="bundle_no">
									<input name="bundle_uploaded_filename">
									<button>파일명 변경</button>
								</form>
							</td>
							<td>
								<form action="delete.bundle?bundle_no=${b.bundle_no }"
									method="post">
									<button>삭제</button>
								</form>
							</td>
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