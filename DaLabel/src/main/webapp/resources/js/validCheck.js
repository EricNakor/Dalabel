function writePostCheck() {
	  var title = document.getElementById('board_title').value;
	  var content = CKEDITOR.instances.board_content.getData();
	  if (title === '') {
	    alert('제목을 입력해주세요.');
	    title.value = "";
	    return false;
	  }
	  if (content === '') {
	    alert('내용을 입력해주세요.');
	    content.value = "";
	    return false;
	  }
	  return true;
	}

function reportCheck() {
	var contentInput = document.getElementById("report").value;
	if (contentInput == "") {
		alert("신고 사유를 입력해주세요.");
		return false;
	}
	return true;
}
