<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<script type="text/javascript" src="${cpath }/js/jusopop.js"></script>
<c:set var="signInfo" value="${signin }" />
<script type="text/javascript">
	signin = "${signInfo}";
	seId = "${signInfo.id}";
	seNick = "${signInfo.nickname}";
	seEmail = "${signInfo.email}";
	sePwd = "${signInfo.password}";
	seAddr = "${signInfo.address}";
</script>

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li><a href="${cpath }/mypage">회원정보</a></li>
				<li><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<div class="mypInfoContent" id="mypInfoContent">
				<h2 class="mypH2">회원정보 수정</h2>					 
				<div class="mypCheckPwd" id="mypCheckPwd">
					<div class="pwTextBox">- 사용자 확인을 위해 비밀번호를 입력하여주세요.</div>
					<form class="mypChkPwForm" id="mypChkPwForm" onsubmit="return false">
						<div class="mypChkPw_A" id="mypChkPw_A">
							<input type="password" class="mypChkPw" id="mypChkPw" name="password" onkeyup="enterkey()">
						</div>
						<div class="mypChkPw_B" id="mypChkPw_B">비밀번호 확인</div>
						<input type="hidden" name="id" value="${signin.id }">
					</form>
					<div class="mypChkPwd2">
						<div class="mypChkPwCmf" id="mypChkPwCmf"></div>
						<button type="button" id="mypChkPwBtn">확 인</button>					
					</div>
				</div>
				<div class="mypDiv1" id="mypDiv1">
					<form name="mypForm" class="mypForm" id="mypForm" method="post" action="${cpath }/updateInfo/" onsubmit="return false">
						<div class="mypFormInDiv">
							<div class="mypFIDTitle">사용자 이름</div>
							<input type="text" class="mypInput" id="mypName" name="name" value="${signin.name }" readonly="readonly">
						</div>
						
						<div class="mypFormInDiv">
							<div class="mypFIDTitle">닉네임</div>
							<input type="text" class="mypInput" id="mypNick" name="nickname" value="${signin.nickname }" readonly="readonly">
							<div class="mypCmf" id="mypNickCmf"></div>					
						</div>
						
						<div class="mypFormInDiv">
							<div class="mypFIDTitle">이메일</div>
							<input type="text" class="mypInput" id="mypEmail" name="email" value="${signin.email }" readonly="readonly">
							<div class="mypCmf" id="mypEmailCmf"></div>
						</div>
						 
						<div class="mypFormInDiv" id="mypFIDDivs">
							<div class="mypPwdDivs">
								<div class="mypFIDTitle">비밀번호</div>
								<input type="password" class="mypInput" id="mypPwd" name="password" readonly="readonly">
								<div class="mypCmf" id="mypPwdCmf"></div>
							</div>
							<div class="mypPwRuleMsg" id="mypPwRuleMsg">※ 비밀번호는 8~20글자 사이, 영어 대(소)문자, 숫자, 특수문자가 포함되어야 합니다.</div>
						</div>
						
						<div class="mypFormInDiv">
							<div class="mypFIDTitle">비밀번호 확인</div>
							<input type="password" class="mypInput" id="mypPwd2" name="pwd2" readonly="readonly">
							<div class="mypCmf" id="mypPwd2Cmf"></div>
						</div>
						
						<div class="mypFormInDiv">
							<div class="mypFIDTitle">주소</div>
							<input type="text" class="mypInput" id="roadFullAddr"  name="address" readonly="readonly" placeholder="주소찾기를 이용하세요." value="${signin.address }">
							<div class="addrBtnDiv">
								<button type="button" id="addrClsBtn">clear</button>
								<input type="button" onclick="goPopup();" value="주소 찾기" class="addrBtn" id="addrBtn"/>
							</div>
						</div>
						
						<input type="hidden" class="mypInput" name="id" value="${signin.id }">
					</form>
					<div class="mypInfoBtns">
						<button type="button" class="updBtn" id="updBtn">정보수정</button>
						<button type="button" class="cxBtn" id="cxBtn">취소</button>
						<button type="button" class="sBtn" id="sBtn">저장</button>
					</div>
				</div>
			</div>
	
			
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypage.js"></script>
<script type="text/javascript" src="${cpath }/js/mypCheckPwd.js"></script>
<%@ include file="footer.jsp" %>