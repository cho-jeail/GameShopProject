<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<script type="text/javascript" src="${cpath }/js/jusopop.js"></script>
<c:set var="signInfo" value="${signin }" />
<script type="text/javascript">
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
				<li>회원정보</li>
				<li>구매내역</li>
				<li>위시리스트</li>
				<li>COUPON</li>
				<li><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li>회원탈퇴</li>
			</ul>
		</div>
		<div class="mypContents">
			<div class="mypInfoContent">
				<div class="mypCheckPwd">					 
					<form class="mypChkPwForm" id="mypChkPwForm" method="post" action="${cpath }/chkPwd/">
						<span>확인을 위해 비밀번호를 입력하여주세요</span>
						<input type="password" class="mypChkPw" id="mypChkPw" name="password">
						<div class="mypChkPwCmf" id="mypChkPwCmf"></div>
						<input type="hidden" name="id" value="${signin.id }">
						<button type="button" id="mypChkPwBtn">확인</button>
					</form>
				</div>
				<div class="mypInfo" id="mypInfo">
					<form name="mypForm" class="mypForm" id="mypForm" method="post" action="${cpath }/updateInfo/">
						<div>
							<span>이름</span>
							<input type="text" class="mypInput" id="mypName" name="name" value="${signin.name }" readonly="readonly">
							<div class="mypCmf" id="mypNameCmf"></div>
						</div>
						<div>
							<span>닉네임</span>
							<input type="text" class="mypInput" id="mypNick" name="nickname" value="${signin.nickname }" readonly="readonly">
							<div class="mypCmf" id="mypNickCmf"></div>					
						</div>
						<div>
							<span>이메일</span>
							<input type="text" class="mypInput" id="mypEmail" name="email" value="${signin.email }" readonly="readonly">
							<div class="mypCmf" id="mypEmailCmf"></div>
						</div>
						<div>
							<span>비밀번호</span>
							<input type="text" class="mypInput" id="mypPwd" name="password" readonly="readonly">
							<div class="mypCmf" id="mypPwdCmf"></div>
						</div>
						<div>
							<span>비밀번호 확인</span>
							<input type="text" class="mypInput" id="mypPwd2" name="pwd2" readonly="readonly">
							<div class="mypCmf" id="mypPwd2Cmf"></div>
						</div>
						<div class="joinAddrDiv">
							<input type="text" class="mypInput" id="roadFullAddr"  name="address" readonly="readonly" placeholder="주소찾기를 이용하세요." value="${signin.address }">
							<input type="button" onclick="goPopup();" value="주소 찾기"/>
							<div class="mypAddrCmf" id="mypAddrCmf"></div>
						</div>
						<input type="hidden" class="mypInput" name="id" value="${signin.id }">
					</form>
					<button type="button" class="updBtn" id="updBtn">정보수정</button>
					<button type="button" class="cxBtn" id="cxBtn">취소</button>
					<button type="button" class="sBtn" id="sBtn">저장</button>
				</div>
			</div>
			
			<div class="mypPurchaseList">
				
			</div>
			
			<div class="mypWishList">
				
			</div>
			
			<div class="mypCoupon">
				
			</div>
			
			<div class="mypQnAList">
				
			</div>
			
			<div class="mypMemberOut">
				
			</div>
			
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypage.js"></script>
<%@ include file="footer.jsp" %>