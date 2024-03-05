function joinCheck(){
	
	// 입력된 암호 일치 여부
	if(document.frm.userpwd.value != document.frm.pwd_check.value){
		alert('비밀번호가 일치하지 않습니다.');
		document.frm.userpwd.value = "";
		document.frm.pwd_check.value = "";
		
		document.frm.userpwd.focus();
		
		return false;
	}
	
	// 중복 체크 여부 확인
	if(document.frm.reid.value.length ==0 ){
		alert('중복 체크를 하지 않았습니다.');
		document.frm.userid.focus();
		return false;
	}
	
	
	return true;
}

function idCheck(){
	if(document.frm.userid.value.length == 0){
		alert('아이디 입력해주세요');
		document.frm.userid.focus();
		return false;
	}	
	
	let url = "idCheck?userid="+document.frm.userid.value;
	
	window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200")
	
}

function idOk(){
	// opener : 부모창
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	
	self.close(); // 현재 창 닫기
	
}



