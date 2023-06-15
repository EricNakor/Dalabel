function labeling_do_loads(x, y) {
	$.ajax({
		type : "get",
		url : "doLabeling.needlogin.show",
		data : {
			"start" : x,
			"end" : y
		},
		success : function(project) {
			let lastvalue = -1;
			$.each(project,	function(index, project2) {
				lastvalue = project2.project_no
				let flag = 0;
				if(project2.dolabel_state=="3"){
					return true;
				}else if (project2.dolabel_state=="\u0000"){
					project2.dolabel_state="미신청";
					flag=1;
				}else if (project2.dolabel_state=="0") {
					project2.dolabel_state="수락대기중"
				}else if (project2.dolabel_state=="1") {
					project2.dolabel_state="수락됨";
					flag = 2;
				}else if (project2.dolabel_state=="4") {
					project2.dolabel_state="초대됨"
				}
				var titleTd = ($("<tr><td></td></tr>").text(project2.project_title))
				var requestorTd = ($("<tr><td></td></tr>").text(project2.project_requestor))
				var howTd = ($("<tr><td></td></tr>").text(project2.project_how))
				
				var stateTd = ($("<tr><td></td></tr>").text(project2.dolabel_state))
				$(".projectsontainer").append(
					$("<table></table>").attr("id", "projectTbl")
					.append(titleTd, requestorTd, howTd, stateTd)
					.on("click", function() {
						location.href = "doLabeling.needlogin.showIntro?project_no="
							+ project2.project_no+"&flag="+flag
				}))
				$(".projectsontainer").append("<hr>");
			})
			
			if(project.length<y){
				$("button").remove(".loadBt")
			}else{
				$(".loadBt").attr("onclick", "labeling_do_loads("+lastvalue+","+y+");");
			}
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
			$(".my_labeling").empty();
			$.each(myLabeling, function(index, myLabeling2) {
				if(myLabeling2.dolabel_state==3){
					return true;
				}
				let tbinf = $("<table></table>");
				tbinf.append("<tr><td>프로젝트명</td><td>"+myLabeling2.project_title+"</td></tr>");
				tbinf.append("<tr><td>소유자</td><td>"+myLabeling2.dolabel_user+"</td></tr>");
				if(myLabeling2.dolabel_state==0){
					tbinf.append("<tr><td>상태</td><td>"+"수락대기중"+"</td></tr>");					
				}else if(myLabeling2.dolabel_score!=null){
					tbinf.append("<tr><td>스코어</td><td>"+dolabel_score+"</td></tr>");
				}else if(myLabeling2.dolabel_state==1){
					tbinf.append("<tr><td>상태</td><td>"+"<button onclick=\"location.href='doLabeling.needlogin.start?project_no="+myLabeling2.dolabel_project_no+"'\">라벨링 시작하기</button>"+"</td></tr>");					
				}else if(myLabeling2.dolabel_state==4){
					tbinf.append("<tr><td>상태</td><td>"+"<button>초대받기</button>"+"</td></tr>")
				}
				
				$(".my_labeling").append(tbinf);
				$(".my_labeling").append("<hr>");
			})
		},
		error : function() {
			alert("에러")
		}
	})
}

