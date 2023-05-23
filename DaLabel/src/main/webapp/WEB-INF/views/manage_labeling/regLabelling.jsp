<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="regLabeling.do" method="post">
		<table>
			<tr>
				<td>
					라벨링 제목
				</td>
				<td>
					<input >
				</td>
			</tr>
			<tr>
				<td>
					라벨링 기간
				</td>
				<td>
					<input>
				</td>
			</tr>
			<tr>
				<td>
					포인트
				</td>
				<td>
					<input>
				</td>
			</tr>
			<tr>
				<td>
					라벨링할 데이터
				</td>
				<td>
					<input type="file">
				</td>
			</tr>
			<tr>
				<td>
					라벨링 분류
				</td>
				<td>
					<select>
						<option>사진 분석</option>
						<option>텍스트 분석</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>