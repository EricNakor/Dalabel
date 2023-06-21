function isEmpty(input) {
	return !input.value;
}

function containsHS(input) {
	var ok = "abcdefghijklmnopqrstuvwxyz0123456789@._-";
	
	for (var i = 0; i < input.value.length; i++) {
		if (ok.indexOf(input.value[i]) == -1) {
			return true;
		}
	}
}

function containsNum(input) {
	var ok = "0123456789@._-!~$#%^&*()+=\?:";
	
	for (var i = 0; i < input.value.length; i++) {
		if (ok.indexOf(input.value[i]) == -1) {
			return false;
		}
	}
	return true;
}

function lessThan(input, len) {
	return input.value.length < len;
}

function notContains(input, set) {
	for (var i = 0; i < set.length; i++) {
		if (input.value.indexOf(set[i]) != -1) {
			return false;
		}
	}
	return true;
}

function notEquals(input1, input2) {
	return input1.value != input2.value;
}

function isNotNumber(input) {
	return input.value.indexOf(" ") != -1 || isNaN(input.value);
}

function isNegativeNum(input) {
	return input.value < 0;
}

function isNotType(input, type) {
	type = "." + type;
	return input.value.toLowerCase().indexOf(type) == -1;
}