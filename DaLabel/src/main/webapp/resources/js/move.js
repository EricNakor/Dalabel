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

function wantResult(no) {
	$.ajax({
		type : "get",
		url : "want.needlogin.labeling.result",
		data : {
			project_no : no
		},
		success : function(result) {
			if(result == "success") {
				$("#getResult").style.display = "none"
			}
		}
	})
}