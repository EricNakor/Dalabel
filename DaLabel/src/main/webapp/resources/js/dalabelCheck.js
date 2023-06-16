function boardSearchCheck() {
	var search = document.getElementById("search").value;
	if (search == "") {
		alert("검색어를 입력해주세요.");
		return false;
	} 
	return true;
}