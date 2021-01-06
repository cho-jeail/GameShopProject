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
			<div class="mypCoupon" id="mypCoupon">
				<div>
					<h2 class="mypH2">쿠폰내역</h2>
					<div id="couponList">
						<c:choose>
							<c:when test="${not empty userCoupons }">
								<c:forEach var="vo" items="${userCoupons }">
									<p>이름:${vo.name}</p>
									<p>번호:${vo.id }</p>
									<p>가격:${vo.salePrice }</p>
									<p>날짜:${vo.strDate }</p>
									<p>약관:${vo.fileUrl }</p>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div>
					<h2 class="mypH2">쿠폰등록</h2>
					<form class="regCForm" id="regCForm" method="post" action="${cpath }/mypage/mypageCoupon/regCoupon/" onsubmit="return false">
						<input type="text" name="id" class="regCoup" id="regCoup" onkeyup="enterkey()" placeholder="쿠폰번호를 입력하세요">
						<input type="hidden" name="userId" value="${signin.id }">
						<button type="button" class="regBtn" id="regBtn">쿠폰등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="${cpath }/js/mypageCoupon.js"></script>
<%@ include file="footer.jsp" %>