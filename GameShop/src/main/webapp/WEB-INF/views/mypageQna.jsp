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
			<h2>문의 내역</h2>
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypage.js"></script>
<%@ include file="footer.jsp" %>