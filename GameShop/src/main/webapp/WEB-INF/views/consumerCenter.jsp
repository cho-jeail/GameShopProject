<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>

<div>
	<div class="CC_SideMenu">
		<h2>고객 센터</h2>
		<ul>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">자주 묻는 질문</a></li>
			<li><a href="#">Q&amp;A</a></li>
		</ul>
	</div>
	<div class="CC_BoardMain">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach varStatus="Num" var="NBoard" items="${BoardList }">
				<tr>
					<td>${Num.count }</td>
					<td>${NBoard.title }</td>
					<td><fmt:formatDate value="${NBoard.writedate }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${NBoard.views }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="footer.jsp" %>