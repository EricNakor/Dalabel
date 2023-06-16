function boardSearchCheck() {
	var searchField = document.boardSearchForm.search;
	if (isEmpty(searchField)) {
		alert("검색어를 입력해주세요.")
		return false;
	}
	return true;
}