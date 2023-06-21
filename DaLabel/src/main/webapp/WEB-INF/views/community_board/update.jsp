<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시글 수정</title>
</head>
<body>
	<form name="writePostForm" onsubmit="return writePostCheck();"
		action="board.needlogin.post.update.do" method="post">
		<table id="writePost">
			<tr>
				<td align="center"><input type="hidden" name="board_id"
					value=${detailBoard.board_id }> <input name="board_title"
					value=${detailBoard.board_title } maxlength="50"
					placeholder="제목을 입력해주세요." autocomplete="off" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td align="center"><textarea name="board_content"
						maxlength="500" placeholder="내용을 입력해주세요." autocomplete="off">
						${detailBoard.board_content }
					</textarea></td>
			</tr>
			<tr>
				<td align="center">
					<button>수정하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>