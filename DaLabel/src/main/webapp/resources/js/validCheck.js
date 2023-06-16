function writePostCheck() {
	var titleInput = document.writePostForm.board_title;
	var contentInput = document.writePostForm.board_content;

	if (isEmpty(titleInput) || isEmpty(contentInput)) {
		alert("입력 값을 확인해주세요");
		titleInput.value = "";
		contentInput.value = "";
		titleInput.focus();
		return false;
	}
	return true;
}