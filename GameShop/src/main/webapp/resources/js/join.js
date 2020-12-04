let path = '/gameshop/policy/policy';
let policyArr = [];

readTextFiles();

function readTextFiles(){
	for(i = 0; i < 4; i++){
		policyArr[i] = document.getElementById('joinPolicy' + i);
		readTextFile(path + (i+1));
	}
}

function readTextFile(filePath){
	const policyFile = new XMLHttpRequest();
    	policyFile.open("GET", filePath + '.txt', true);
		policyFile.setRequestHeader('Content-type', 'text; charset=UTF-8');
   		policyFile.onreadystatechange = function (){
	        if(policyFile.readyState === 4) {
	            if(policyFile.status === 200 || policyFile.status == 0){
					let num = filePath.charAt(filePath.length-1)
	                textFile = policyFile.responseText;
					console.log(textFile);
					policyArr[num-1].innerHTML = textFile;
	            }
	        }
		}
	    policyFile.send();
}