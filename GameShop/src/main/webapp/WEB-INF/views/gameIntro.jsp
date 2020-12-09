<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script src="/newspaper/mobile/js/jquery-3.2.1.min.js"></script>
<script src="/newspaper/mobile/js/swiper.jquery.js"></script>
<script src="/newspaper/mobile/js/script.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${cpath }/css/gameStore.css">
<!-- 게임 소개 페이지 -->
<h2>게임 소개 페이지</h2>

<hr>
<div>
	<c:forEach var="game" items="${product }">
		<div>
			<h4>이름 : ${game.name }</h4>
			<h4>가격 : ${game.price }</h4>
			<h4>정보 : ${game.info }</h4>
			<h4>개발사 : ${game.developer }</h4>
			<h4>배포사 : ${game.publisher }</h4>
			<h4>태그 : ${game.tags }</h4>
			<h4>플랫폼 : ${game.platform }</h4>
			<h4>장르 : ${game.kind }</h4>
			<h4>조이스틱 사용여부 : ${game.controller }</h4>
			<h4>나이제한 : ${game.rating }</h4>
			<h4>지원언어 : ${game.languages }</h4>
		</div>
	</c:forEach>
	
	<div>
		<button class="openMoal" onclick="openModal()">구매하기</button>
		<button onclick="">위시리스트 추가</button>		
	</div>
	
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<c:forEach var="game" items="${product }">
				<div class="page-header">
					<h1>${game.name }</h1>
				</div>
			</c:forEach>
			<div id="ListBox" style="padding-top: 20px;">
				<div>
					<div>
						<a href="purchasePopup()">구매사항</a>을 잘 읽어보고 필수조건에 동의 합니다.
						<input type="checkbox" name="purchase" value="purchase">
					</div>
				</div>
			</div>
			<div
				style="cursor: pointer; background-color: #DDDDDD; 
				text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기
				</span>
			</div>
			<div
				style="cursor: pointer; background-color: #0054FF; 
				text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="purchaseConfirm()">
				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">구매
				</span>
			</div>
		</div>
		<hr>
	</div>

</div>

<script>
	
	function openModal() {		// 구매 Modal창을 열기
// 		console.log("closeModal 들어옴");
		var singin = "<c:out value="${signin.id }" />";
// 		console.log("singing : " + singin);		// 아이디 정보 확인
		
		if(singin === '') {		// 로그인을 하지 않으면 로그인 창으로
			alert('로그인을 한 후 이용해 주세요');
			location.href = '${cpath}/signin/';
		}
		else {					// 로그인 하면 구매 Modal창이 뜬다.
			$("#modal").show();
		}
	}

	function closeModal() {		// 구매 Modal창을 종료함수
		console.log("closeModal 들어옴");
		$('.searchModal').hide();
	}
	
	function purchaseConfirm() {
		
	}
	
	function purchasePopup() {
		window.open("/gameshop/purchasePopup/","구매약관", 
				"width=600, height=450, left=70, top=60, scrollbars=yes")
		location.href = '${cpath}/purchasePopup/';
	}
	
</script>

<style>

/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

</style>


<%@ include file="footer.jsp"%>