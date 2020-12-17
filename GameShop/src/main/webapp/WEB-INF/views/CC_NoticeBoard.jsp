<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/CC_Board.css">
<script type="text/javascript">
	prev = ${PageParam.prev };
	next = ${PageParam.next };
	perSection = ${PageParam.perSection };
	begin = ${PageParam.begin };
	end = ${PageParam.end };
	NSearchWord = '${NoticeSearchWord }';
	NSearchType = '${NoticeSearchType }';
</script>
<script type="text/javascript" src="${cpath }/js/NoticeBoard.js"></script>

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

		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="NBoard" items="${BoardList }">
				<tr>
					<td class="CC_TableNum">${NBoard.id }</td>
					<td class="CC_TableTitle"><a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></td>
					<td class="CC_Date"><fmt:formatDate value="${NBoard.writedate }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td class="CC_ViewCount">${NBoard.views }</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="SearchDiv">
			<input id="NoticeSearchWord" type="text" value="${NoticeSearchWord }">
			<select id="NoticeSearchType" >
				<option value="title" ${NoticeSearchType == 'title' ? 'selected' : '' }>제목</option>
				<option value="content" ${NoticeSearchType == 'content' ? 'selected' : '' }>내용</option>
				<option value="titleAndContent" ${NoticeSearchType == 'titleAndContent' ? 'selected' : '' }>제목+내용</option>
			</select>
			<input id="NoticeSearchClick" type="button" value="검색" onclick="CCN_ClickSearch()">
		</div>
		
		<div class="PagingDiv">
			<a id="PagePrev">&lt;</a>
			<c:if test="${NoticeSearchWord == null }">
				<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
					<a href="${cpath }/CCNotice/?page=${pageNumber.current }">${pageNumber.current }</a>
				</c:forEach>			
			</c:if>
			<c:if test="${NoticeSearchWord != null }">
				<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
					<a href="${cpath }/CCNotice/?NoticeSearchType=${NoticeSearchType }&NoticeSearchWord=${NoticeSearchWord }&page=${pageNumber.current }">${pageNumber.current }</a>
				</c:forEach>			
			</c:if>
		
			<a id="PageNext">&gt;</a>
		</div>
	</div>
</div>

<script type="text/javascript" src="${cpath }/js/Paging.js"></script>
<%@ include file="footer.jsp" %>