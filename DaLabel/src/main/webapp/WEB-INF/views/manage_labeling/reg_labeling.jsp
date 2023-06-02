<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/labeling.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
</head>
<body>
	<form action="reg.labeling.do" method="post">
		<table>
			<tr>
				<td>라벨링 제목</td>
				<td><input name="bundle_title"></td>
			</tr>
			<tr>
				<td>가이드라인</td>
				<td><textarea rows="50" cols="50" name="bundle_guide" id="bundle_guide">
					
					</textarea></td>
				<script type="text/javascript">
					CKEDITOR.replace('bundle_guide', {
						filebrowserUploadUrl : 'upload.do'
					});
				</script>
			</tr>
			<tr>
				<td>데이터 타입</td>
				<td><select name="bundle_datatype">
						<option value="0">사진 분석</option>
						<option value="1">텍스트 분석</option>
				</select></td>
			</tr>
			<tr>
				<td>라벨링할 데이터</td>
				<td><input type="file" name="bundle_zip"></td>
			</tr>
			<tr>
				<td><select name="bundle_type" id="bundle_type"
					onchange="btnn();">
						<option value="3">라벨링 방법</option>
						<option value="0">버튼 누르기</option>
						<option value="1">직접 타이핑</option>
						<option value="2">영역 선택</option>
				</select></td>
				<td id=btn_add></td>
			</tr>
			<tr>
				<td>공개설정</td>
				<td><select name="bundle_access">
						<option value="1">선택</option>
				</select></td>
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