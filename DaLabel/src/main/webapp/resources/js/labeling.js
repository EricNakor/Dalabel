function btnn() {
	var f = document.getElementById("project_how").options[document
			.getElementById("project_how").selectedIndex].value;
	if (f == "0") {
		var i = $("<input>").attr("id", "type_input");
		var b = $("<input>").attr({
			type : "button",
			value : "추가",
			id : "add",
			onclick : "add_btn();"
		});
		var table = $("<table></table>").attr("id", "tablee");
		$("#btn_add").append(table, i, b);
		$("#tablee").show();

	} else {
		$("#type_input").remove();
		$("#add").remove();
		$("#tablee").hide();
	}
}

function add_btn() {
	var inputValue = document.getElementById("type_input").value;
	var bb = $("<input>").attr({
		type : "button",
		value : inputValue,
	});
	var del = $("<input>").attr({
		type : "button",
		value : "삭제",
		onclick : "delBtn(this);",
	});

	var nTd = $("<td></td>").html(bb);
	var dTd = $("<td></td>").html(del);
	var tr = $("<tr></tr>").append(nTd, dTd);
	$("#tablee").append(tr);
	$("#type_input").val("");
}

function delBtn(obj) {
	var trr = $(obj).parent().parent();
	trr.remove();
}

function changeAccessLevel() {
	let d = 0;
	$(".access").each((a,b)=>{
		if(b.checked){
		d+=Number(b.value)}
		})
	if (d==16){
		d=0;
	}
	if(d%2==1){
		d=1;
	}
	$("#project_access_level").val(d);
}

function selectAll() {
	$(".access").each((a,b)=>{
		if(a!=0){
		b.disabled= !b.disabled}
	})
}

function loadProjectAccessLevel(val){
	$(".access")[4].checked=true;
	$(".access").each((a,b)=>{
		if(val==1){
			if(a!=0){
				b.disabled=true;
			}
		}
		if(b.value&val){
			b.checked=true;
		}
	})
}

function getReportedData(no, user) {
	$.ajax({
		type : "get",
		url : "data.needlogin.get.reported",
		data : {
			"data_where" : no
		},
		success : function(reportedData) {
			$.each(reportedData, function(index, reportedData2) {
				$("#reportedDataTable").append($("<tr><td></td></tr>")
						.append($("<img>").attr("src", "resources/data/" + user + "/" + reportedData2)))
			})
		},
		error : function() {
			alert("없음")
		}
	})
}
