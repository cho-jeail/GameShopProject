// paging 관련 javascript

var PagePrev = document.getElementById('PagePrev');
var PageNext = document.getElementById('PageNext');
var uri = cpath + '/CCNotice/?';
if (NSearchWord !== '') {
    uri += 'NoticeSearchType=' + NSearchType + '&NoticeSearchWord=' + NSearchWord + '&';
    console.log(uri);
}

if(prev === true) {
    PagePrev.setAttribute('href', uri + 'page=' + (parseInt(begin) - parseInt(perSection)));
}
else {
    PagePrev.setAttribute('href', 'javascript:void(0)');
}

if(next === true) {
    PageNext.setAttribute('href', uri + 'page=' + (parseInt(end) + 1));
}
else {
    PageNext.setAttribute('href', 'jacascript:void(0)');
}