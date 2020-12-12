<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<script type="text/javascript" src="${cpath }/js/jusopop.js"></script>

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li>회원정보</li>
				<li>구매내역</li>
				<li>위시리스트</li>
				<li>문의내역</li>
				<li>회원탈퇴</li>
			</ul>
		</div>
		<div class="mypContents">
			<div class="mypInfo">
				<form name="mypForm" class="mypForm" id="mypForm" method="post" action="${cpath }/mypageInfo/">
					<span>이름</span><input type="text" class="mypInput" id="mypName" name="name" value="${signin.name }" readonly="readonly">
					<span>닉네임</span><input type="text" class="mypInput" id="mypNick" name="nickname" value="${signin.nickname }" readonly="readonly">
					<span>이메일</span><input type="text" class="mypInput" id="mypEmail" name="email" value="${signin.email }" readonly="readonly">
					<span>비밀번호</span><input type="text" class="mypInput" id="mypPwd" name="password" readonly="readonly">
					<span>비밀번호 확인</span><input type="text" class="mypInput" id="mypPwdCmf" name="pwd2" readonly="readonly">
					<div class="joinAddrDiv">
						<input type="text" class="mypInput" id="roadFullAddr"  name="address" readonly="readonly" placeholder="주소찾기를 이용하세요."/>
						<input type="button" onclick="goPopup();" value="주소 찾기"/>
						<div class="addrCmf" id="addrCmf"></div>
					</div>
				</form>
				<button type="button" class="updBtn" id="updBtn">정보수정</button>
				<button type="button" class="cxBtn" id="cxBtn">취소</button>
				<button type="button" class="sBtn" id="sBtn">저장</button>
			</div>
			
			<div class="mypPurchaseList">
				
			</div>
			
			<div class="mypWishList">
				
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