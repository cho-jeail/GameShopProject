<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${cpath }/css/gameStore.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
		<button onclick="javascript:openModal()">
			구매하기
		</button>
		<button onclick="">위시리스트 추가</button>
	</div>

	<!-- Modal창 -->
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<c:forEach var="game" items="${product }">
				<div class="page-header">
					<h1 id="name">${game.name }</h1>
				</div>
			</c:forEach>

			<div id="ListBox" style="padding-top: 20px;">
				<div>
					<div>
						<a href="javascript:purchasePopup();">구매사항</a>을 잘 읽어보고 필수조건에 동의
						합니다. <input type="checkbox" id="pk" name="purchase"
							value="purchase">
					</div>
				</div>
			</div>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기
				</span>
			</div>
			<div
				style="cursor: pointer; background-color: #0054FF; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="purchaseConfirm()">
				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
					구매 </span>
			</div>
		</div>
	</div>

</div>

<script>
	function openModal() { // 구매 Modal창을 열기
		console.log("Modal 들어옴");
		var singin = "<c:out value="${signin.id }" />";
		// 		console.log("singing : " + singin);		// 아이디 정보 확인

		if (singin === '') { // 로그인을 하지 않으면 로그인 창으로
			alert('로그인을 한 후 이용해 주세요');
			location.href = '${cpath}/signin/';
		} else { // 로그인 하면 구매 Modal창이 뜬다.
			$("#modal").show();
		}
	}

	function closeModal() { // 구매 Modal창을 종료함수
		console.log("closeModal 들어옴");
		$('.searchModal').hide();
	}

	function purchaseConfirm() { // 구매 확인 페이지
		var pk = document.getElementById('pk');
		console.log("나타남 : " + pk);

		if (pk.checked === false) {
			alert('필수 조건에 동의해 주세요');
		}

		else if (pk.checked === true) {
			var conPk = confirm("정말로 구매 하시겠습니까?");
			var game = $("#name");

			if (conPk === true) {
				console.log("게임이름 : " + game);
				var form = document.createElement("form");
				var input_pd = document.createElement("input");

				form.setAttribute("method", "post");
				form.setAttribute("action",
						"${cpath}/gameStore/gameIntro/paymentFinish/");
				input_pd.setAttribute("type", "hidden");
				input_pd.setAttribute("name", "game");
				input_pd.setAttribute("value", game.text());
				document.body.appendChild(form);
				form.appendChild(input_pd);

				form.submit();
			}
		}
	}

	function purchasePopup() {
		window.open("/gameshop/purchasePopup/", "_blank",
				"width=600, height=450, left=70, top=60, scrollbars=yes");
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