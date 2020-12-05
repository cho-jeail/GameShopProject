<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/gameshop/jusoPopup/","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.joinform.roadFullAddr.value = roadFullAddr;
}
</script>

	<h1>회원가입</h1>
	<form name="joinform" id="joinform" method="post">
		<input type="text" id="name" name="name" placeholder="이름">
		<input type="text" id="nickName" name="nickName" placeholder="닉네임">
		<input type="text" id="email" name="email" placeholder="이메일">
		<input type="password" id="password" name="password" placeholder="비밀번호">
		<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
		<div id="list"></div>
		<div id="callBackDiv">
		<table>
			<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="address" /></td></tr>		
		</table>
		</div>
		<input type="submit" value="회원가입">
	</form>
	
<%@ include file="footer.jsp" %>