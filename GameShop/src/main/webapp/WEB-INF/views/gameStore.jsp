<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">
<!-- 게임 스토어 메인페이지 -->
<hr>
<div>
	<h1>요기는 게임 스토어</h1>
</div>

<div>
	
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
<div>
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
			<ul style="list-style: none;">
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
				<li>
					<a href="#"><img alt="" src=""></a>
				</li>
			</ul>
		</div>
	</div>
</div>
<hr>
<%@ include file="footer.jsp" %>