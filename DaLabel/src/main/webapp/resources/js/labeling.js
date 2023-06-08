function btn() {
	var f = document.getElementById('project_how').options[document
			.getElementById('project_how').selectedIndex].value
	if (f == '1') {
		var i = $('<input>').attr('id', 'append_inp')
		var b = $('<input>').attr({
			type : 'button',
			value : '추가',
			id : 'add_btn_id',
			onclick : 'add_btn()'
		})
		$('#btn_add').append(i, b)
	} else {
		$('#append_inp').remove()
		$('#add_btn_id').remove()
	}
}

function add_btn() {
	var bb = $('<input>').attr({
		type : 'button',
		'class':'btnName',
		value : document.getElementById('append_inp').value
	})
	var del = $('<input>').attr({
		type : 'button',
		value : '삭제',
		onclick : 'del_btn(this)',
	})
	var tr = $('<tr></tr>').append($('<td></td>').html(bb), $('<td></td>').html(del))
	$('#t').append(tr) // table에 tr, td를 append
	$('#append_inp').val('')
}

function del_btn(obj) {
	$(obj).parent().parent().remove()
}

function toJSON() {
	if (document.getElementById('project_how').options[document
		.getElementById('project_how').selectedIndex].value == '0') {
		let type = 'input'
		var obj = {
			'type' : type
		}
		$('#project_category').attr('value', JSON.stringify(obj))
	} else {
		let type = 'button'
		var obj = {
				'type' : type,
				'info' : []
		}
		$('.btnName').each((idx, v)=>{
			obj['info'][idx] = $(v).val()
		})
		$('#project_category').attr('value', JSON.stringify(obj))
	}
	if ($('#project_title').val() === '' || $('#project_guide').val() === '') {
		return false 
	}
	if (document.getElementById('project_how').options[document
		.getElementById('project_how').selectedIndex].value === '1' && obj['info'].length === 0) { 
		// select가 직접타이핑이 아닌데, 아무 것도 안 만들었으면 (추가X상태) false
		return false
	}
	return true
// 타이틀, 가이드, 버튼일경우 버튼이 하나 이하이면 -> return false
// 그 외의 경우에는 return true
}

function changeAccessLevel() {
	let d = 0
	$('.access').each((a,b)=>{
		if(b.checked){
		d+=Number(b.value)}
		})
	if (d==16){
		d=0
	}
	if(d%2==1){
		d=1
	}
	$('#project_access_level').val(d)
}

function selectAll() {
	$('.access').each((a,b)=>{
		if(a!=0){
		b.disabled= !b.disabled}
	})
}

function loadProjectAccessLevel(val){
	$('.access')[4].checked=true
	$('.access').each((a,b)=>{
		if(val==1){
			if(a!=0){
				b.disabled=true
			}
		}
		if(b.value&val){
			b.checked=true
		}
	})
}