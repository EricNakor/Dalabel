function writeReply() {
	alert(id);
	var i = $("<input>").attr({
		id : "reply",
		name : "reply_content"
	});
	var b = $("<button></button>").attr({
		id : "writeReply",
		onclick : "addReply();"
	}).text("작성");
	var iTd = $("<td></td>").html(i);
	var bTd = $("<td></td>").html(b);
	var tr = $("<tr></tr>").append(iTd, bTd);
	$("#replyTbl").append(tr);
}

function addReply() {
	$.ajax({
		
	});
//	$.ajax({
//		url : "/board.reply.write",
//		data : $("#replyForm").serialize(),
//		success : function(){
//			alert("성공");
//		}
//	})
}



