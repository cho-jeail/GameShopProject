<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<script type="text/javascript">
	prev = ${PageParam.prev };
	next = ${PageParam.next };
	perSection = ${PageParam.perSection };
	begin = ${PageParam.begin };
	end = ${PageParam.end };
</script>
<div style="display: flex; ">
	<div class="CC_SideMenu">
		<h2>고객 센터</h2>
		<ul>
			<li><a href="${cpath }/CCNotice/">공지사항</a></li>
			<li><a href="${cpath }/CCFAQ/">자주 묻는 질문</a></li>
			<li><a href="${cpath }/CCQnA/">Q&amp;A</a></li>
		</ul>
	</div>
	<div class="CC_BoardMain">
		<h3>${BoardMainName }</h3>

		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="NBoard" items="${BoardList }">
				<tr>
					<td>${NBoard.id }</td>
					<td><a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></td>
					<td><fmt:formatDate value="${NBoard.writedate }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${NBoard.views }</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="SearchDiv">
		
		</div>
		
		<div class="PagingDiv">
			<p>prev : ${PageParam.prev } || next : ${PageParam.next }</p>
			<a id="PagePrev">&lt;</a>
			
			<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
				<a href="${cpath }/CCNotice/${pageNumber.current }/">${pageNumber.current }</a>
			</c:forEach>
		
			<a id="PageNext">&gt;</a>
		</div>
	</div>
</div>

<script type="text/javascript" src="${cpath }/js/Paging.js"></script>
<%@ include file="footer.jsp" %>