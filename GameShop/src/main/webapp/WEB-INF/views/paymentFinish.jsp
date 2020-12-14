<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<!-- 결제 완료 페이지 -->
<h3>결제 완료</h3>

<div>
	${sessionScope.signin.name}
</div>
<table border="1">
	<tr>
		<th>번호</th>
		<th>상품이름</th>
		<th>가격</th>
		<th>장르</th>
		<th>구매날자</th>
	</tr>
	<c:forEach var="compare" items="${compareList }" varStatus="str">
		<tr>
			<td>${str.count }</td>
			<td>${compare.name}</td>
			<td>${compare.price }</td>
			<td>${compare.kind }</td>
			<td><fmt:formatDate value="${compare.releaseDate }" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
	</c:forEach>
</table>

<%@ include file="footer.jsp" %>