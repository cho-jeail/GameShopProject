// 게시판 관련 JavaScript

function CCN_ClickSearch() {
    var NoticeSearchWord = document.getElementById('NoticeSearchWord').value;
    var NoticeSearchType = document.getElementById('NoticeSearchType').value;

    console.log('NoticeSearchWord : ' + NoticeSearchWord + ', NoticeSearchType : ' + NoticeSearchType);

    location.href = cpath + '/CCNotice/?NoticeSearchType=' + NoticeSearchType + '&NoticeSearchWord=' + NoticeSearchWord;
}