<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/CC_Board.css">
<script type="text/javascript" src="${cpath }/js/FAQBoard.js"></script>

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
		<ul class="CC_FAQSubMenu">
			<li><a href="${cpath }/CCFAQ/">전체</a></li>
			<li><a href="${cpath }/CCFAQ/?flag=0">웹사이트 및 계정</a></li>
			<li><a href="${cpath }/CCFAQ/?flag=1">결제가격 및 프로모션</a></li>
		</ul>
		<div class="CC_FAQBoardList">
			<c:forEach var="FAQVO" items="${FAQList }">
				<div class="CC_FAQ">
					<div class="CC_FAQTitle">
						<a href="javascript:void(0)" onclick="FAQViewContent(this)">
							<font>
								<c:if test="${FAQVO.category == 0 }">Q. [웹사이트 및 계정]</c:if>
								<c:if test="${FAQVO.category == 1 }">Q. [결제가격 및 프로모션]</c:if>
							</font>&nbsp;${FAQVO.title }							
						</a>
					</div>
					<div class="CC_FAQContent">
						<p>${FAQVO.content }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>