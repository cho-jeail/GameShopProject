let filePath = '/gameshop/policy/purchase';
let purchase = document.getElementById('purchase');

readTextFile();

console.log("filePath" + filePath);
function readTextFile(){
	const policyFile = new XMLHttpRequest();
    policyFile.open("GET", filePath + '.txt', true);
	policyFile.setRequestHeader('Content-type', 'text; charset=UTF-8');
   	policyFile.onreadystatechange = function (){
		if(policyFile.readyState === 4) {
	    	if(policyFile.status === 200 || policyFile.status == 0){
	        	textFile = policyFile.responseText;
				purchase.innerHTML = textFile;
				console.log("textFile : " + textFile);
	        }
	    }
	}
	policyFile.send();
}