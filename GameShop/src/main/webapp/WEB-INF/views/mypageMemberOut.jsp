<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
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
			<div class="mypMemberOut" id="mypMemberOut">
				<div class="mypCheckPwd" id="mypCheckPwd">
					<h2>탈퇴</h2>					 
					<form class="mypChkPwForm" id="mypChkPwForm" onSubmit="return false">
						<span>확인을 위해 비밀번호를 입력하여주세요</span>
						<input type="password" class="mypChkPw" id="mypChkPw" name="password" onkeyup="enterkey()">
						<div class="mypChkPwCmf" id="mypChkPwCmf"></div>
						<input type="hidden" name="id" value="${signin.id }">
						<button type="button" id="mypChkPwBtn">확인</button>
					</form>
				</div>
				<div class="mypDiv1" id="mypDiv1">
					<h2>탈퇴</h2>
					<p>정말로 탈퇴하시겠습니까? 탈퇴하시고 다시 가입하셔도 이전 쿠폰들을 이용할 수 없습니다.</p>
					<p>탈퇴 사유를 자유롭게 작성하여 주세요(필수 아님)</p>
					<form class="MOutForm" id="MOutForm" method="post" action="${cpath }/mypage/mypageMemberOut/" onsubmit="return false" >
						<textarea rows="5" cols="40" name="outreason" id="outReason" class="outReason" maxlength="300"></textarea>
						<input type="hidden" name="id" value="${signin.id }">
						<button type="button" id="MOBtn">회원탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypCheckPwd.js"></script>
<script type="text/javascript" src="${cpath }/js/mypageMemberOut.js"></script>
<%@ include file="footer.jsp" %>