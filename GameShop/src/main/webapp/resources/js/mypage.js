let mypName = document.getElementById('mypName');
let mypNick = document.getElementById('mypNick');
let mypEmail = document.getElementById('mypEmail');
let mypPwd = document.getElementById('mypPwd');

let updBtn = document.getElementById('updBtn');
let cxBtn = document.getElementById('cxBtn');
let sBtn = document.getElementById('sBtn');

let infoList = [mypNick, mypEmail, mypPwd];

updBtn.addEventListener('click', updBtnClk);

function updBtnClk(){
	for(i = 0; i < infoList.length; i++){
		infoList[i].readOnly = '';
	}
	updBtn.style.display = 'none';
	cxBtn.style.display = 'block';
	sBtn.style.display = 'block';
}