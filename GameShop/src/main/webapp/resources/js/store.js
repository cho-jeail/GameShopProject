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