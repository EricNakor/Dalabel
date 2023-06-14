function labeling_do_loads(x, y) {
	$.ajax({
		type : "get",
		url : "doLabeling.needlogin.show",
		data : {
			"start" : x,
			"end" : y
		},
		success : function(project) {
			$.each(project,	function(index, project2) {
				var titleTd = ($("<tr><td></td></tr>")
				.text(project2.project_title))
				var requestorTd = ($("<tr><td></td></tr>")
				.text(project2.project_requestor))
				var howTd = ($("<tr><td></td></tr>")
				.text(project2.project_how))
				var stateTd = ($("<tr><td></td></tr>")
				.text(project2.dolabel_state))
				$(".projectsontainer").append(
					$("<table></table>").attr("id", "projectTbl")
					.append(titleTd, requestorTd, howTd, stateTd)
					.on("click", function() {
						location.href = "doLabeling.needlogin.showIntro?project_no="
							+ project2.project_no
				}))
			})
		},
		error : function() {
			$("button").remove(".loadBt")
		}
	})
}

function my_labeling_load(x, y) {
	$.ajax({
		type : "get",
		url : "doLabeling.needlogin.mypage.find",
		data : {
			"start" : x,
			"end" : y
		},
		success : function(myLabeling) {
			$.each(myLabeling, function(index, myLabeling2) {
				$(".my_labeling").append($("<a></a><br>").attr("href", "#")
				.append(myLabeling2.project_title))
			})
		},
		error : function() {
			alert("에러")
		}
	})
}

function box(arr) {
    let ret = $('.slider').bxSlider({
        adaptiveHeight : true,
        infiniteLoop : true,
        touchEnabled : false,
        pager : false,
        slideWidth : 500,
        mode : 'fade', // 'horizontal', 'vertical' 도 있음
        nextSelector : '#slider-next', // <- -> 없애는 역할도 함
        // prevSelector : '#slider-prev',
        // nextText : '→ Go front',
        // prevText : '← Go back'
    })
    for (const fileName of arr) {
        $('.slider').append($('<img>').attr('src', 'resources/' + fileName))// ★★★★★★★
    }
    return ret
} 

