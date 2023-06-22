<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<div>${bundle.bundle_folder_name }</div>
	<table>
		<tr>
			<td>
				<form action="get.needlogin.bundle.data">
					<input name="data_where" type="hidden" value="${data.data_where }">
					<input name="bundle_uploaded_filename" type="hidden"
						value="${bundle.bundle_uploaded_filename }"> <input
						name="bundle_folder_name" type="hidden"
						value="${bundle.bundle_folder_name }"> <input
						type="hidden" value="${data.data_activation }"> <input
						name="data_name">
					<button>검색</button>
				</form>
			</td>
		</tr>
		<tr>
			<td><c:choose>
					<c:when test="${data_name != null && data_activation == 49}">
						<c:set var="folderName" value="${bundle.bundle_uploaded_filename}" />
						<c:set var="length" value="${fn:length(folderName)}" />
						<img
							src="resources/data/${sessionScope.loginUserID }/${fn:substring(folderName, 0, length-4)}/${data_name }"
							alt="없는(비활성화) 파일입니다.">
						<br>
						<form action="delete.needlogin.data?">
							<input name="data_where" type="hidden"
								value="${data.data_where }"> <input
								name="bundle_folder_name" type="hidden"
								value="${bundle.bundle_folder_name }"> <input
								name="bundle_uploaded_filename" type="hidden"
								value="${bundle.bundle_uploaded_filename }"> <input
								type="hidden" value="${data_name }" name="data_name">
							<button>비활성화</button>
						</form>
					</c:when>
					<c:when test="${data_activation == 48 }">
						비활성화 된 파일입니다.
					</c:when>
				</c:choose></td>
		</tr>
	</table>
	<table id="reportedDataTable">
		<tr>
			<td><button
					onclick="getReportedData(${bundle.bundle_no}, ${sessionScope.loginUserID })">신고된
					데이터 보기</button></td>
		</tr>
	</table>
</body>
</html>