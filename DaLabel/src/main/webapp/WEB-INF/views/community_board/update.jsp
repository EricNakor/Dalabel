<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
<script class="u-script" type="text/javascript"
	src="resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시글 수정</title>
</head>
<body>
	<a href="/dalabel/">홈으로</a>
	<a href="/dalabel/board.go">목록으로</a>
	<form name="writePostForm" onsubmit="return writePostCheck();"
		action="board.post.update.do" method="post">
		<table id="writePost">
			<tr>
				<td align="center"><input type="hidden" name="board_id"
					value=${detailBoard.board_id }> <input name="board_title"
					value=${detailBoard.board_title } maxlength="50"
					placeholder="제목을 입력해주세요." autocomplete="off" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td align="center"><textarea id="board_content"
						name="board_content" maxlength="500" placeholder="내용을 입력해주세요."
						autocomplete="off" id="board_content">${detailBoard.board_content }</textarea>
					<script type="text/javascript">
						CKEDITOR.replace('board_content', {
							filebrowserUploadUrl : 'upload.do',
							height : '400px',
						});

						function submitForm() {
							if (ckeditorValidate()) {
								// Submit the form
							}
						}
					</script></td>
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