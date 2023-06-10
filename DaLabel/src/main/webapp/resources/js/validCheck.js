function writePostCheck() {
	var titleInput = document.writePostForm.title;
	var contentInput = document.writePostForm.content;

	if (isEmpty(titleInput) || isEmpty(contentInput)) {
		alert("입력 값을 확인해주세요");
		titleInput.value = "";
		contentInput.value = "";
		titleInput.focus();
		return false;
	}
	return true;
}