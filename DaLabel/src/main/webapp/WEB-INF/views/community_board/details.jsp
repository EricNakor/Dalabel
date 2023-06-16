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
</head>
<body>
	${detailBoard.board_id }
	<br> ${detailBoard.board_category }
	<br> ${detailBoard.board_regist }
	<br> ${detailBoard.board_writer }
	<br> ${detailBoard.board_title }
	<br> ${detailBoard.board_content }

	<table border=1>
		<tr>
			<td>제목 : <input value="${detailBoard.board_title }"></td>
		</tr>
		<tr>
			<td>글쓴사람 : <input value="${detailBoard.board_writer }"></td>
		</tr>
		<tr>
			<td><textarea rows="" cols="">${detailBoard.board_content }</textarea>
		</tr>
		<c:if test="${sessionScope.loginUserID == detailBoard.board_writer }">
			<tr>
				<td>
					<button>수정</button>
					<button onclick="postDelete(${detailBoard.board_id })">삭제</button>
				</td>
			</tr>
		</c:if>
		<tr>
			<td>
				<table>
					<tr>
						<td class="commentTd">
							<form action="board.comment.write" name="boardCommentWriteForm"
								onsubmit="">
								<!-- js 설정 후 -->
								<span class="commentWriter">${sessionScope.loginUserID }&nbsp;</span>
								<input name="token" value="${token}" type="hidden"> <input
									name="inherit_post" value="${detailBoard.board_id}"
									type="hidden"> <input name="comment_content"
									maxlength="500" class="commentContent">
								<button>작성</button>
							</form>
						</td>
					</tr>
					<tr>
						<td><c:forEach var="r" items="${comment }">
								<form action="board.comment.update" name="commentForm"
									id="commentForm">
									<p>
										<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;</span>
										<input name="comment_id" value="${r.comment_id}" type="hidden">
										<input name="inherit_post" value="${detailBoard.board_id}"
											type="hidden"> <input name="comment_content"
											value="${r.comment_content }"> -
										<fmt:formatDate value="${r.comment_regist }" type="date"
											dateStyle="short" />
										<c:if test="${sessionScope.loginUserID == r.comment_writer }">
											<button type="submit">수정</button>
											<button type="button"
												onclick="commentDelete(${r.comment_id }, ${detailBoard.board_id })">삭제</button>
										</c:if>

										<button onclick="writeReply(${r.comment_id});" type="button">대댓글
											쓰기</button>
									</p>
									<table id="${r.comment_id }">
										<tr>
											<td><input name="inherit_comment"
												value="${r.comment_id}" id="${r.comment_id}" type="hidden"> <input
												name="token" value="${token}" type="hidden"></td>
										</tr>

									</table>

								</form>
							</c:forEach></td>
					</tr>

				</table>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function writeReply(idd) {
		var id = "${sessionScope.loginUserID }";
		var i = $("<input>").attr({
			id : "reply",
			name : "reply_content"
		});
		var b = $("<button></button>").attr({
			id : "writeReply",
			onclick : "addReply(${r.comment_id});"
		}).text("작성");
		var c = $("<input>").attr({
			name : "cr_parent_id",
			value : "${r.comment_id}",
			type : "hidden"
		});
		var ccTd = $("<td></td>").html(cc);
		var idTd = $("<td></td>").html(id);
		var iTd = $("<td></td>").html(i);
		var bTd = $("<td></td>").html(b);
		var tr = $("<tr></tr>").append(ccTd, idTd, iTd, bTd);

		$("#" + idd).append(tr);
	}
	
	function addReply(ccc) {
		var reply = {
			comment_id : "${r.comment_id}",
			cr_depth : cr_depth,
			cr_parent_id : "",
			
		} 
		
		$.ajax({
			url : "board.reply.write",
			data : $("#commentForm").serialize(),
			success : function(){
				location.href = "board.reply.write";
				
			
				
			}
			
		});
	}
	
</script>
</html>