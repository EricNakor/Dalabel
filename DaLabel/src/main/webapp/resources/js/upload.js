
function fileUpload(type) {
	window.open(type, 'pop', 'width=500, height=300');
}

function checkFilevalidation() {

}

function close_self(rtval) {
	if (rtval.slice(-3, rtval.length) !== 'zip') {
		opener.document.getElementById("profile").src = rtval
	} else {
		opener.location.href = "get.needlogin.my.bundle";
	}
	window.open('', '_self').close();
}