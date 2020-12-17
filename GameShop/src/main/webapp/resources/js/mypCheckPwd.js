let mypCPdiv = document.getElementById('mypCheckPwd');
let mypDiv = document.getElementById('mypDiv1');
let mypCPBtn = document.getElementById('mypChkPwBtn');
mypCPBtn.addEventListener('click', mypChkPwd);

function enterkey() {
	 if (window.event.keyCode == 13) { mypChkPwd(event); } 
}

// 비밀번호 확인
function mypChkPwd(event){
	event.preventDefault();
	let cmf = document.getElementById('mypChkPwCmf');
	let pwd = document.getElementById('mypChkPw');
	let form = document.getElementById('mypChkPwForm'); // form = document.forms[0]; <- 같은거

	console.log()
	
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
				if(response === '인증완료'){
					mypCPdiv.style.display = 'none';
					mypDiv.style.display = 'flex';						
				}
				else{
					cmf.innerText = '일치하지 않습니다.';
					pwd.value = '';
				}
			}
			else{
				alert('통신 실패!');
			}
		}
		request.send(jsonData);
	}
}