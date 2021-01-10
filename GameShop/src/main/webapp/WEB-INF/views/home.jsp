<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${cpath }/css/home.css">
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">

<!-- Slide Show -->
<div id="wrapper">
	<div id="slider-wrap">
		<ul id="slider">
			<li>
				<img src="${cpath }/resources/image/image1.jpg">
			</li>

			<li>
				<img src="${cpath }/resources/image/image1.jpg">
			</li>

			<li>
				<img src="${cpath }/resources/image/image1.jpg">
			</li>

			<li>
				<img src="${cpath }/resources/image/image1.jpg">
			</li>

			<li>
				<img src="${cpath }/resources/image/image1.jpg">
			</li>
		</ul>

		<!--controls-->
		<div class="btns" id="next">
			<i class="fa fa-arrow-right"></i>
		</div>
		<div class="btns" id="previous">
			<i class="fa fa-arrow-left"></i>
		</div>
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
		사이드 메뉴
		게임 이미지
	 -->
	<div class="StoreSide">
		<!-- 상품 -->
		<div>
			<c:forEach var="NBoard" items="${BoardList }" end="0">
			<ul style="list-style: none;" class="sideProduct">
				<li>
					<h3><a href="${cpath }/CCNotice/?page=1">최신 공지사항</a></h3>
				</li>
				<li>
					<h4>1. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></h4>
				</li>
				<li>
					<h4>2. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></h4>
				</li>
				<li>
					<h4>3. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></h4>
				</li>
				<li>
					<h4>4. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></h4>
				</li>
				<li>
					<h4>5. <a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></h4>
				</li>
			</ul>
			</c:forEach>
		</div>
	</div>
</div>

<script type="text/javascript" src="${cpath }/js/home.js"></script>
<%@ include file="footer.jsp"%>