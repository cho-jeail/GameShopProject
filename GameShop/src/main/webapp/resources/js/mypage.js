let mypCPdiv = document.getElementById('mypCheckPwd');
let mypIFdiv = document.getElementById('mypInfo');
let mypCPdiv2 = document.getElementById('mypCheckPwd2');
let mypMOdiv = document.getElementById('MemberOut');

let mypIFC = document.getElementById('mypInfoContent');
let mypMO = document.getElementById('mypMemberOut');

let mypName = document.getElementById('mypName');
let mypNick = document.getElementById('mypNick');
let mypEmail = document.getElementById('mypEmail');
let mypPwd = document.getElementById('mypPwd');
let mypChkPw = document.getElementById('mypChkPw');
let mypChkPw2 = document.getElementById('mypChkPw2');

let mypNameCmf = document.getElementById('mypNameCmf');
let mypNickCmf = document.getElementById('mypNickCmf');
let mypEmailCmf = document.getElementById('mypEmailCmf');
let mypPwdCmf = document.getElementById('mypPwdCmf');
let mypChkPwCmf = document.getElementById('mypChkPwCmf');
let mypChkPwCmf2 = document.getElementById('mypChkPwCmf2');

let updBtn = document.getElementById('updBtn');
let cxBtn = document.getElementById('cxBtn');
let sBtn = document.getElementById('sBtn');

let mypCPBtn = document.getElementById('mypChkPwBtn');
let mypCPBtn2 = document.getElementById('mypChkPwBtn2');

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
mypCPBtn.addEventListener('click', mypChkPwd);
mypCPBtn2.addEventListener('click', mypChkPwd);

document.getElementById('info').addEventListener('click', checkingPwd);
document.getElementById('mbOut').addEventListener('click', checkingPwd2);
document.getElementById('MOBtn').addEventListener('click', outConfirm);

function enterkey() {
	 if (window.event.keyCode == 13) { mypChkPwd(event); } 
}

function updBtnClk(){
	for(i = 0; i < infoList.length; i++){
		infoList[i].readOnly = '';
	}
	updBtn.style.display = 'none';
	cxBtn.style.display = 'block';
	sBtn.style.display = 'block';
}

function cxBtnClk(){
	for(i = 0; i < infoList.length; i++){
		infoList[i].readOnly = 'readonly';
	}
	updBtn.style.display = 'block';
	cxBtn.style.display = 'none';
	sBtn.style.display = 'none';
}

function nickChecked(){
	const request = new XMLHttpRequest();
    request.open("GET", cpath + '/checkNickname/' + mypNick.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');

	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			console.log('닉네임 resp : ' + response);
			if(response === '사용중'){
				if(mypNick.value === seNick){
					mypNickCmf.innerText = '';
					flag = true;
				}
				else{
					mypNickCmf.innerText = '이미 사용중입니다.';
					mypNick.focus();					
				}
				mypNickCmf.style.color = 'red';
				mypNick.style.color = 'black';
			}
			else{
				mypNickCmf.innerText = '사용가능합니다.';
				mypNickCmf.style.color = 'green';
				mypNick.style.color = 'black';
				flag = true;
			}
		}// end of if
		else{   // request.status !== 200 || request.readyState !== 4)
			alert('통신 실패');
		}  
	}   // end of function (onReadyStateChange)
	request.send();   // GET
}

