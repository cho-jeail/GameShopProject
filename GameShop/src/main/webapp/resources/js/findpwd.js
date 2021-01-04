let fmail = document.getElementById('fpwdEmail');
let cmf = document.getElementById('fmailCmf');
let fpForm = document.getElementById('fpwdForm');
let fDiv2 = document.getElementById('formDiv2');
let fDiv1 = document.getElementById('formDiv1');
let sendBtn = document.getElementById('sendEmail');

sendBtn.addEventListener('click', sendEmail);

let regCk = false;

function changeCss(){
	fDiv2.style.transform = 'translateY(-25px)';
	fDiv2.style.color = 'white';
	fDiv2.style.backgroundColor = '#0f3964';
	fDiv2.style.width = '130px';
	fDiv2.style.fontSize = '1.0rem';
	fDiv1.style.border = '1px solid white';
	fmail.focus();
}

function changeCss2(){
	fDiv2.style.transform = 'translateY(0px)';
	fDiv2.style.color = 'gray';
	fDiv2.style.backgroundColor = 'inherit';
	fDiv2.style.width = '150px';
	fDiv2.style.fontSize = '1.2rem';
	fDiv1.style.border = '1px solid gray';
	fmail.value = '';
}

window.onclick = function(event){
	if(event.target === fmail || event.target === sendBtn || event.target === fDiv2){
		changeCss();
	}
	else{
		if(fmail.value !== ''){
			fDiv1.style.border = '1px solid gray';
			fDiv2.style.color = 'gray';
		}
		else{
			changeCss2();
		}
	}
}


//이메일 정규 표현식
function emailRegexp(){
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(fmail.value !== '' && emailRegExp.test(fmail.value) === false){
		cmf.innerText = '이메일 형식이 잘못되었습니다.';
		fmail.focus();
		regCk = false;
	}
	else if(fmail.value == ''){
		cmf.innerText = '이메일을 입력하세요.';
		fmail.focus();
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