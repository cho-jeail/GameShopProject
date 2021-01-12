<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">

<c:if test="${empty list }">
	<script>
		alert('검색란을 다시 확인해주세요');
		location.href = "${cpath}/gameStore/?page=1";
	</script>
</c:if>

<c:if test="${not empty list }">
<!-- 사이드 이미지 포함 -->
<div class="container">
	<!-- 
		사이드 메뉴
		게임 이미지
	 -->
	<div class="StoreSide">
		<!-- 상품 -->
		<div>
			<h4>장르</h4>
			<select id="kind" name="kind">
				<option value="">:::: 선택 ::::</option>
				<option value="AOS">AOS</option>
				<option value="FPS">FPS</option>
			</select>
		</div>
		<div>
			<h4>플랫폼</h4>
			<select id="developer" name="developer">
				<option value="">:::: 선택 ::::</option>
				<option value="스팀">스팀</option>
				<option value="에픽게임즈">에픽게임즈</option>
			</select>
		</div>
		<div onclick="javascript:filter()">
			검색
		</div>
	</div>
	
	<!-- 게임 리스트 -->
	
	<!-- 게임 리스트 첫번째 열 -->
	<div>
	<c:forEach var="list" items="${list }" begin="0" step="3">
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
	
	<!-- 게임 리스트 두번째 열 -->
	<div>
	<c:forEach var="list" items="${list }" begin="1" step="3">
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
	
	<!-- 게임 리스트 세번째 열 -->
	<div>
	<c:forEach var="list" items="${list }" begin="2" step="3">
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
</div>
</c:if>
<%@ include file="footer.jsp" %>