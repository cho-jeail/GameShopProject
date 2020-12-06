let path = document.location.pathname;
let joinName = document.getElementById('joinName');
let joinNick = document.getElementById('joinNick');
let joinEmail = document.getElementById('joinEmail');
let joinPw = document.getElementById('joinPw');
let flagList = [];

document.getElementById('joinSubmit').addEventListener('click', submit);

joinName.addEventListener('blur', nameRegexp);
joinEmail.addEventListener('blur', nickRegexp);
joinEmail.addEventListener('blur', emailRegexp);
joinPw.addEventListener('blur', pwRegexp);

function nickChecked(){
	let nkCmf = document.getElementById('nkCmf');
	const request = new XMLHttpRequest();
    request.open("GET", path + '/checkNickname/' + joinNick.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');
   
	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			console.log("resp : " + response);
			let result = response
			if(result === '0'){
				nkCmf.innerText = '이미 사용중입니다.';
				nkCmf.style.color = 'red';
				joinNick.style.color = 'black';
				flagList[1] = false;
			}
			else{
				nkCmf.innerText = '사용가능합니다.';
				nkCmf.style.color = 'green';
				joinNick.style.color = 'black';
				flagList[1] = true;
			}
			
		}// end of if
		else{   // request.status !== 200 || request.readyState !== 4)
			alert('통신 실패');
		}  
	}   // end of function (onReadyStateChange)
	request.send();   // GET
}

function emailChecked(){
	let emailCmf = document.getElementById('emailCmf');
	const request = new XMLHttpRequest();
    request.open("GET", path + '/checkEmail/' + joinEmail.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');
   
	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			console.log("resp : " + response);
			let result = response
			if(result === '0'){
				emailCmf.innerText = '이미 사용중입니다.';
				emailCmf.style.color = 'red';
				joinEmail.style.color = 'black';
				flagList[2] = false;
			}
			else{
				emailCmf.innerText = '사용가능합니다.';
				emailCmf.style.color = 'green';
				joinEmail.style.color = 'black';
				flagList[2] = true;
			}
			
		}// end of if
		else{   // request.status !== 200 || request.readyState !== 4)
			alert('통신 실패');
		}  
	}   // end of function (onReadyStateChange)
	request.send();   // GET
}

// 이름 정규 표현식
function nameRegexp(){
	const nameRegExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	let nameCmf = document.getElementById('nameCmf');
	if(joinName.value !== '' && nameRegExp.test(joinName.value) === false){
		nameCmf.innerText = '잘못된 형식입니다.';
		nameCmf.style.color = 'red';
		joinName.style.color = 'black';
		flagList[0] = false;	
	}
	else{
		nameCmf.innerText = '';
		flagList[0] = true;
	}
}

// 닉네임 정규 표현식 및 중복확인
function nickRegexp(){
	const nickRegExp = /^[가-힣]{2,10}|[a-zA-Z]{2,20}|[a-zA-Z]{2,20}\s[a-zA-Z]{2,20}$/;
	let nkCmf = document.getElementById('nkCmf');
	if(joinNick.value !== '' && nickRegExp.test(joinNick.value) === false){
		nkCmf.innerText = '잘못된 형식입니다.';
		nkCmf.style.color = 'red';
		joinNick.style.color = 'black';
		flagList[1] = false;
	}
	else if(joinNick.value !== ''){
		nickChecked();
	}
	else{
		nkCmf.innerText = '';
		flagList[1] = true;
	}
	
	
}

// 이메일 정규 표현식 및 중복확인
function emailRegexp(){
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let emailCmf = document.getElementById('emailCmf');
	if(joinEmail.value !== '' && emailRegExp.test(joinEmail.value) === false){
		emailCmf.innerText = '잘못된 형식입니다.';
		emailCmf.style.color = 'red';
		joinEmail.style.color = 'black';
		flagList[2] = false;
	}
	else if(joinEmail.value !== ''){
		emailChecked();
	}
	else{
		emailCmf.innerText = '';
		flagList[2] = true;
	}
}

// 비밀번호 정규 표현식
function pwRegexp(){
	const pwRegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	let pwCmf = document.getElementById('pwCmf');
	if(joinPw.value !== '' && pwRegExp.test(joinPw.value) === false){
		pwCmf.innerText = '비밀번호 형식이 맞지 않습니다.'
		pwCmf.style.color = 'red';
		joinPw.style.color = 'black';
		flagList[3] = false;
	}
	else if(joinPw.value === ''){
		pwCmf.innerText = ''
		flagList[3] = false;
	}
	else{
		pwCmf.innerText = '사용가능합니다.'
		pwCmf.style.color = 'green';
		flagList[3] = true;
	}
}

function submit(event){
	event.preventDefault();
	
	inputs = document.querySelectorAll('input.joinInput');
	
	let flagCnt = 0;
	let blankCnt = 0;
	for(i = 0; i < flagList.length; i++){
		if(flagList[i] === true){
			flagCnt++;
		}
		else{
			inputs[i].style.border = '1px solid red';
		}		
	}
	for(i = 0; i < inputs.length; i++){
		if(inputs[i].value === ''){
			inputs[i].style.border = '1px solid red';
		}
		else{			
			blankCnt++;
		}
	}
	
	if(inputs.length === blankCnt && flagList.length === flagCnt){
		alert('회원가입 완료');
		let joinForm = document.getElementById('joinForm');
		joinForm.submit();
		console.log(joinForm);
	}
	else{
		alert('항목을 확인하세요');
		return false;
	}
}















