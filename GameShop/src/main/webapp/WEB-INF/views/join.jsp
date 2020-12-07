<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/join.css" />
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
		document.joinForm.roadFullAddr.value = roadFullAddr;
}
</script>

<section class="joinSection">
	<div class="joinContainer">
		<div class="joinLogo"></div>
		<form name="joinForm" id="joinForm" class="joinForm" method="post" action="${cpath }/join/">
			<div>
				<input type="text" class="joinInput" id="joinName" name="name" placeholder="이름">
				<div class="nameCmf" id="nameCmf"></div>
			</div>
			
			<div>
				<input type="text" class="joinInput" id="joinNick" name="nickname" placeholder="닉네임">
				<div class="nkCmf" id="nkCmf"></div>
			</div>
			
			<div> 
				<input type="text" class="joinInput" id="joinEmail" name="email" placeholder="이메일">
				<div class="emailCmf" id="emailCmf"></div>
			</div>
			
			<div>
				<input type="password" class="joinInput" id="joinPw" name="password" placeholder="비밀번호">
				<div id="joinPwRuleMsg">※비밀번호는 8~20글자 사이, 영어 대(소)문자, 숫자, 특수문자가 포함되어야 합니다.</div>
				<div class="pwCmf" id="pwCmf"></div>
			</div>
			
			<div>
				<input type="password" class="pwComfirm" id="pwComfirm" placeholder="비밀번호 확인">
				<div class="pwCmf2" id="pwCmf2"></div>
			</div>
			
			<div class="joinAddrDiv">
				<input type="text" class="joinInput" id="roadFullAddr"  name="address" readonly="readonly" placeholder="주소찾기를 이용하세요."/>
				<input type="button" onclick="goPopup();" value="주소 찾기"/>
				<div class="addrCmf" id="addrCmf"></div>
			</div>
			
			<button id="joinSubmit">회원가입</button>
		</form>
	</div>
</section>

			
<script type="text/javascript" src="${cpath }/js/join.js"></script>
	
<%@ include file="footer.jsp" %>