<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">
<!-- 게임 스토어 메인페이지 -->
<hr>
<!-- <div> -->
<!-- 	<h1>요기는 게임 스토어</h1> -->
<!-- </div> -->
<script type="text/javascript" src="${cpath }/js/store.js"></script>
<div align="center">
	<!-- 상단 메뉴(게임 분류) -->
	<div class="Store-menu">
		<ul>
			<li><a href="javascript:void(0)" onclick="newGame()">최신게임</a></li>
			<li><a href="javascript:void(0)" onclick="freeGame()">무료게임</a></li>
			<li><a href="javascript:void(0)" onclick="favoGame()">인기게임</a></li>
			<li><a href="javascript:void(0)" onclick="discGame()">할인게임</a></li>
		</ul>
	</div>
</div>
<!-- 사이드 이미지 포함 -->
<div class="container">
	<!-- 
		사이드 메뉴
		게임 이미지
	 -->
	<div class="StoreSide">
		<!-- 상품 -->
		<div>
			<c:forEach var="list" items="${storeList }" begin="40" end="47">
			<ul style="list-style: none;" class="sideProduct">
				<li>
					<a href="${cpath }/gameStore/gameIntro/${list.name}/">
						<img src="${cpath }/resources/image/image1.jpg"
						style="width: 160px; height: 150px; margin-bottom: 5px;">
					</a>
				</li>
			</ul>
			</c:forEach>
		</div>
	</div>
	
	<!-- 게임 리스트 -->
	
	<!-- 게임 리스트 첫번째 열 -->
	<div>
	<c:forEach var="list" items="${storeList }" begin="0" step="3">
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
	<c:forEach var="list" items="${storeList }" begin="1" step="3">
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
	<c:forEach var="list" items="${storeList }" begin="2" step="3">
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
	<div>
		<c:if test="${prev }">
			<a href="${cpath}/gameStore/${begin - 1}/">◀</a>
		</c:if>
		<c:forEach var="i" begin="${begin}" end="${end}">
			<c:if test="${i == page }">
				<strong>[${i }]</strong>
			</c:if>
			<c:if test="${i != page }">
				<a href="${cpath}/gameStore/${i }/">
			 		[${i }]
				</a>
			</c:if>
		</c:forEach>
		<c:if test="${next }">
			<a href="${cpath}/gameStore/${end + 1}/">▶</a>
		</c:if>
	</div>
</div>

<hr>
<%@ include file="footer.jsp" %>