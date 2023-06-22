<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body class="u-body u-xl-mode" data-lang="en">
	<form name="writePostForm" onsubmit="return writePostCheck();"
		action="board.needlogin.post.write.do" method="post">
		<input name="token" value="${token }" type="hidden">
		<section class="u-clearfix u-section-1" id="sec-b5df">
			<div class="u-clearfix u-sheet u-sheet-1">
				<div class="u-expanded-width u-table u-table-responsive u-table-1">
					<table id="writePost" class="u-table-entity u-table-entity-1">
						<colgroup>
							<col width="10.53%">
							<col width="11.58%">
							<col width="10.61%">
							<col width="45.88%">
							<col width="21.4%">
						</colgroup>
						<tbody class="u-table-body">
							<tr style="height: 80px;">
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">말
									머 리</td>
								<td align="center"
									class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2"><select
									name="board_category">
										<option value="notice">공지
										<option value="board">게시판
										<option value="qna">문의
								</select></td>
								<td
									class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-3"
									align="center">제 목</td>
								<td colspan="2"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-4"><input
									name="board_title" id="board_title" maxlength="50" placeholder="제목을 입력해주세요."
									autocomplete="off" autofocus="autofocus" style="width: 700px;" onsubmit="writePostCheck();"></td>
							</tr>
							<tr style="height: 223px;">
								<td
									class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"
									colspan="5"><textarea name="board_content" maxlength="500"
										placeholder="내용을 입력해주세요." autocomplete="off"
										class="contentTxt" onsubmit="writePostCheck();"></textarea> <script type="text/javascript">
											CKEDITOR
													.replace(
															'board_content',
															{
																filebrowserUploadUrl : 'upload.do',
																height : '400px'
															});

											function submitForm() {
												if (ckeditorValidate()) {
													// Submit the form
												}
											}
										</script></td>
							</tr>
							<tr style="height: 65px;">
								<td colspan="5" align="center" class="u-table-cell">
									<button class="boardBtn">등록하기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</form>
</body>
</html>