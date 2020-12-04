<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/join.css" />
	<section class="joinSection">
		<div class="joinContainer">
			<div class="joinTOSTitleBox"> 
				<h2>최종 이용자 라이선스 계약</h2>
				<div>*필수</div>
			</div>
			
			<div class="joinTOSSet">
				<div class="joinTOS" id="joinPolicy0"></div>
				<input type="checkbox" id="ckBox0" class="ckBoxes"> <span class="joinUnderLine">이용약관</span>에 동의힙니다. <span class="joinRed">*</span>
			</div>
			
			<div class="joinTOSSet">
				<div class="joinTOS" id="joinPolicy1"></div>
				<input type="checkbox" id="ckBox1" class="ckBoxes"> <span class="joinUnderLine">개인정보 수집 및 사용</span>에 동의힙니다. <span class="joinRed">*</span>
			</div>
			
			<div class="joinTOSSet">
				<div class="joinTOS" id="joinPolicy2"></div>
				<input type="checkbox" id="ckBox2" class="ckBoxes"> <span class="joinUnderLine">개인정보 해외전송</span>에 동의힙니다. <span class="joinRed">*</span>
			</div>
			
			<div class="joinTOSSet">
				<div class="joinTOS" id="joinPolicy3"></div>
				<input type="checkbox" id="ckBox3" class="ckBoxes"> <span class="joinUnderLine">홍보성 알림 이메일 수신</span>에 동의힙니다.
			</div>
			
		</div>
	</section>
<script type="text/javascript" src="${cpath }/js/join.js"></script>
	
<%@ include file="footer.jsp" %>