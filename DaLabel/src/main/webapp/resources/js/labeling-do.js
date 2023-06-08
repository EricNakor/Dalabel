function labeling_do_loads(x, y) {
	$.ajax({
		type : "get",
		url : "doLabeling.needlogin.show",
		data : {
			"start" : x,
			"end" : y
		},
		success : function(project) {
			$.each(project, function(index, project2) {
				var titleTd = ($("<tr><td></td></tr>").text(project2.project_title))
				var requestorTd = ($("<tr><td></td></tr>").text(project2.project_requestor))
				$(".projectsontainer").append($("<table></table>").attr("border", 1).append(titleTd, requestorTd))
			})
		},
		error : function() {
			$("button").remove(".loadBt")
		}
	})
}