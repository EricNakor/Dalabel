function doLabeling(projectInfo) {
	$.ajax({
		url : "뭔가의 주소",
		data : {
			"start" : x,
			"end" : y
		},
		success : function() {
			$("#showImg").attr("src", "resources/image/" + projectInfo.path)
			labelTypeCheck(projectInfo)
		}
	})
}

function labelTypeCheck(projectInfo) {
	
}