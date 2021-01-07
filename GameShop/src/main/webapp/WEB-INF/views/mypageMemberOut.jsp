<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li class="mypLi"><a href="${cpath }/mypage">회원정보</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li class="mypLi" id="mypLiOn"><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<div class="mypMemberOut" id="mypMemberOut">
				<h2 class="mypH2">회원탈퇴</h2>					 
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
					<div class="outTextDiv">- 정말로 탈퇴하시겠습니까? 탈퇴하시고 다시 가입하셔도 이전 쿠폰들을 이용할 수 없습니다.</div>
					<form class="MOutForm" id="MOutForm" method="post" action="${cpath }/mypage/mypageMemberOut/" onsubmit="return false" >
						<div class="outTextArea">
							<textarea rows="5" cols="40" name="outreason" id="outReason" class="outReason" maxlength="200" placeholder="200자 이내"></textarea>						
						</div>
						<div class="outReasonTitle">탈퇴 사유를 자유롭게 작성하여 주세요. <span>( 필수 <span style="color: red;">X</span> )</span></div>
						<input type="hidden" name="id" value="${signin.id }">
					</form>
					<button type="button" id="MOBtn">회원탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypCheckPwd.js"></script>
<script type="text/javascript" src="${cpath }/js/mypageMemberOut.js"></script>
<%@ include file="footer.jsp" %>