// paging 관련 javascript

console.log('next : ' + next + ', prev : ' + prev);
console.log('begin : ' + begin + ', end : ' + end);
console.log('perSection : ' + perSection);

var PagePrev = document.getElementById('PagePrev');
var PageNext = document.getElementById('PageNext');

if(prev === true) {
    console.log('prev true 들어옴');
    PagePrev.setAttribute('href', cpath + '/CCNotice/' + (parseInt(begin) - parseInt(perSection)) + '/');
}
else {
    console.log('prev false 들어옴');
    PagePrev.setAttribute('href', 'javascript:void(0)');
}

if(next === true) {
    console.log('next true 들어옴');
    console.log('end + 1 : ' + (parseInt(end) + 1));
    PageNext.setAttribute('href', cpath + '/CCNotice/' + (parseInt(end) + 1) + '/');
}
else {
    console.log('next false 들어옴');
    PageNext.setAttribute('href', 'jacascript:void(0)');
}