function joinCheck() {
	var idInput = document.joinForm.user_id;
	var pwInput = document.joinForm.user_pw;
	var pwChkInput = document.joinForm.user_pwCheck;
	var nameInput = document.joinForm.user_name;

	if (isEmpty(idInput) || containsHS(idInput)) {
		alert("id 입력");
		idInput.value = "";
		idInput.focus();
		return false;
	}

	if (isEmpty(pwInput) || isEmpty(pwChkInput)) {
		alert("pw 입력");
		pwInput.focus();
		return false;
	}

	if (notEquals(pwInput, pwChkInput)) {
		alert("pw 불일치");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	}

	if (isEmpty(nameInput) || containsNum(nameInput)) {
		alert("이름");
		nameInput.value = "";
		nameInput.focus();
		return false;
	}

	return true;
}

function updateCheck() {
	var nameInput = document.updateForm.user_name;
	var pwInput = document.updateForm.user_pw;
	var pwChkInput = document.updateForm.user_pwChk;

	if (isEmpty(nameInput) || containsNum(nameInput)) {
		alert("이름 입력");
		nameInput.focus();
		return false;
	}

	if (isEmpty(pwInput) || isEmpty(pwChkInput)) {
		alert("pw 입력");
		pwInput.focus();
		return false;
	}

	if (notEquals(pwInput, pwChkInput)) {
		alert("pw 불일치");
		pwInput.focus();
		return false;
	}

	return true;
}
