document.getElementById('searchCoup').addEventListener('click', selectCoup);
document.getElementById('regBtn').addEventListener('click', insertCoup);

if(signin === ''){
	alert('로그인 후 이용바랍니다.');
	window.location.href = cpath + '/signin/';
}

function enterkey() {
	 if (window.event.keyCode == 13) { insertCoup(); } 
}

function selectCoup(){
	form = document.getElementById('scForm');
	form.submit();
	document.getElementById('couponList').style.display = 'flex';
}

function insertCoup(){
	form = document.getElementById('regCForm');
	regData = document.getElementById('regCoup');
	if(regData.value === ''){
		alert('쿠폰번호를 입력하세요');
		return;
	}
	else{
		form.submit();	
	}
}