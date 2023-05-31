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
	<table>
		<tr>
			<th>데이터 이름</th>
			<th>현재상태</th>
		</tr>
		<c:forEach var="d" items="${datas}">
			<tr>
				<td>
					<form
						action="delete.data?data_name=${d.data_name }">
						<input type="hidden" value="${d.data_where }" name="bundle_no">
						<input readonly="readonly" value="${d.data_name }"
							name="data_name">
						<c:if test="${d.data_activation == 1 }">활성화</c:if>
						<c:if test="${d.data_activation == 0 }">비활성화</c:if>
						<button>비활성화</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>