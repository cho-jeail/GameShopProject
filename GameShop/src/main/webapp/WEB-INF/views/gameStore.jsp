<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/gameStore.css">
<!-- 게임 스토어 메인페이지 -->
<hr>
<!-- <div> -->
<!-- 	<h1>요기는 게임 스토어</h1> -->
<!-- </div> -->

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
	<script>
		function filter() {
			var kind;
			var developer;
			var kd = document.getElementById('kind');
			var devl = document.getElementById('developer');
			
			for(i = 0; i < kd.options.length; i++) {
				if(kd.options[i].selected == true) {
					kind = kd.options[i].value;
					break;
				}
			}
			
			for(i = 0; i < devl.options.length; i++) {
				if(devl.options[i].selected == true) {
					developer = devl.options[i].value;
					break;
				}
			}
			
			if(kind === "" && developer === "") {
				alert('한가지의 종류라도 선택하세요');
			}
			
			var form = document.createElement("form");
			var input_kind = document.createElement("input");
			var input_devl = document.createElement("input");
			
			form.setAttribute("method", "post");
			
			input_kind.setAttribute("type", "hidden");
			input_kind.setAttribute("name", "kind");
			input_kind.setAttribute("value", kind);
			input_devl.setAttribute("type", "hidden");
			input_devl.setAttribute("name", "developer");
			input_devl.setAttribute("value", developer);
			
			document.body.appendChild(form);
			
			form.appendChild(input_kind);
			form.appendChild(input_devl);
			
			form.submit();
		}
	</script>
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
	<div class="PagingDiv">
		<c:if test="${not empty storeList }">
			<a id="PagePrev">&lt;</a>
		</c:if>
		<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
			<c:choose>
				<c:when test="${pageNumber.current eq param.page }">
					<a href="javascript:void(0)" class="SelectedPage">${pageNumber.current }</a>
				</c:when>
				<c:otherwise>
					<a href="${cpath }/gameStore/?page=${pageNumber.current }">${pageNumber.current }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${not empty storeList }">
			<a id="PageNext">&gt;</a>			
		</c:if>
	</div>
</div>

<hr>
<script type="text/javascript" src="${cpath }/js/store.js"></script>
<%@ include file="footer.jsp" %>