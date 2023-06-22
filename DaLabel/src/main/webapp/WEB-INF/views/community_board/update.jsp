<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/dalabelMove.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
<link rel="stylesheet" href="resources/css/nicepage.css" media="screen">
<link rel="stylesheet" href="resources/css/boardDetail.css" media="screen">
<script class="u-script" type="text/javascript"
	src="jquery-1.9.1.min.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js"
	defer=""></script>
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">




<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"url": "/",
		"logo": "images/default-logo.png"
}</script>
</head>

<body class="u-body u-xl-mode" data-lang="en">
	<form name="writePostForm" onsubmit="return writePostCheck();" action="board.needlogin.post.update.do" method="post">
		<section class="u-clearfix u-section-1" id="sec-b5df">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
					<table class="u-table-entity u-table-entity-1" id="writePost">
						<colgroup>
							<col width="10.53%">
              				<col width="11.58%">
              				<col width="53.61%">
            				<col width="11.88%">
             				<col width="12.4%">
						</colgroup>
						<tbody class="u-table-body">
							<tr style="height: 80px;">
								<td
									 class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1" align="center">제 목</td>
								<td class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2" colspan="4">[${detailBoard.board_category }]&nbsp;&nbsp;
								<input type="hidden" name="board_id" value=${detailBoard.board_id }>
								<input name="board_title" value=${detailBoard.board_title } maxlength="50" placeholder="제목을 입력해주세요." autocomplete="off" autofocus="autofocus"  style="width: 700px;"></td>
							</tr>
							<tr style="height: 50px;">
								<td
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-3 u-table-cell u-table-cell-6" align="center">글쓴사람</td>
								<td class="u-border-2 u-border-white u-palette-1-light-3 u-table-cell u-table-cell-7">${detailBoard.board_writer }</td>
								<td class="u-border-2 u-border-white u-palette-1-light-3 u-table-cell u-table-cell-7"></td>
								<td class="u-border-2 u-border-white u-palette-1-light-3 u-table-cell u-table-cell-8"
									align="center">등 록 일<br>수 정 일</td>
								<td
									class="u-border-2 u-border-white u-palette-1-light-3 u-table-cell u-table-cell-10"><fmt:formatDate
										value="${detailBoard.board_regist }" type="date"
										pattern="yy.MM.dd HH:mm" /><br><fmt:formatDate
										value="${detailBoard.board_edit }" type="date"
										pattern="yy.MM.dd HH:mm" /></td>
							</tr>
							<tr style="height: 223px;">
								<td
									class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"
									colspan="5"><textarea name="board_content" maxlength="500" placeholder="내용을 입력해주세요." autocomplete="off" class="contentTxt">${detailBoard.board_content }
					</textarea></td>
							</tr>
							<tr style="height: 65px;"><td colspan="5" align="center" class="u-table-cell">
					<button class="boardBtn">수정하기</button>
						</td></tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</form>
</body>
</html>