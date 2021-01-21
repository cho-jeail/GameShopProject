// gameIntro에서 쓰이는 js

function newGame() { 
	var newGame = "new";
	var form = document.createElement("form");
	var input_pd = document.createElement("input");

	form.setAttribute("method", "post");
	input_pd.setAttribute("type", "hidden");
	input_pd.setAttribute("name", "name");
	input_pd.setAttribute("value", newGame);
	document.body.appendChild(form);
	form.appendChild(input_pd);
	
	form.submit();
}

function freeGame() { 
	var freeGame = "free";
	var form = document.createElement("form");
	var input_pd = document.createElement("input");

	form.setAttribute("method", "post");
	input_pd.setAttribute("type", "hidden");
	input_pd.setAttribute("name", "name");
	input_pd.setAttribute("value", freeGame);
	document.body.appendChild(form);
	form.appendChild(input_pd);
	
	form.submit();
}

function favoGame() { 
	var favoGame = "favo";
	var form = document.createElement("form");
	var input_pd = document.createElement("input");

	form.setAttribute("method", "post");
	input_pd.setAttribute("type", "hidden");
	input_pd.setAttribute("name", "name");
	input_pd.setAttribute("value", favoGame);
	document.body.appendChild(form);
	form.appendChild(input_pd);
	
	form.submit();
}

function discGame() { 
	var discGame = "disc";
	var form = document.createElement("form");
	var input_pd = document.createElement("input");

	form.setAttribute("method", "post");
	input_pd.setAttribute("type", "hidden");
	input_pd.setAttribute("name", "name");
	input_pd.setAttribute("value", discGame);
	document.body.appendChild(form);
	form.appendChild(input_pd);
	
	form.submit();
}

function filter() {
	var kind;
	var developer;
	var kd = document.getElementById('kind');
	var devl = document.getElementById('developer');
	// window.location.pathname -> 현재 주소의 경로를 가져온다.
		
	for(i = 0; i < kd.options.length; i++) {
		if(kd.options[i].selected == true) {
			kind = kd.options[i].value;
			break;
		}
	}
		
	for(i = 0; i < devl.options.length; i++) {
		if(devl.options[i].selected == true) {
			developer = devl.options[i].value;
			break;
		}
	}
		
	var form = document.createElement("form");
	var input_kind = document.createElement("input");
	var input_devl = document.createElement("input");
		
	form.setAttribute("method", "post");
		
	input_kind.setAttribute("type", "hidden");
	input_kind.setAttribute("name", "kind");
	input_kind.setAttribute("value", kind);
	input_devl.setAttribute("type", "hidden");
	input_devl.setAttribute("name", "developer");
	input_devl.setAttribute("value", developer);
		
	document.body.appendChild(form);
		
	form.appendChild(input_kind);
	form.appendChild(input_devl);
		
	form.submit();
}

