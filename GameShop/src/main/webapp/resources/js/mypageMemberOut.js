document.getElementById('MOBtn').addEventListener('click', outConfirm);

if(signin === ''){
	alert('로그인 후 이용바랍니다.');
	window.location.href = cpath + '/signin/';
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