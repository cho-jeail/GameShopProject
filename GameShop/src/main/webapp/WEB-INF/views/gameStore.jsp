<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">
<!-- 게임 스토어 메인페이지 -->
<hr>
<div>
	<h1>요기는 게임 스토어</h1>
</div>

<div align="center">
	<!-- 상단 메뉴(게임 분류) -->
	<div class="Store-menu">
		<ul>
			<li><a href="#">최신게임</a></li>
			<li><a href="#">무료게임</a></li>
			<li><a href="#">인기게임</a></li>
			<li><a href="#">할인게임</a></li>
		</ul>
	</div>
</div>
<!-- 사이드 이미지와 공지사항 포함 -->
<div class="container">
	<!-- 
		사이드 메뉴
		공지사항, 게임 이미지
	 -->
	<div class="StoreSide">
		<!-- 공지사항 -->
		<div class="NoticeBoard">
			<ul type="disc">
				<li><a href="#">공지사항</a> <a href="#">+더보기</a></li>
			</ul>
			<ol>
				<li><a href="#">**********</a></li>
				<li><a href="#">**********</a></li>
				<li><a href="#">**********</a></li>
				<li><a href="#">**********</a></li>
			</ol>
		</div>
		
		<!-- 상품 -->
		<div>
			<ul style="list-style: none;" class="sideProduct">
				<li>
					<a href="${cpath }/gameStore/gameIntro/">
						<img src="${cpath }/resources/image/image1.jpg"
						style="width: 160px; height: 150px; margin-bottom: 5px;" name="테스트성공">
					</a>
				</li>
				<li>
					<a href="#"><img src="${cpath }/resources/image/image1.jpg"
				style="width: 160px; height: 150px; margin-bottom: 5px;"></a>
				</li>
				<li>
					<a href="#"><img src="${cpath }/resources/image/image1.jpg"
				style="width: 160px; height: 150px; margin-bottom: 5px;"></a>
				</li>
				<li>
					<a href="#"><img src="${cpath }/resources/image/image1.jpg"
				style="width: 160px; height: 150px; margin-bottom: 5px;"></a>
				</li>
				<li>
					<a href="#"><img src="${cpath }/resources/image/image1.jpg"
				style="width: 160px; height: 150px; margin-bottom: 5px;"></a>
				</li>
				<li>
					<a href="#"><img src="${cpath }/resources/image/image1.jpg"
				style="width: 160px; height: 150px; margin-bottom: 5px;"></a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 게임 리스트 -->
	
	<!-- 게임 리스트 첫번째 열 -->
	<div>
		<div class="product">
			<div>
				<c:forEach var="list" items="${storeList }">
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
				</c:forEach>
			</div>
		</div>
		
	</div>
	
</div>
<hr>
<%@ include file="footer.jsp" %>