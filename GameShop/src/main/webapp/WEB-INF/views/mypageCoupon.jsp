<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<script type="text/javascript">
	couponMsg = "${couponMsg}";
	if(couponMsg !== ''){
		alert(couponMsg);
	}
</script>

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li class="mypLi"><a href="${cpath }/mypage">회원정보</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li class="mypLi" id="mypLiOn"><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<div class="mypCoupon" id="mypCoupon">
				<div>
					<h2 class="mypH2">COUPONS</h2>
					<div class="couponList">
						<c:choose>
							<c:when test="${not empty userCoupons }">
								<c:forEach var="vo" items="${userCoupons }">
									<div class="coupon">
										<div class="couponHeader">
											<div class="cpSiteName">GAMEZ</div>
											<div class="cpVali">유효기간: ${vo.strDate }</div>
										</div>
										<div class="couponBody">
											<div class="cpName">${vo.name}</div>
											<div class="cpPrice">${vo.salePrice }원 할인</div>
										</div>
										<div class="couponFooter">
											<div class="cpTos"><span>이용약관</span><br>
												${vo.fileUrl }
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="emptyCoupon">쿠폰이 없습니다.</div>
							</c:otherwise>
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