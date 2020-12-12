<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/signin.css" />

<section class="signinSection">
	<div class="signinContainer">
		<div class="signinLogo"></div>
		<form class="signinForm" id="signinForm" method="post" action="${cpath }/signin/" >
			<input type="text" class="signinInput" id="signinEmail" name="email" placeholder="이메일" value="${signEmail }">
			<div class="signEmailCmf" id="signEmailCmf"></div>
			<input type="password" class="signinInput" id="signinPw" name="password" onkeyup="enterkey()" placeholder="비밀번호">
			<div class="signPwCmf" id="signPwCmf"></div>
			<div class="signinCmf" id="signinCmf">${signResult }</div>
			<input type="checkbox" class="signinCk" id="signinCk" name="regCk" >계정 기억
			<button type="button" id="signinBtn">SignIn</button>
		</form>
		<a href="${cpath }/findpwd/">비밀번호를 잊으셨나요?</a> <a href="${cpath }/policy/">회원가입</a>
	</div>
</section>

<script type="text/javascript" src="${cpath}/js/signin.js"></script>
<%@ include file="footer.jsp" %>