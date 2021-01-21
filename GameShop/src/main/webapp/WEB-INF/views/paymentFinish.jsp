<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<!-- 결제 완료 페이지 -->

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li class="mypLi" ><a href="${cpath }/mypage">회원정보</a></li>
				<li class="mypLi" id="mypLiOn"><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<h2 class="mypH2">결제 완료</h2>
			<table>
				<tr>
					<th>번호</th>
					<th>상품이름</th>
					<th>가격</th>
					<th>장르</th>
					<th>구매날자</th>
				</tr>
				<c:choose>
					<c:when test="${not empty compareList }">
						<c:forEach var="compare" items="${compareList }" varStatus="str">
							<tr>
								<td class="mypBkTdA">${str.index + 1}</td>
								<c:choose>
									<c:when test="${price > compare.price }">
										<td class="mypBkTdB">${compare.name}(쿠폰사용)</td>
									</c:when>
									<c:otherwise>
										<td class="mypBkTdB">${compare.name}</td>
									</c:otherwise>
								</c:choose>
								<td class="mypBkTdA">${compare.price }원</td>
								<td class="mypBkTdA">${compare.kind }</td>
								<td class="mypBkTdB"><fmt:formatDate value="${compare.releaseDate }" pattern="yyyy-MM-dd HH:mm"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="mypBkTdC" colspan="5">구매내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>