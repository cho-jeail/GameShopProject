<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/signin.css" />

<script type="text/javascript">
	function naverPop(event){
		event.preventDefault();
		var url="${url}";
		window.open(url,"","width =400,height=500,left=600,top=200");
	}
</script>

<section class="signinSection">
	<div class="signinContainer">
		<div class="signinLogo"><a href="${cpath }">GAMEZ</a></div>
		<form class="signinForm" id="signinForm" method="post" action="${cpath }/signin/" >
			<div class="signDiv">
				<input type="text" class="signinInput" id="signinEmail" name="email" placeholder="이메일" value="${signEmail }">
				<div class="signCmf" id="signEmailCmf"></div>		
			</div>
			<div class="signDiv">
				<input type="password" class="signinInput" id="signinPw" name="password" onkeyup="enterkey()" placeholder="비밀번호">
				<div class="signCmf" id="signPwCmf"></div>
				<div class="signCmf" id="signinCmf">${signResult }</div>
			</div>
			<label class="signLabel">
				<input type="checkbox" class="signinCk" id="signinCk" name="regCk" >
				<span>자동 로그인</span>
			</label>
			<button type="button" id="signinBtn" class="signinBtn">로그인</button>
		</form>
		<div class="atagDiv">
			<a href="${cpath }/findpwd/">비밀번호를 잊으셨나요?</a> <a href="${cpath }/policy/">처음이신가요?</a>
		</div>
		
	</div>
	<div class="signinContainer2">
		<h3 class="signinH3">간편로그인</h3>
		<img onclick="naverPop(event)" class="naverLogin" src="${cpath }/resources/image/naverLogin.PNG" />
	</div>
</section>

<script type="text/javascript" src="${cpath}/js/signin.js"></script>
<%@ include file="footer.jsp" %>