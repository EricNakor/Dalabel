function bye() {
	if (confirm("탈퇴하시겠습니까?")) {
		location.href = "member.bye";
	}
}

function boardPageChange(p) {
	location.href = "board.page.change?p=" +p;
}

function postDelete(id) {
	if (confirm("게시물을 삭제하시겠습니까?"))
		location.href = "board.post.delete?board_id=" + id;
}

function commentDelete(cId, bId) {
	location.href = "board.comment.delete?comment_id=" + cId + "&inherit_post=" + bId;
}

function replyDelete(a, b, c) {
	location.href = "board.reply.delete?inherit_post=" + a + "&inherit_comment=" + b + "&reply_id=" + c;
}



function goLists() {
	location.href = "board.go";
}

