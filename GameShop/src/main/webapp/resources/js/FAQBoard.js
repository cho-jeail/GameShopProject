// FAQ에서 쓰이는 js
function FAQViewContent(target) {
    var GDiv = target.parentElement.parentElement
    var Content = GDiv.getElementsByClassName('CC_FAQContent');
    var display = Content[0].style.display;
    if (display === '' || display === 'none')
    	Content[0].style.display = 'block';
    else
    	Content[0].style.display = 'none';
}