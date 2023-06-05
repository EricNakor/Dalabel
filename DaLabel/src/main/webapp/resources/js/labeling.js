function btnn() {
	var f = document.getElementById("bundle_type").options[document
			.getElementById("bundle_type").selectedIndex].value;
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