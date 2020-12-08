<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!-- 게임 소개 페이지 -->
<h2>게임 소개 페이지</h2>

<c:forEach var="game" items="${product }">
<hr>
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
<%@ include file="footer.jsp" %>