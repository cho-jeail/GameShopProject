<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/mypage.css">
<!-- 결제 완료 페이지 -->

<section class="mypSection">
	<div class="mypContainer">
		<div class="mypMenu"> 
			<ul class="mypUl">
				<li class="mypLi" ><a href="${cpath }/mypage">회원정보</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/compareProduct/">구매내역</a></li>
				<li class="mypLi" id="mypLiOn"><a href="${cpath }/mypage/basket/">위시리스트</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageCoupon/">COUPON</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypQna/">문의내역</a></li>
				<li class="mypLi"><a href="${cpath }/mypage/mypageMemberOut/">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="mypContents">
			<h2 class="mypH2">위시리스트</h2>
			<table class="mypBkTable">
				<tr class="mypBkTr1">
					<th>번호</th>
					<th>상품이름</th>
					<th>가격</th>
					<th>장르</th>
					<th>구매날자</th>
					<th>선택</th>
				</tr>				
				<c:choose>
					<c:when test="${not empty wishList }">
						<c:forEach var="wish" items="${wishList }" varStatus="str">
							<tr>
								<td class="mypBkTdA">${str.index + 1}</td>
								<td class="mypBkTdB" id="product">${wish.name}</td>
								<td class="mypBkTdA">${wish.price }원</td>
								<td class="mypBkTdA">${wish.kind }</td>
								<td class="mypBkTdB"><fmt:formatDate value="${wish.wishDate }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td class="mypBkTdA"><button onclick="javascript:delProduct()">삭제</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="mypBkTdC" colspan="6">위시리스트가 비어있습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</section>




<%@ include file="footer.jsp" %>

<script>
	function delProduct() {
		console.log("삭제 넘어옴");
		
		var product = $("#product").text();
		console.log("삭제 product" + product);
		
		$.ajax({
			url : "${cpath}/mypage/basket/" + product + "/",
			method : "post",
			dataType : "text",
			data : {product:product},
			success : function(data) {
				console.log("성공");
				alert('삭제완료하였습니다.');
				location.href = "${cpath}/mypage/basket/";
			},
			error : function(data) {
				console.log("실패");
				alert('서버통신실패');
			}
		})
	}
</script>