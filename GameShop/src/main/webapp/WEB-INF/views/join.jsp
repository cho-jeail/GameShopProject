<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/join.css" />
<script type="text/javascript" src="${cpath }/js/jusopop.js"></script>

<section class="joinSection">
	<div class="joinContainer">
		<div class="joinLogo"><a href="${cpath }">GAMEZ</a></div>
		<form name="joinForm" id="joinForm" class="joinForm" method="post" action="${cpath }/join/">
			<div class="joinDivs">
				<label class="joinLabel">
					<span>- 사용자 이름 -</span>
					<input type="text" class="joinInput" id="joinName" name="name" placeholder="이름">				
				</label>
				<div class="joinCmf" id="nameCmf"></div>
			</div>
			
			<div class="joinDivs">
				<label class="joinLabel">
					<span>- 닉네임 -</span>
					<input type="text" class="joinInput" id="joinNick" name="nickname" placeholder="닉네임">				
				</label>
				<div class="joinCmf" id="nkCmf"></div>
			</div>
			
			<div class="joinDivs"> 
				<label class="joinLabel">
					<span>- 이메일 -</span>
					<input type="text" class="joinInput" id="joinEmail" name="email" placeholder="이메일">
				</label>
				<div class="joinCmf" id="emailCmf"></div>
			</div>
			
			<div class="joinDivs" id="joinDivs_pwd">
				<label class="joinLabel">
					<span>- 비밀번호 -</span>
					<input type="password" class="joinInput" id="joinPw" name="password" placeholder="비밀번호">
				</label>
				<div class="joinPwRuleMsg" id="joinPwRuleMsg">※ 비밀번호는 8~20글자 사이, 영어 대(소)문자, 숫자, 특수문자가 포함되어야 합니다.</div> 
				<div class="joinCmf" id="pwCmf"></div>
				<input type="password" class="pwComfirm" id="pwComfirm" placeholder="비밀번호 확인">
				<div class="joinCmf" id="pwCmf2"></div>
			</div>
			
			
			<div class="joinDivs" id="joinDivs_addr">
				<label class="joinLabel">
					<span>- 주소 -</span>
					<input type="text" class="joinInput" id="roadFullAddr"  name="address" readonly="readonly" placeholder="주소찾기를 이용하세요."/>
				</label>
				<div class="addrBtnDiv">
					<button type="button" id="addrClsBtn">clear</button>
					<input type="button" onclick="goPopup();" value="주소 찾기" class="addrBtn"/>
				</div>
			</div>
			
			<button type="button" id="joinSubmit">회원가입</button>
		</form>
	</div>
</section>

			
<script type="text/javascript" src="${cpath }/js/join.js"></script>
	
<%@ include file="footer.jsp" %>