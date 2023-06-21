<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/dalabelMove.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="resources/js/dalabelMove.js"></script>
<script type="text/javascript" src="resources/js/move.js"></script>
<meta charset="UTF-8">
<title>다라벨 게시판</title>
</head>
<body>
	<hr>
	<form
		action="board.needlogin.post.update.go?board_id=${detailBoard.board_id }">
		<input type="hidden" value="${detailBoard.board_id }" name="board_id">
		<button type="button" onclick="goLists();">목록으로</button>
		<table>
			<tr>
				<td>말 머 리: ${detailBoard.board_category }</td>
			</tr>
			<tr>
				<td>등 록 일: ${detailBoard.board_regist }</td>
			</tr>
			<tr>
				<td>제 목: ${detailBoard.board_title }</td>
			</tr>
			<tr>
				<td>글쓴사람 : ${detailBoard.board_writer }</td>
			</tr>
			<tr>
				<td>글 내 용 : ${detailBoard.board_content }</td>
			</tr>
			<c:if test="${sessionScope.loginUserID == detailBoard.board_writer }">
				<tr>
					<td>
						<button>수정</button>
						<button type="button"
							onclick="postDelete(${detailBoard.board_id })">삭제</button>
					</td>
				</tr>
			</c:if>
		</table>
	</form>
	--------------------------------
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td>
						<c:forEach var="r" items="${comment }">
						<div id="orgComment${r.comment_id }">
								
									<p>
										<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;</span>
										<input name="comment_id" value="${r.comment_id}" type="hidden">
										<input name="inherit_post" value="${detailBoard.board_id}"
											type="hidden">
										${r.comment_content }
											 -
										<span>[ <fmt:formatDate
															value="${r.comment_edit }" type="date"
															pattern="yy.MM.dd HH:mm" /> ]
														</span> 
										<c:if test="${sessionScope.loginUserID == r.comment_writer }">
											<button type="button" onclick="updateComm(${r.comment_id});">수정</button>
											<button type="button"
												onclick="commentDelete(${r.comment_id }, ${detailBoard.board_id })">삭제</button>
										</c:if>
										<button onclick="writeReply(${r.comment_id}, ${token});"
											type="button" id="wr" value="0">대댓글</button>
									</p>
						</div>
						<div id="updComment${r.comment_id }" style="display: none">
								<form action="board.comment.update" name="commentForm"
									id="commentForm${r.comment_id }" method="post">
									<p>
										<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;</span>
										<input name="comment_id" value="${r.comment_id}" type="hidden">
										<input name="inherit_post" value="${detailBoard.board_id}"
											type="hidden">
										<textarea name="comment_content">${r.comment_content }</textarea>
											 -
										<span>[ <fmt:formatDate
															value="${r.comment_edit }" type="date"
															pattern="yy.MM.dd HH:mm" /> ]
														</span> 
										<c:if test="${sessionScope.loginUserID == r.comment_writer }">
											<button type="submit">수정</button>
											<button type="button"
												onclick="commentDelete(${r.comment_id }, ${detailBoard.board_id })">삭제</button>
										</c:if>
										<button onclick="writeReply(${r.comment_id}, ${token});"
											type="button" id="wr" value="0">대댓글</button>
									</p>
								</form>
						</div>
								<table>

									<c:forEach var="rr" items="${reply }">
										<c:if test="${rr.inherit_comment == r.comment_id}">
											<tr id="orgReply${rr.reply_id }">
													<td colspan=4>└&nbsp;&nbsp;<span class="commentWriter">${rr.reply_writer }&nbsp;</span>
														<input name="reply_id" value="${rr.reply_id }"
														type="hidden"> <input name="inherit_post"
														value="${detailBoard.board_id }" type="hidden"> <input
														name="inherit_comment" value="${r.comment_id }"
														type="hidden">
														${rr.reply_content }
														<span>[ <fmt:formatDate
															value="${rr.reply_edit }" type="date"
															pattern="yy.MM.dd HH:mm" /> ]
														</span> <c:if
															test="${sessionScope.loginUserID == rr.reply_writer }">
															<button type="button" id="btn" onclick="update(${rr.reply_id});">수정</button>
															<button type="button"
																onclick="replyDelete(${detailBoard.board_id}, ${r.comment_id}, ${rr.reply_id })">삭제</button>
														</c:if>
													</td>
											</tr>
											<tr id="updReply${rr.reply_id }" style="display: none">
												<form action="board.reply.update" method="post">
													<td colspan=4>└&nbsp;&nbsp;<span class="commentWriter">${rr.reply_writer }&nbsp;</span>
														<input name="reply_id" value="${rr.reply_id }"
														type="hidden"> <input name="inherit_post"
														value="${detailBoard.board_id }" type="hidden"> <input
														name="inherit_comment" value="${r.comment_id }"
														type="hidden">
														<textarea name="reply_content"> ${rr.reply_content }</textarea>
														<span>[ <fmt:formatDate
															value="${rr.reply_edit }" type="date"
															pattern="yy.MM.dd HH:mm" /> ]
														</span> <c:if
															test="${sessionScope.loginUserID == rr.reply_writer }">
															<button type="submit">수정</button>
															<button type="button"
																onclick="replyDelete(${detailBoard.board_id}, ${r.comment_id}, ${rr.reply_id })">삭제</button>
														</c:if>
													</td>
												</form>
											</tr>
										</c:if>
									</c:forEach>
									<tr>
										<td>
											<form action="board.reply.write" method="post">
												<table id="${r.comment_id }">
													<tr>
														<td colspan=4><input name="inherit_post"
															value="${detailBoard.board_id }" type="hidden"> <input
															name="inherit_comment" value="${r.comment_id }"
															type="hidden"> <input name="token"
															value="${token}" type="hidden"></td>
													</tr>
												</table>
											</form>
										</td>
									</tr>
								</table>
							</c:forEach></td>
					</tr>
					<tr>
						<td class="commentTd">
							<form action="board.comment.write" name="boardCommentWriteForm"
								onsubmit="" method="post">
								<!-- js 설정 후 -->
								<span class="commentWriter">${sessionScope.loginUserID }&nbsp;</span>
								<input name="token" value="${token}" type="hidden"> <input
									name="inherit_post" value="${detailBoard.board_id}"
									type="hidden"><textarea name="comment_content"
									maxlength="500" class="commentContent" placeholder="댓글 입력"></textarea>
								<button>작성</button>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function writeReply(idd, tok) {
		var id = "${sessionScope.loginUserID }";
		var i = $("<textarea></textarea>").attr({
			id : "reply",
			name : "reply_content",
			placeholder : "대댓글 입력"
		});
		var b = $("<button></button>").attr({
			class : "writeReply",
			type : "submit"
		}).text("작성");
		
		var idTd = $("<td></td>").html(id);
		var iTd = $("<td></td>").html(i);
		var bTd = $("<td></td>").html(b);
		var tr =  $("<tr></tr>").append(idTd, iTd, bTd);
		
		$("#" + idd).append(tr);
		
		
	}
	
	function addReply(ccc) {
		var reply = {
			comment_id : "${r.comment_id}",
			cr_depth : cr_depth,
			cr_parent_id : "",
			
		} 
		
		$.ajax({
			url : "board.needlogin.reply.write",
			data : $("#commentForm").serialize(),
			success : function(){
				location.href = "board.needlogin.reply.write";
				
			
				
			}
			
		});
	}
	
	function updateComm(yy) {
		$("#orgComment" + yy).attr("style", "display: none");
		$("#updComment" + yy).removeAttr("style");
	}
	
	
</script>
</body>
</html>