function writePostCheck() {
	var titleInput = document.getElementById("board_title").value;
	var contentInput = document.getElementById("board_content").value;

	if (titleInput==""|| contentInput=="") {
		alert("입력 값을 확인해주세요");
		titleInput.value = "";
		contentInput.value = "";
		titleInput.focus();
		return false;
	}
	return true;
}