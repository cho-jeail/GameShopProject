document.getElementById('MOBtn').addEventListener('click', outConfirm);

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