function emailChecked(){
	const request = new XMLHttpRequest();
    request.open("GET", cpath + '/checkEmail/' + mypEmail.value + '/', true); // false 사용 안됨
    request.setRequestHeader('Content-type', 'text; charset=UTF-8');
   
	request.onreadystatechange = function(){
		if(request.readyState == 4 || request.status == 200){
			let response = request.response;
			console.log("이메일 resp : " + response);
			if(response === "사용중"){
				if(mypEmail.value === seEmail){
					mypEmailCmf.innerText = '';
					flag = true;
				}
				else{
					mypEmailCmf.innerText = '이미 사용중입니다.';
					mypEmail.focus();			
				}
				mypEmailCmf.style.color = 'red';
				mypEmail.style.color = 'black';
			}
			else{
				mypEmailCmf.innerText = '사용가능합니다.';
				mypEmailCmf.style.color = 'green';
				mypEmail.style.color = 'black';
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
		mypNick.style.color = 'black';
		mypNick.focus();
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
		mypEmail.style.color = 'black';
		mypEmail.focus();
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
		mypPwd.style.color = 'black';
	}
	else if(mypPwd.value === ''){
		mypPwdCmf.innerText = ''
	}
	else{
		mypPwdCmf.innerText = '사용가능합니다.'
		mypPwdCmf.style.color = 'green';
		mypPwd2.readOnly = '';
		flag = true;
	}
}

// 비밀번호 확인
function pwComfirm(){
	let mypPwd2 = document.getElementById('mypPwd2');
	let mypPwd2Cmf = document.getElementById('mypPwd2Cmf');
	if(mypPwd.value !== ''){
		if(mypPwd.value !== mypPwd2.value){
			mypPwd2Cmf.innerText = '일치하지 않습니다.';
			mypPwd2Cmf.style.color = 'red';
			mypPwd2.style.color = 'black';
			mypPwd2.focus();
		}
		else if(pwC.value === ''){
			mypPwd2Cmf.innerText = '필수 입력바랍니다.'
			mypPwd2Cmf.style.color = 'red';
			mypPwd2.style.color = 'black';
			mypPwd2.focus();
		}
		else{
			mypPwd2Cmf.innerText = '일치합니다.'
			mypPwd2Cmf.style.color = 'green';
			mypPwd2.style.color = 'black';
			pwdCk = true;
		}
	}
}

function submit(event){
	event.preventDefault(); // 창 이동을 막음
	let mypAddr = document.getElementById('roadFullAddr');
	let mypForm = document.getElementById('mypForm');
	
	if(flag === true){
		for(i = 0; i < infoList.length; i++){
			infoList[i].readOnly = 'readonly';
		}
		mypPwd2.readOnly = 'readonly';
		setCookie("cookie_email", mypEmail.value);
		mypForm.submit();
	}
	else{
		alert('변동사항이 없습니다.');
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

function checkingPwd(){
	mypIFC.style.display = 'flex';
	mypMO.style.display = 'none';
	mypChkPw.value = '';
	mypChkPwCmf.innerText = '';
}

function checkingPwd2(){
	mypIFC.style.display = 'none';
	mypMO.style.display = 'flex';
	mypChkPw2.value = '';
	mypChkPwCmf2.innerText = '';
}

function mypChkPwd(event){
	event.preventDefault();
	let cmf = document.querySelectorAll('.mypChkPwCmf');
	let pwd = document.querySelectorAll('.mypChkPw');
	let form = document.querySelectorAll('.mypChkPwForm'); // form = document.forms[0]; <- 같은거

	if(mypIFC.style.display === 'none'){
		pwd = pwd[1];
		form = form[1];
		cmf = cmf[1];
	}
	else{
		pwd = pwd[0];
		form = form[0];
		cmf = cmf[0];
	}
	
	if(pwd.value === ''){
		cmf.innerText = '입력바랍니다.'
		return false;
	}
	else{
		formData = new FormData(form);
		ent = formData.entries();		// done(완료 여부), value ([0], [1])
		ob = {};
		while(true){
			next = ent.next();	
//			console.log(next);
			if(next.done == true)	break;
			ob[next.value[0]] = next.value[1];
		}
		
		jsonData = JSON.stringify(ob);	//	json형태로 만든다
		
		const request = new XMLHttpRequest();
		request.open("POST", cpath + '/chkPwd/', true);
		request.setRequestHeader('Content-type', 'application/json; charset=UTF-8');
		request.onreadystatechange = function(){
			if(request.readState == 4 || request.status == 200){
				let response = request.response;
				console.log(pwd.id);
				if(pwd.id === 'mypChkPw'){
					if(response === '인증완료'){
						mypCPdiv.style.display = 'none';
						mypIFdiv.style.display = 'flex';						
					}
					else{
						cmf.innerText = '일치하지 않습니다.';
						pwd.value = '';
					}
				}
				else{
					if(response === '인증완료'){
						mypCPdiv2.style.display = 'none';
						mypMOdiv.style.display = 'flex';
					}
					else{
						cmf.innerText = '일치하지 않습니다.';
						pwd.value = '';
					}
				}
			}
			else{
				alert('통신 실패!');
			}
		}
		request.send(jsonData);
	}
}

// 회원탈퇴
function outConfirm(){
	if(confirm('정말 탈퇴하시겠습니까?') === true){
		outForm = document.getElementById('MOutForm');
		console.log('확인');
		outForm.submit();
	}
	else{
		return;
	}
}


















