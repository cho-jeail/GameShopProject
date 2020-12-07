<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/signin.css" />

<section class="signinSection">
	<div class="signinContainer">
		<div class="signinLogo"></div>
		<form class="signinForm" id="signinForm" method="post" action="${cpath }/signin/" >
			<input type="text" class="signinInput" id="signinEmail" name="email" placeholder="이메일">
			<div class="signEmailCmf" id="signEmailCmf"></div>
			<input type="password" class="signinInput" id="signinPw" name="password" placeholder="비밀번호">
			<div class="signPwCmf" id="signPwCmf"></div>
			<div class="signinCmf" id="signinCmf">${signResult }</div>
			<button type="button" id="signinBtn">SignIn</button>
		</form>
	</div>
</section>

<script type="text/javascript" src="${cpath}/js/signin.js"></script>
</body>
</html>