let mypNick = document.getElementById('mypNick');
let mypEmail = document.getElementById('mypEmail');
let mypPwd = document.getElementById('mypPwd');

let mypNickCmf = document.getElementById('mypNickCmf');
let mypEmailCmf = document.getElementById('mypEmailCmf');
let mypPwdCmf = document.getElementById('mypPwdCmf');

let mypPwd2 = document.getElementById('mypPwd2');
let mypPwd2Cmf = document.getElementById('mypPwd2Cmf');
let addr = document.getElementById('roadFullAddr');

let updBtn = document.getElementById('updBtn');
let cxBtn = document.getElementById('cxBtn');
let sBtn = document.getElementById('sBtn');
let addrBtn = document.getElementById('addrBtn');
let addrClsBtn = document.getElementById('addrClsBtn');

let infoList = [mypNick, mypEmail, mypPwd];
let flag = false;
let pwdCk = false;

mypNick.addEventListener('blur', nickRegexp);
mypEmail.addEventListener('blur', emailRegexp);
mypPwd.addEventListener('blur', pwRegexp);
mypPwd2.addEventListener('blur', pwComfirm);

updBtn.addEventListener('click', updBtnClk);
cxBtn.addEventListener('click', cxBtnClk);
sBtn.addEventListener('click', submit);
addrClsBtn.addEventListener('click', clearAddr);

function clearAddr(){
	document.getElementById('roadFullAddr').value = null;
}

function updBtnClk(){
	if(naverState !== ''){
		alert('네이버 아이디로 로그인하신 경우 해당기능을 이용하실 수 없습니다.');
		return;
	}
	
	for(i = 0; i < infoList.length; i++){
		infoList[i].readOnly = '';
		infoList[i].style.border = '1px solid #dcd6dc';
	}
	updBtn.style.display = 'none';
	cxBtn.style.display = 'block';
	sBtn.style.display = 'block';
	mypPwd2.style.border = '1px solid #dcd6dc';
	addr.style.border = '1px solid #dcd6dc';
	addrBtn.style.display = 'block';
	addrClsBtn.style.display = 'block';
}

function cxBtnClk(){
	for(i = 0; i < infoList.length; i++){
		infoList[i].readOnly = 'readonly';
		infoList[i].style.border = 'none';
	}
	updBtn.style.display = 'block';
	cxBtn.style.display = 'none';
	sBtn.style.display = 'none';
	mypPwd2.style.border = 'none';
	addr.style.border = 'none';
	addrBtn.style.display = 'none';
	addrClsBtn.style.display = 'none';
}

// 닉네임 중복확인
function nickChecked(){
	const request = new XMLHttpRequest();
    request.open("GET", cpath + '/checkNickname/' + mypNick.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');

	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			if(response === '사용중'){
				if(mypNick.value === seNick){
					mypNickCmf.innerText = '';
					flag = true;
				}
				else{
					mypNickCmf.innerText = '이미 사용중입니다.';				
				}
				mypNickCmf.style.color = 'red';
			}
			else{
				mypNickCmf.innerText = '사용가능합니다.';
				mypNickCmf.style.color = '#00ff40';
				flag = true;
			}
		}// end of if
		else{   // request.status !== 200 || request.readyState !== 4)
			alert('통신 실패');
		}  
	}   // end of function (onReadyStateChange)
	request.send();   // GET
}

// 이메일 중복확인
function emailChecked(){
	const request = new XMLHttpRequest();
    request.open("GET", cpath + '/checkEmail/' + mypEmail.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');
   
	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			if(response === "사용중"){
				if(mypEmail.value === seEmail){
					mypEmailCmf.innerText = '';
					flag = true;
				}
				else{
					mypEmailCmf.innerText = '이미 사용중입니다.';		
				}
				mypEmailCmf.style.color = 'red';
			}
			else{
				mypEmailCmf.innerText = '사용가능합니다.';
				mypEmailCmf.style.color = '#00ff40';
				flag = true;
			}		
		}// end of if
		else{   // request.status !== 200 || request.readyState !== 4)
			alert('통신 실패');
		}  
	}   // end of function (onReadyStateChange)
	request.send();   // GET
}


// 닉네임 정규 표현식 및 중복확인
function nickRegexp(){
	const nickRegExp = /^[가-힣]{2,10}|[a-zA-Z]{2,20}|[a-zA-Z]{2,20}\s[a-zA-Z]{2,20}$/;
	if(mypNick.value !== '' && nickRegExp.test(mypNick.value) === false){
		mypNickCmf.innerText = '잘못된 형식입니다.';
		mypNickCmf.style.color = 'red';
	}
	else if(mypNick.value !== ''){
		nickChecked();
	}
	else{
		mypNickCmf.innerText = '';
		flag = true;
	}	
}

// 이메일 정규 표현식 및 중복확인
function emailRegexp(){
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(mypEmail.value !== '' && emailRegExp.test(mypEmail.value) === false){
		mypEmailCmf.innerText = '잘못된 형식입니다.';
		mypEmailCmf.style.color = 'red';
	}
	else if(mypEmail.value !== ''){
		emailChecked();
	}
	else{
		mypEmailCmf.innerText = '';
		flag = true;
	}
}

// 비밀번호 정규 표현식
function pwRegexp(){
	const pwRegExp = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(mypPwd.value !== '' && pwRegExp.test(mypPwd.value) === false){
		mypPwdCmf.innerText = '비밀번호 형식이 맞지 않습니다.'
		mypPwdCmf.style.color = 'red';
	}
	else if(mypPwd.value === ''){
		mypPwdCmf.innerText = ''
	}
	else{
		mypPwdCmf.innerText = '사용가능합니다.'
		mypPwdCmf.style.color = '#00ff40';
		mypPwd2.readOnly = '';
		flag = true;
	}
}

// 비밀번호 확인
function pwComfirm(){
	if(mypPwd.value !== ''){
		if(mypPwd.value !== mypPwd2.value){
			mypPwd2Cmf.innerText = '일치하지 않습니다.';
			console.log("일치안함");
			mypPwd2Cmf.style.color = 'red';
		}
		else if(mypPwd2.value === ''){
			mypPwd2Cmf.innerText = '필수 입력바랍니다.'
			mypPwd2Cmf.style.color = 'red';
		}
		else{
			mypPwd2Cmf.innerText = '일치합니다.'
			mypPwd2Cmf.style.color = '#00ff40';
			console.log("일치안함");
			pwdCk = true;
		}
	}
}

// 회원정보수정
function submit(event){
	event.preventDefault(); // 창 이동을 막음
	let mypAddr = document.getElementById('roadFullAddr');
	let mypForm = document.getElementById('mypForm');
	
	if(flag === true){
		for(i = 0; i < infoList.length; i++){
			infoList[i].readOnly = 'readonly';
		}
		mypPwd2.readOnly = 'readonly';
		mypForm.submit();
	}
	else{
		alert('변동사항이 없습니다.');
		return false;
	}
}





















