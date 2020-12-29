<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/policy.css" />

<section class="policySection">
	<div class="policyContainer"> 
		<div class="policyTOSTitleBox"> 
			<h2>최종 이용자 라이선스 계약</h2>
			<div>*필수</div>
		</div>
		
		<div class="policyTOSSet">
			<div class="policyTOS" id="policyPolicy0"></div>
			<label>
				<input type="checkbox" id="ckBox0" class="ckBoxes"> 
				<span class="policyUnderLine">이용약관</span><span class="otherText">에 동의합니다.</span>
				<span class="policyRed">*</span>
			</label>
		</div>
		
		<div class="policyTOSSet">
			<div class="policyTOS" id="policyPolicy1"></div>
			<label>
				<input type="checkbox" id="ckBox1" class="ckBoxes"> 
				<span class="policyUnderLine">개인정보 수집 및 사용</span><span class="otherText">에 동의합니다.</span> 
				<span class="policyRed">*</span>
			</label>
		</div>
		
		<div class="policyTOSSet">
			<div class="policyTOS" id="policyPolicy2"></div>
			<label>
				<input type="checkbox" id="ckBox2" class="ckBoxes"> 
				<span class="policyUnderLine">개인정보 해외전송</span><span class="otherText">에 동의합니다.</span>
				<span class="policyRed">*</span>
			</label>
		</div>
		
		<div class="policyTOSSet">
			<div class="policyTOS" id="policyPolicy3"></div>
			<label>
				<input type="checkbox" id="ckBox3" class="ckBoxes"> 
				<span class="policyUnderLine">홍보성 알림 이메일 수신</span><span class="otherText">에 동의합니다.</span>
			</label>
		</div>
		
		<div class="policyBtns1">
			<input type="button" onclick="location.href='${cpath}'" value="취소하기">
			<input type="button" onclick="checkedPolicy()" value="다음으로">
		</div>
	</div>
		
</section>

<script type="text/javascript" src="${cpath }/js/policy.js"></script>
	
<%@ include file="footer.jsp" %>