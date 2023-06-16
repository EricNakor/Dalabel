<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
</head>
<body>
	<form name="writePostForm" onsubmit="return writePostCheck();" action="board.post.write.do" method="post" >
		<table id="writePost">
			<tr>
				<td align="center">
					<select name="board_category">
						<option value="notice"> 공지
						<option value="board"> 게시판
					</select> 
				</td>
			</tr>
			<tr>
				<td align="center">
					<input name="board_title" maxlength="50" placeholder="제목을 입력해주세요." autocomplete="off" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td align="center">
					<textarea name="board_content" maxlength="500" placeholder="내용을 입력해주세요." autocomplete="off"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					<button>등록하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>