<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${cpath }/css/CC_Board.css">
<script type="text/javascript">
	prev = ${ PageParam.prev };
	next = ${PageParam.next };
	perSection = ${PageParam.perSection };
	begin = ${PageParam.begin };
	end = ${PageParam.end };
	NSearchWord = '${NoticeSearchWord }';
	NSearchType = '${NoticeSearchType }';
</script>
<script type="text/javascript" src="${cpath }/js/NoticeBoard.js"></script>

<div style="display: flex;">
	<div class="CC_SideMenu">
		<h2>고객 센터</h2>
		<ul>
			<li><a href="${cpath }/CCNotice/?page=1">공지사항</a></li>
			<li><a href="${cpath }/CCFAQ/">자주 묻는 질문</a></li>
			<li><a href="${cpath }/CCQnA/">Q&amp;A</a></li>
		</ul>
	</div>
	<div class="CC_BoardMain">
		<h3>${BoardMainName }</h3>
		<table>
			<tr>
				<th class="CC_TableNum">번호</th>
				<th class="CC_TableTitle" style="padding-left: 0px;">제목</th>
				<th class="CC_Date">작성일</th>
				<th class="CC_ViewCount">조회수</th>
			</tr>
			<c:if test="${empty BoardList }">
				<tr>
					<td colspan="4" style="text-align: center; font-size: 18pt; font-weight: bold; height: 200px;">조건에 맞는 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="NBoard" items="${BoardList }">
				<tr>
					<td class="CC_TableNum">${NBoard.id }</td>
					<td class="CC_TableTitle"><a href="${cpath }/CCNotice/Board/?id=${NBoard.id }">${NBoard.title }</a></td>
					<td class="CC_Date"><fmt:formatDate value="${NBoard.writedate }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td class="CC_ViewCount">${NBoard.views }</td>
				</tr>
			</c:forEach>
		</table>

		<div class="SearchDiv">
			<input id="NoticeSearchWord" type="text" value="${NoticeSearchWord }" onkeydown="keyDownEnter()">
			<select id="NoticeSearchType">
				<option value="title" ${NoticeSearchType == 'title' ? 'selected' : '' }>제목</option>
				<option value="content" ${NoticeSearchType == 'content' ? 'selected' : '' }>내용</option>
				<option value="titleAndContent" ${NoticeSearchType == 'titleAndContent' ? 'selected' : '' }>제목+내용</option>
			</select>
			<input id="NoticeSearchClick" type="button" value="검색" onclick="CCN_ClickSearch()">
		</div>

		<div class="PagingDiv">
			<c:if test="${not empty BoardList }">
				<a id="PagePrev">&lt;</a>
			</c:if>
			<c:if test="${NoticeSearchWord == null }">
				<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
					<c:choose>
						<c:when test="${pageNumber.current eq param.page }">
							<a href="javascript:void(0)" class="SelectedPage">${pageNumber.current }</a>
						</c:when>
						<c:otherwise>
							<a href="${cpath }/CCNotice/?page=${pageNumber.current }">${pageNumber.current }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			<c:if test="${NoticeSearchWord != null }">
				<c:forEach varStatus="pageNumber" begin="${PageParam.begin }" end="${PageParam.end }">
					<a href="${cpath }/CCNotice/?NoticeSearchType=${NoticeSearchType }&NoticeSearchWord=${NoticeSearchWord }&page=${pageNumber.current }">${pageNumber.current }</a>
				</c:forEach>
			</c:if>
			<c:if test="${not empty BoardList }">
				<a id="PageNext">&gt;</a>			
			</c:if>
		</div>
	</div>
</div>

<script type="text/javascript" src="${cpath }/js/Paging.js"></script>
<%@ include file="footer.jsp"%>