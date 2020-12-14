// 문의하기 페이지에 쓰이는 js

function FileSizeCheck(target) {
    var MaxFileSize = 1024 * 1024 * 2;
    var file = target.files;

    if (file[0].size > MaxFileSize) {
        alert('이미지 파일이 2Mb를 초과했습니다./n' + '다시 시도해주세요.');
        target.outerHTML = target.outerHTML;
    }
    else
        return;
}