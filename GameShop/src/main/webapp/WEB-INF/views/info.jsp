<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">

<c:if test="${empty list }">
	<script>
		alert('검색란을 다시 확인해주세요');
		location.href = "${cpath}/";
	</script>
</c:if>

<c:if test="${not empty list }">
<div>
	<c:forEach var="list" items="${list }">
		<div class="product">
			<div>
				<div class="imgsize">
					<a href="${cpath }/gameStore/gameIntro/${list.name }/">
						<img src="${cpath }/resources/image/image1.jpg"
						style="width: 290px; height: 150px">
					</a>
				</div>
				
				<div class="gamename">
					<h5>${list.name }</h5>
					<div>
						<h5>${list.kind }</h5>
					</div>
				</div>
				
				<div class="gameprice">
					<span>판매가 : </span>
					<span>
						<span>
							${list.price }
						</span>
					</span>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</c:if>
<%@ include file="footer.jsp" %>