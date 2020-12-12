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
		signinEmail.focus();
	}
	else{
		signEmailCmf.innerText = '';
		signinEmail.style.border = '1px solid black';
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
			cList[i].style.color = 'red';
			inputs[i].style.border = '1px solid red';
			signinCmf.innerText = '';
			bList[i] = false;
		}
	}
	
	if(bList.length === bcnt){
		if(signinCk.checked === true && getCookie('cookie_email') !== signinEmail.value){
			setCookie('cookie_email', signinEmail.value);
		}
		else{
			deleteCookie('cookie_email');
		}
		signForm.submit();
	}
	else{
		return false;
	}
	
	
}

function setCookie(name, value, cday){
	let expire = new Date();
	expire.setDate(expire.getDate() + cday);
	cookies = name + '=' + escape(value) + '; path=/ ';
	if(typeof cday !== 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	document.cookie = cookies;

}

console.log(document.cookie);
if(getCookie('cookie_email') !== ''){
	signinCk.checked = true;
	signinEmail.value = getCookie('cookie_email');
}
else{
	signinCk.checked = false;
}


function getCookie(name) {
	name = name + '=';
	let cookieData = document.cookie;
	console.log('cookieData : ' + cookieData);
	let start = cookieData.indexOf(name);
	console.log('start : ' + start);
	let value = '';
	if(start !== -1){
		start += name.length;
		console.log('if start : ' + start);
		let end = cookieData.indexOf(';', start);
		console.log('end : ' + end);
		if(end === -1) end = cookieData.length;
		console.log('end : ' + end);
		value = cookieData.substring(start, end);
	}
	
	console.log('value : ' + value);
	console.log('unescape(value) : ' + unescape(value));
	
	return unescape(value);
}

function deleteCookie(name){
	setCookie(name, '', -1);
}



