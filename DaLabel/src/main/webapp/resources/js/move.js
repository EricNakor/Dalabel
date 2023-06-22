function deleteBundle(no) {
	if (confirm("정말 삭제하시겠습니까?")) {
		location.href = "delete.needlogin.bundle?bundle_no=" + no
	}
}

function submit() {
	var area = document.getElementById("area");
	var text = area.value;
	// 신고하기 서버 통신
}

