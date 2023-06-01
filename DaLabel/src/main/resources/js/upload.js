

function profileUpload() {
	window.open('try.needlogin.upload?t=profile', 'pop',
	'width=500, height=500');
}

function checkFilevalidation(){
	
}

function close_self(rtval){
	opener.document.getElementById("profile").src = rtval
	window.open('', '_self').close();	
}