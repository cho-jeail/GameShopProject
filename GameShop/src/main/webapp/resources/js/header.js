/**
 * 
 */
function search() {
	var word = document.getElementById('SearchWord');
	
	var form = document.createElement("form");
	var input_word = document.createElement("input");
	
	form.setAttribute("method", "post");
	form.setAttribute("action", "${cpath}/searchWord/");
	
	input_word.setAttribute("type", "hidden");
	input_word.setAttribute("name", "word");
	input_word.setAttribute("value", word);
	document.body.appendChild(form);
	
	form.appendChild(input_word);
	
	form.submit();
}