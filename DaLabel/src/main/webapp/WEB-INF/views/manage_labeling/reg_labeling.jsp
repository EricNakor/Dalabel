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
	<form action="reg.labeling.do" method="post">
	<input type="hidden" name="bundle_no" value="${bundle_no }">
		<table>
			<tr>
				<td>라벨링 제목</td>
				<td><input name="project_title"></td>
			</tr>
			<tr>
				<td>파일명 :</td>
				<td>${bundle_name }</td>
				<td><a href="get.my.bundle">변경</a></td>
			</tr>
			<tr>
				<td>가이드라인</td>
				<td><textarea rows="50" cols="50" name="project_guide">
				
					</textarea></td>
			</tr>
			<tr>
				<td>데이터 타입</td>
				<td><select name="bundle_data_type">
						<option value="0">사진 분석</option>
						<option value="1">텍스트 분석</option>
				</select></td>
			</tr>
			<tr>
				<td>라벨링할 데이터</td>
				<td>${labelingData }</td>
			</tr>
			<tr>
				<td><select name="project_how">
						<option value="0">버튼 누르기</option>
						<option value="1">직접 타이핑</option>
						<option value="2">영역 선택</option>
				</select></td>
			</tr>
			<tr>
				<td>공개설정</td>
			</tr>
			<tr>
				<td>
					<button>등록</button>
					<button>취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>