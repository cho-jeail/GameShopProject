<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<script type="text/javascript" src="${cpath }/js/jusopop.js"></script>
<c:set var="signInfo" value="${signin }" />
<% pageContext.setAttribute("EnterChar", "\n"); %>
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
				<li class="mypLi"><a href="${cpath }/mypage">회원정보</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li class="mypLi" id="mypLiOn"><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<h2 class="mypH2">문의 내역</h2>
			<div class="MypContentBox">
				<h3 class="mypQnatitle">${QnaBoard.title }</h3>
				<p class="mypQnaInfo">
					구분 :&nbsp;
					<c:choose>
						<c:when test="${QnaBoard.category eq 'product' }">
							상품문의
						</c:when>
						<c:when test="${QnaBoard.category eq 'order' }">
							주문 및 결제문의
						</c:when>
						<c:when test="${QnaBoard.category eq 'cancel' }">
							주문취소 및 환불
						</c:when>
						<c:when test="${QnaBoard.category eq 'other' }">
							기타문의
						</c:when>
					</c:choose>
					&nbsp;| 작성일 : <fmt:formatDate value="${QnaBoard.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" />
				</p>
				<p class="MypQnaContent">${fn:replace(QnaBoard.content, EnterChar, '<br>') }</p>
				<c:if test="${QnaBoard.image1 ne 'null' }">
					<img alt="" src="${cpath }/img/${QnaBoard.image1 }" style="width: 500px;"><br>
				</c:if>
				<c:if test="${QnaBoard.image2 ne 'null' }">
					<img alt="" src="${cpath }/img/${QnaBoard.image2 }" style="width: 500px;"><br>
				</c:if>
				<c:if test="${QnaBoard.image3 ne 'null' }">
					<img alt="" src="${cpath }/img/${QnaBoard.image3 }" style="width: 500px;"><br>		
				</c:if>
				<input class="MypQnaIndexbutton" type="button" onclick="location.href='${cpath}/mypage/mypQna/'" value="목록">
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>