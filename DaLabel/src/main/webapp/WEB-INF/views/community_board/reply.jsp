<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
	<tr>
		<td class="commentTd">			
			<form action="board.comment.write"
				name="boardCommentWriteForm" onsubmit="return ???(this);">
				<span class="commentWriter">${sessionScope.loginUserId.commentWriter }&nbsp;</span>
				<input name="token" value="&{token}"> 
				<input name="comment_id" value="&{p.comment_id}"> 
				<input name="comment_content" maxlength="500" class="commentContent">
				<button>작성</button>
			</form>
		</td>
	</tr>
	<tr>
		<td>
			<c:forEach var="r" items="${p.board_comment }">
				<p>
					<span class="commentWriter">${r.comment_writer }&nbsp;&nbsp;</span>
					${r.comment_content } -
					<fmt:formatDate value="{r.comment_regist }" type="date" dateStyle="short"/>
				</p>
			</c:forEach>
		</td>		
		<td><button>삭제하기</button></td>
	</tr>
</table>