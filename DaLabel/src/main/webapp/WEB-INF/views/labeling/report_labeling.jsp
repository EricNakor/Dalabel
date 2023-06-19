<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form  name="writeReportForm" action="doLabeling.needlogin.report.do" method="post">
		<input name="data_name" value="${currentDataName }" type="hidden">
		<input name="data_where" value="${currentDatawhere }" type="hidden">
		<input name="data_activation" value="${currentDataActivation }" type="hidden">
		<table>
			<tr>
				<td>현 라벨링 이미지</td>
			</tr>
			<tr>
				<td>
					<textarea rows="1200" cols="500"placeholder="신고 내용을 입력해주세요"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button>신고하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>