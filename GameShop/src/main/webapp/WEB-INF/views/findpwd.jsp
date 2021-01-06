<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/findpwd.css">

<section class="fpwdSection">
	<div class="fpwdContainer">
		<h2>임시 비밀번호 발급</h2>
		
		<span>임시비밀번호를 발급받기 위해 E-mail주소를 입력하세요.</span>
		<br>
		<form class="fpwdForm" id="fpwdForm" method="post" action="${cpath }/findPwd/" onsubmit="return false">	
			<div class="formMainDiv1">
				<div class="formDiv1" id="formDiv1">
					<input type="text" class="fpwdEamil" id="fpwdEmail" name="email">
				</div>
				<div class="formDiv2" id="formDiv2">E-mail주소 입력</div>
			</div>
			<div class="formDiv3">
				<div class="fmailCmf" id="fmailCmf"></div>
				<button type="button" id="sendEmail">메일 발송</button>
			</div>
		</form>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/findpwd.js"></script>

<%@ include file="footer.jsp" %>