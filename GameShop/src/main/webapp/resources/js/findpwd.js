let fmail = document.getElementById('fpwdEmail');
let cmf = document.getElementById('fmailCmf');
let fpForm = document.getElementById('fpwdForm');
document.getElementById('sendEmail').addEventListener('click', sendEmail);
let regCk = false;

//이메일 정규 표현식
function emailRegexp(){
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(fmail.value !== '' && emailRegExp.test(fmail.value) === false){
		cmf.innerText = '이메일 형식이 잘못되었습니다.';
		regCk = false;
	}
	else if(fmail.value == ''){
		cmf.innerText = '이메일을 입력하세요.';
		regCk = false;
	}
	else{
		cmf.innerText = '';
		regCk = true;
	}
}

function sendEmail(event){
	event.preventDefault(); // 창 이동을 막음
	emailRegexp();
	
	if(regCk === true){
		fpForm.submit();
	}
	else{
		return;
	}
}	