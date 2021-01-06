<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">
<!-- 게임 소개 페이지 -->
<div>
	<c:set var="msg" value="${msg }" />
	<c:forEach var="game" items="${product }">
		<div class="intro">
			<h2>${game.name }</h2>
			<hr>
			<div>
				<img src="${cpath }/resources/image/image1.jpg"
				style="width: 1280px; height: 550px; display: flex;">
			</div>
			<div class="gameIntro">
				<div class="gameinfo">
					<a href="javascript:void(0)" onclick="javascript:information(this)"><b>정보</b></a>
				</div>

				<div class="information">
					<h4>가격 : ${game.price }</h4>
					<h4>${game.info }</h4>
					<h4>개발사 : ${game.developer }</h4>
					<h4>배포사 : ${game.publisher }</h4>
					<h4>태그 : ${game.tags }</h4>
				</div>

				<div class="gameinfo">
					<a href="javascript:void(0)" onclick="javascript:useProduct(this)">이용사항</a>
				</div>			
				
				<div class="useProduct">
					<h4>플랫폼 :
						<c:if test="${game.platform == 2 }">Window, MAC</c:if>
						<c:if test="${game.platform == 1 }">MAC</c:if>
						<c:if test="${game.platform == 0 }">Window</c:if>
					</h4>
					<h4>장르 : ${game.kind }</h4>
					<h4>조이스틱 사용여부 : 
						<c:if test="${game.controller == 0 }">불가능</c:if>
						<c:if test="${game.controller == 1 }">가능</c:if>
					</h4>
					<h4>나이제한 : ${game.rating }</h4>
					<h4>지원언어 : ${game.languages }</h4>
				</div>
			</div>
		</div>
	</c:forEach>

	<div>
		<c:if test="${empty compare }">
			<button onclick="javascript:openModal()">
				구매하기
			</button>
			<button onclick="javascript:wish()">위시리스트 추가</button>
		</c:if>
		<c:if test="${not empty compare }">
			<h5>${compare }</h5>
		</c:if>
	</div>

	<!-- Modal창 -->
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<c:forEach var="game" items="${product }">
				<div class="page-header">
					<h1 id="name">${game.name }</h1>
					<h1 id="info" style="display: none;">${game.id }</h1>
				</div>
			</c:forEach>

			<div id="ListBox" style="padding-top: 20px;">
				<div>
					<div>
						<a href="javascript:purchasePopup();">구매사항</a>을 잘 읽어보고 필수조건에 동의
						합니다. <input type="checkbox" id="pk" name="purchase"
							value="purchase">
					</div>
					<div>
						쿠폰 사용하기
						<select name="coupon" id="coupon">
							<option value="">쿠폰을 선택하세요</option>
							<option value="이벤트쿠폰1">이벤트쿠폰1</option>
							<option value="이벤트쿠폰2">이벤트쿠폰2</option>
							<option value="오픈기념쿠폰">오픈기념쿠폰</option>
							<option value="쿠우우폰">쿠우우폰</option>
						</select>
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
					구매
				</span>
			</div>
		</div>
	</div>

</div>

<script>
	function openModal() { // 구매 Modal창을 열기
		console.log("Modal 들어옴");
		var singin = "<c:out value="${signin.id }" />";
		var product = $("#name").text();
		var arr = [singin, product];
		
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

	function purchaseConfirm() { // 구매 확인 함수
		var pk = document.getElementById('pk');
		console.log("나타남 : " + pk);

		if (pk.checked === false) {
			alert('필수 조건에 동의해 주세요');
		}

		else if (pk.checked === true) {
			var conPk = confirm("정말로 구매 하시겠습니까?");
			var name = $("#name");
			var userID = "${sessionScope.signin.id}";
			var cou = document.getElementById('coupon');
			var coupon;
			
			for(i = 0; i < cou.options.length; i++) {
				if(cou.options[i].selected == true) {
					coupon = cou.options[i].value;
					break;
				}
			}

			if (conPk === true) {
				console.log("게임이름 : " + name);
				console.log("유저이름 : " + userID);
				console.log("쿠폰이름 : " + coupon);
				
				var form = document.createElement("form");
				var input_pd = document.createElement("input");
				var input_user = document.createElement("input");
				var input_coupon = document.createElement("input");

				form.setAttribute("method", "post");
// 				form.setAttribute("action",
// 						"${cpath}/gameStore/gameIntro/paymentFinish/");
				input_pd.setAttribute("type", "hidden");
				input_pd.setAttribute("name", "name");
				input_pd.setAttribute("value", name.text());
				input_user.setAttribute("type", "hidden");
				input_user.setAttribute("name", "userID");
				input_user.setAttribute("value", userID);
				input_coupon.setAttribute("type", "hidden");
				input_coupon.setAttribute("name", "coupon");
				input_coupon.setAttribute("value", coupon);
				document.body.appendChild(form);
				form.appendChild(input_pd);
				form.appendChild(input_user);
				form.appendChild(input_coupon);
				
				form.submit();
			}
			
			var msg = "<c:out value="${msg }" />";
			if (msg != null) {
				var msgPk = confirm("쿠폰금액이 결제금액 보다 많습니다. 결제를 진행하시겠습니까?");
				if(msgPk === true)
					alert("구매가 완료됬습니다");
				else{
					alert("구매를 취소합니다")					
					history.go(0);
				}
			}
		}
	}

	function purchasePopup() {
		window.open("/gameshop/purchasePopup/", "_blank",
				"width=600, height=450, left=70, top=60, scrollbars=yes");
	}
	
	function wish() {
		var wishPK = confirm("위시리스트에 추가 하시겠습니까?");
		var game = $("#info");
		var userID = "${sessionScope.signin.id}";
		
		if(userID === '') {
			alert('로그인을 한 후 이용해 주세요');
			location.href = '${cpath}/signin/';
		}
		else if(wishPK === true) {
			var form = document.createElement("form");
			var input_pd = document.createElement("input");
			var input_user = document.createElement("input");
			
			form.setAttribute("method", "post");
// 			form.setAttribute("action",
// 					"${cpath}/gameStore/gameIntro/");
			input_pd.setAttribute("type", "hidden");
			input_pd.setAttribute("name", "name");
			input_pd.setAttribute("value", game.text());
			input_user.setAttribute("type", "hidden");
			input_user.setAttribute("name", "userID");
			input_user.setAttribute("value", userID);
			document.body.appendChild(form);
			console.log("userID : " + userID);
			form.appendChild(input_pd);
			form.appendChild(input_user);
			
			form.submit();
			alert("위시리스트에 추가되었습니다.");
		}
		
// 		var wishlist = confirm("장바구니 목록으로 이동 하시겠습니까?");
		
// 		if(wishlist === true) {
// 			location.href = '${cpath}/basket/';
// 		}
	}
	
	function information(target) {
		var IDiv = target.parentElement.parentElement;
	    var Information = IDiv.getElementsByClassName('information');
	    var view = Information[0].style.display;
	    if (view === '' || view === 'none')
	   		Information[0].style.display = 'block';
	    else
	    	Information[0].style.display = 'none';
	}

	function useProduct(target) {
		var UDiv = target.parentElement.parentElement;
	    var product = UDiv.getElementsByClassName('useProduct');
	    var view = product[0].style.display;
	    if (view === '' || view === 'none')
	    	product[0].style.display = 'block';
	    else
	    	product[0].style.display = 'none';
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