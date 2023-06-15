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
	<div>${bundle_folder_name }</div>
	<table>
		<tr>
			<td>
				<form action="get.needlogin.bundle.data">
					<input name="data_where" type="hidden" value="${data_where }">
					<input name="bundle_folder_name" type="hidden"
						value="${bundle_folder_name }"> <input name="data_name">
					<button>검색</button>
				</form>
				<form action="update.needlogin.folder.name">
					<input type="hidden" value="${data_where }" name="bundle_no">
					<input name="bundle_folder_name">
					<button>폴더명 수정</button>
				</form>
			</td>
		</tr>
		<tr>
			<td><c:if test="${dataName != null }">
					<img
						src="resources/data/${sessionScope.loginUserID }/${bundle_folder_name}/${dataName }"
						alt="${dataName }">
					<br>
					${dataName }
					<form action="delete.needlogin.data?">
						<input name="data_where" type="hidden" value="${data_where }">
						<input name="bundle_folder_name" type="hidden"
							value="${bundle_folder_name }"> <input type="hidden"
							value="${dataName }" name="data_name">
						<button>비활성화</button>
					</form>
				</c:if></td>
		</tr>
	</table>
	<table id="reportedDataTable">
		<tr>
			<td><button
					onclick="getReportedData(${bundle_no}, ${sessionScope.loginUserID })">신고된
					데이터 보기</button></td>
		</tr>
	</table>
</body>
</html>