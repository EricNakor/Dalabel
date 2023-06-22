<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body class="u-body u-xl-mode" data-lang="en">
	<form action="board.needlogin.post.update.go?board_id=${detailBoard.board_id }">
		<input type="hidden" value="${detailBoard.board_id }" name="board_id">
		<section class="u-clearfix board-section-1" id="sec-b5df">
			<div class="u-clearfix u-sheet u-sheet-1">
				<div class="u-expanded-width u-table u-table-responsive u-table-1">
					<table class="u-table-entity u-table-entity-1">
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
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1"
									align="center">제 목</td>
								<td colspan="4"
									class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2">[${detailBoard.board_category }] ${detailBoard.board_title }</td>
							</tr>
							<tr style="height: 50px;">
								<td
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-3 u-table-cell u-table-cell-6"
									align="center">작 성 자</td>
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
									colspan="5">${detailBoard.board_content }</td>
							</tr>
							<tr style="height: 65px;">
								<td class="u-table-cell" align="left"><button type="button" class="boardBtn" onclick="location.href='board.needlogin.go'">목록</button></td>
								<td colspan="4" class="u-table-cell" align="right"><c:if
										test="${sessionScope.loginUserID == detailBoard.board_writer }">
										<button
											class="boardBtn">수정</button>
										<button type="button"
											onclick="postDelete(${detailBoard.board_id })"
											class="boardBtn">삭제</button>
									</c:if></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</form>
	<section class="u-align-center u-clearfix" id="sec-da1e">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-table u-table-responsive u-table-1">
				<table class="u-table-entity u-table-entity-1">
					<colgroup>
						<col width="12.71%">
						<col width="29.1%">
						<col width="29.1%">
						<col width="29.1%">
					</colgroup>
					<tbody class="u-table-body">
						<tr>
							<td colspan="4" >
								<table class="u-table-entity u-table-entity-1" class="Tbl">
									<tr>
										<td
											><c:forEach
												var="r" items="${comment }">
														<hr>
												<div class="orgComment${r.comment_id }"
													style="float: left; width: 70%;">
													<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;▶&nbsp;&nbsp;</span>
													<input name="comment_id" value="${r.comment_id}"
														type="hidden"> <input name="inherit_post"
														value="${detailBoard.board_id}" type="hidden">
													${r.comment_content } - <span>[ <fmt:formatDate
															value="${r.comment_edit }" type="date"
															pattern="yy.MM.dd HH:mm" /> ]
													</span>
													<button onclick="writeReply(${r.comment_id}, ${detailBoard.board_id});"
														type="button" id="wr" value="0" class="btn">답글</button>
												</div>
												<div style="float: left; width: 30%;" align="right" class="orgComment${r.comment_id }">
												
													<c:if
														test="${sessionScope.loginUserID == r.comment_writer }">
														
														<button type="button"
															onclick="updateComm(${r.comment_id});" class="btn">수정</button>
														<button type="button"
															onclick="commentDelete(${r.comment_id }, ${detailBoard.board_id })" class="btn">삭제</button>
													</c:if>
												</div>
												<div id="updComment${r.comment_id }" style="display: none;">
													<form action="board.needlogin.comment.update" name="commentForm"
														id="commentForm${r.comment_id }" method="post">
														<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;▶&nbsp;&nbsp;</span>
														<input name="comment_id" value="${r.comment_id}"
															type="hidden"> <input name="inherit_post"
															value="${detailBoard.board_id}" type="hidden">
														<textarea name="comment_content" class="txt" style="vertical-align: middle;">${r.comment_content }</textarea>
														&nbsp;&nbsp; <span>[ <fmt:formatDate
																value="${r.comment_edit }" type="date"
																pattern="yy.MM.dd HH:mm" /> ]
														</span>
														<c:if
															test="${sessionScope.loginUserID == r.comment_writer }">
															<button type="submit" class="btn" style="vertical-align: middle;">수정</button>
															<button type="button" class="btn"
																onclick="commentDelete(${r.comment_id }, ${detailBoard.board_id })" style="vertical-align: middle;">삭제</button>
														</c:if>
													</form>
												</div>
												<table class="u-table-entity u-table-entity-1">

													<c:forEach var="rr" items="${reply }">
														<c:if test="${rr.inherit_comment == r.comment_id}">
															<tr id="orgReply${rr.reply_id }">
																<td colspan="4">
																	<div style="float: left; width: 70%;">
																		└&nbsp;&nbsp;<span class="commentWriter">${rr.reply_writer }&nbsp;&nbsp;▷&nbsp;&nbsp;</span>
																		<input name="reply_id" value="${rr.reply_id }"
																			type="hidden"> <input name="inherit_post"
																			value="${detailBoard.board_id }" type="hidden">
																		<input name="inherit_comment" value="${r.comment_id }"
																			type="hidden"> ${rr.reply_content } - <span>[
																			<fmt:formatDate value="${rr.reply_edit }" type="date"
																				pattern="yy.MM.dd HH:mm" /> ]
																		</span>
																	</div>
																	<div style="float: left; width: 30%;" align="right">
																		<c:if
																			test="${sessionScope.loginUserID == rr.reply_writer }">
																			<button type="button" id="btn"  class="btn"
																				onclick="update(${rr.reply_id});">수정</button>
																			<button type="button" class="btn"
																				onclick="replyDelete(${detailBoard.board_id}, ${r.comment_id}, ${rr.reply_id })">삭제</button>
																		</c:if>
																	</div>
					
																</td>
															</tr>
															<tr id="updReply${rr.reply_id }" style="display: none;">
																<form action="board.needlogin.reply.update" method="post">
																	<td colspan="4">└&nbsp;&nbsp;<span
																		class="commentWriter">${rr.reply_writer }&nbsp;&nbsp;▷&nbsp;&nbsp;</span>
																		<input name="reply_id" value="${rr.reply_id }"
																		type="hidden"> <input name="inherit_post"
																		value="${detailBoard.board_id }" type="hidden">
																		<input name="inherit_comment" value="${r.comment_id }"
																		type="hidden"> <textarea name="reply_content"  class="txt"  style="vertical-align: middle;"> ${rr.reply_content }</textarea>
																		<span>[ <fmt:formatDate
																				value="${rr.reply_edit }" type="date"
																				pattern="yy.MM.dd HH:mm" /> ]
																	</span> <c:if
																			test="${sessionScope.loginUserID == rr.reply_writer }">
																			<button type="submit" class="btn" style="vertical-align: middle;">수정</button>
																			<button type="button" class="btn"
																				onclick="replyDelete(${detailBoard.board_id}, ${r.comment_id}, ${rr.reply_id })" style="vertical-align: middle;">삭제</button>
																		</c:if>
																	</td>
																</form>
															</tr>
														</c:if>
													</c:forEach>
													<tr>
														<td>
															<form action="board.needlogin.reply.write" method="post" onsubmit="writeReplyCheck();">
																<table>
																	<tr>
																		<td colspan="4" id="${r.comment_id }"><input
																			name="inherit_post" value="${detailBoard.board_id }"
																			type="hidden"> <input name="inherit_comment"
																			value="${r.comment_id }" type="hidden"> <input
																			name="token" value="${token}" type="hidden"></td>
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
											<form action="board.needlogin.comment.write"
												name="boardCommentWriteForm" onsubmit="writeCommentCheck();" method="post">
												<!-- js 설정 후 -->
												<span class="commentWriter">${sessionScope.loginUserID }&nbsp;▶&nbsp;</span>
												<input name="token" value="${token}" type="hidden">
												<input name="inherit_post" value="${detailBoard.board_id}"
													type="hidden">
												<textarea name="comment_content" maxlength="500" id="commentTxt" 
													 class="txt" placeholder="댓글 입력" style="vertical-align: middle;"></textarea>
												<button class="writeBtn" style="vertical-align: middle;">작성</button>
												<br><br><br>
											</form>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	function writeReply(idd, bid) {
		var id = "${sessionScope.loginUserID }&nbsp;▷&nbsp;";
		var i = $("<textarea></textarea>").attr({
			id : "replyTxt",
			name : "reply_content",
			placeholder : "답글 입력",
			class : "txt",
			style : "vertical-align: middle;",
			onsubmit : "writeReplyCheck();"
		});
		var b = $("<button></button>").attr({
			class : "writeBtn",
			type : "submit",
			style : "vertical-align: middle;"
		}).text("작성");
		
		var cb = $("<button></button>").attr({
			class : "writeBtn",
			type : "button",
			style : "vertical-align: middle;",
			onclick : "window.location.reload()"
		}).text("취소");
		
		
		$("#" + idd).append(id, i,"&nbsp;", b,"&nbsp;", cb);
		
		
	}


	function update(xx){
		$("#orgReply" + xx).attr("style", "display: none;");
		$("#updReply" + xx).removeAttr("style");
	}
	
	function updateComm(yy) {
		$(".orgComment" + yy).attr("style", "display: none;");
		$("#updComment" + yy).removeAttr("style");
	}
	
	
</script>
</body>
</html>