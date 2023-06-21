function bye() {
	if (confirm("탈퇴하시겠습니까?")) {
		location.href = "member.needlogin.bye";
	}
}

function boardPageChange(p) {
	location.href = "board.needlogin.page.change?p=" +p;
}

function postDelete(id) {
	if (confirm("게시물을 삭제하시겠습니까?"))
		location.href = "board.needlogin.post.delete?board_id=" + id;
}

function commentDelete(cId, bId) {
	location.href = "board.needlogin.comment.delete?comment_id=" + cId + "&inherit_post=" + bId;
}

function commentUpdate(id, txt) {
	location.href = "board.needlogin.comment.update?comment_id=" + id + "&comment_content=" + txt;
}



