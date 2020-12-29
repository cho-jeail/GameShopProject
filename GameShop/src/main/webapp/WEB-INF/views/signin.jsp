<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/signin.css" />

<section class="signinSection">
	<div class="signinContainer">
		<div class="signinLogo"></div>
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
				<span>계정 기억하기</span>
			</label>
			<button type="button" id="signinBtn" class="signinBtn">로그인</button>
		</form>
		<div class="atagDiv">
			<a href="${cpath }/findpwd/">비밀번호를 잊으셨나요?</a> <a href="${cpath }/policy/">처음이신가요?</a>
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath}/js/signin.js"></script>
<%@ include file="footer.jsp" %>