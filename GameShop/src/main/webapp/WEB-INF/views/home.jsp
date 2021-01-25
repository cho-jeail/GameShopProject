<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${cpath }/css/home.css">

<!-- Slide Show -->
<div id="wrapper">
	<div id="slider-wrap">
		<ul id="slider">
			<li><img src="${cpath }/resources/image/banner1.jpg"></li>

			<li><img src="${cpath }/resources/image/banner2.jpg"></li>

			<li><img src="${cpath }/resources/image/banner3.jpg"></li>

			<li><img src="${cpath }/resources/image/banner4.jpg"></li>

			<li><img src="${cpath }/resources/image/banner5.jpg"></li>
		</ul>

		<!--controls-->
		<div class="btns" id="next"></div>
		<div class="btns" id="previous"></div>
		<div id="counter"></div>

		<div id="pagination-wrap">
			<ul>
			</ul>
		</div>
		<!--controls-->
	</div>
</div>
<div class="container">
	<!-- 
		최신 공지사항,
		광고배너
	 -->

	<div class="homeSide">
		<div class="sideBoard">
			<ul style="list-style: none;">
				<li>
					<h3>
						<a href="${cpath }/CCNotice/?page=1">최신 공지사항</a>
					</h3>
				</li>
			<c:forEach var="NBoard" items="${BoardList }" end="4" varStatus="str">
				<li>
					<h4>
						${str.count }. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a>
					</h4>
				</li>
			</c:forEach>
			</ul>
		</div>
		
		<div class="advertise">
			<a href=""><img src="${cpath }/resources/image/advertise.jpg" style="width: 630px; height: 250px"></a>
		</div>
	</div>
</div>
	<div class="recommend">
		<h1>이달의 추천 게임!</h1>
	</div>
	
	<div class="underList">
		<!-- 게임 리스트 첫번째 열 -->
		<div>
			<c:forEach var="list" items="${storeList }" begin="0" step="4" end="4">
				<div class="product">
					<div>
						<div class="imgsize">
							<a href="${cpath }/gameStore/gameIntro/${list.name }/"> <img
								src="${cpath }/resources/image/${list.gameimg}"
								style="width: 260px; height: 150px">
							</a>
						</div>

						<div class="gamename">
							<h5>${list.name }</h5>
							<div>
								<h5>${list.kind }</h5>
							</div>
						</div>

						<div class="gameprice">
							<span>판매가 : </span> <span> <span> ${list.price } </span>
							</span>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 게임 리스트 두번째 열 -->
		<div>
			<c:forEach var="list" items="${storeList }" begin="1" step="4" end="5">
				<div class="product">
					<div>
						<div class="imgsize">
							<a href="${cpath }/gameStore/gameIntro/${list.name }/"> <img
								src="${cpath }/resources/image/${list.gameimg}"
								style="width: 260px; height: 150px">
							</a>
						</div>

						<div class="gamename">
							<h5>${list.name }</h5>
							<div>
								<h5>${list.kind }</h5>
							</div>
						</div>

						<div class="gameprice">
							<span>판매가 : </span> <span> <span> ${list.price } </span>
							</span>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 게임 리스트 세번째 열 -->
		<div>
			<c:forEach var="list" items="${storeList }" begin="2" step="4" end="6">
				<div class="product">
					<div>
						<div class="imgsize">
							<a href="${cpath }/gameStore/gameIntro/${list.name }/"> <img
								src="${cpath }/resources/image/${list.gameimg}"
								style="width: 260px; height: 150px">
							</a>
						</div>

						<div class="gamename">
							<h5>${list.name }</h5>
							<div>
								<h5>${list.kind }</h5>
							</div>
						</div>

						<div class="gameprice">
							<span>판매가 : </span> <span> <span> ${list.price } </span>
							</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- 게임 리스트 네번째 열 -->
		<div>
			<c:forEach var="list" items="${storeList }" begin="3" step="4" end="7">
				<div class="product">
					<div>
						<div class="imgsize">
							<a href="${cpath }/gameStore/gameIntro/${list.name }/"> <img
								src="${cpath }/resources/image/${list.gameimg}"
								style="width: 260px; height: 150px">
							</a>
						</div>

						<div class="gamename">
							<h5>${list.name }</h5>
							<div>
								<h5>${list.kind }</h5>
							</div>
						</div>

						<div class="gameprice">
							<span>판매가 : </span> <span> <span> ${list.price } </span>
							</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


<script type="text/javascript" src="${cpath }/js/home.js"></script>
<%@ include file="footer.jsp"%>











































