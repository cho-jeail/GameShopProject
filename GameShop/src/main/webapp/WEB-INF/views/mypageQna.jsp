<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<table>
				<tr>
					<th class="mypContentsNum">번호</th>
					<th class="mypContentsCat">구분</th>
					<th class="mypContentsTit">제목</th>
					<th class="mypContentsDat">작성일자</th>
				</tr>
				<c:forEach items="${QnaList }" var="QnaVO" varStatus="iNum">
					<tr>
						<td class="mypContentsNum">${iNum.count }</td>
						<td class="mypContentsCat">
						<c:choose>
							<c:when test="${QnaVO.category eq 'product' }">
								상품문의
							</c:when>
							<c:when test="${QnaVO.category eq 'order' }">
								주문 및 결제문의
							</c:when>
							<c:when test="${QnaVO.category eq 'cancel' }">
								주문취소 및 환불
							</c:when>
							<c:when test="${QnaVO.category eq 'other' }">
								기타문의
							</c:when>
						</c:choose>
						</td>
						<td class="mypContentsTit"><a href="${cpath }/mypage/mypQna/${QnaVO.id }/">${QnaVO.title }</a></td>
						<td class="mypContentsDat"><fmt:formatDate value="${QnaVO.writeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>