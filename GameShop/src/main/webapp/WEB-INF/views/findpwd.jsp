<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/findpwd.css">

<section class="fpwdSection">
	<div class="fpwdContainer">
		<h2>비밀번호 찾기</h2>
		<span>임시비밀번호를 받기 위해 mail주소를 입력하세요</span>
		<form class="fpwdForm" id="fpwdForm" method="post" action="${cpath }/findPwd/">
			<h3>mail주소 입력</h3>
			<input type="text" class="fpwdEamil" id="fpwdEmail" name="email" placeholder="입력" value="${NFEval }">
			<div class="fmailCmf" id="fmailCmf">${NFE }</div>
			<button type="button" id="sendEmail">메일로 발송</button>
		</form>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/findpwd.js"></script>

<%@ include file="footer.jsp" %>