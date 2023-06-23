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
			alert("정산을 시작합니다.")
			if(result == "success") {
				$("#getResult").css("display", "none")
			}
		}
	})
}

function getAccessUser(project_no) {
	window.open('manage.needlogin.labeling.user?project_no=' + project_no, 'pop', 'width=500, height=300')
}

function downResult(project_no) {
	location.href = "download.needlogin.projectresult?project_no="+project_no;
}