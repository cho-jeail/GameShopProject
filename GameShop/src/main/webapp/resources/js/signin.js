let signinCmf = document.getElementById('signinCmf');
let signinEmail = document.getElementById('signinEmail');
let signinPw = document.getElementById('signinPw');
let signEmailCmf = document.getElementById('signEmailCmf');
let signPwCmf = document.getElementById('signPwCmf');
let signinCk = document.getElementById('signinCk');

signinEmail.addEventListener('blur', emailRegexp);
document.getElementById('signinBtn').addEventListener('click', signSubmit);

function enterkey() {
	 if (window.event.keyCode == 13) { signSubmit(event); } 
}

// 이메일 정규 표현식 및 중복확인
function emailRegexp(){
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(signinEmail.value !== '' && emailRegExp.test(signinEmail.value) === false){
		signEmailCmf.innerText = '잘못된 형식입니다.';
		signEmailCmf.style.color = 'red';
	}
	else{
		signEmailCmf.innerText = '';
	}
}

function signSubmit(event){
	event.preventDefault();
	let inputs = document.querySelectorAll('input.signinInput');
	let signForm = document.getElementById('signinForm');
	let sCmf = document.getElementById('signinCmf');
	
	let bList = [];
	let cList = [signEmailCmf, signPwCmf];

	bcnt = 0;
	for(i = 0; i < inputs.length; i++){
		if(inputs[i].value !== ''){
			bList[i] = true;
			bcnt++;
		}
		else{
			cList[i].innerText = '항목을 확인하세요.';
			inputs[i].focus();
			signinCmf.innerText = '';
			bList[i] = false;
			return false;
		}
	}
	
	if(bList.length === bcnt){
		signForm.submit();
	}
	else{
		return false;
	}
}




