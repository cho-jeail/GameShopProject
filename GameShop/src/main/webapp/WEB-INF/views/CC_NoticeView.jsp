<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/CC_Board.css">
<div style="display: flex; ">
	<div class="CC_SideMenu">
		<h2>고객 센터</h2>
		<ul>
			<li><a href="${cpath }/CCNotice/?page=1">공지사항</a></li>
			<li><a href="${cpath }/CCFAQ/">자주 묻는 질문</a></li>
			<li><a href="${cpath }/CCQnA/">Q&amp;A</a></li>
		</ul>
	</div>
	<div class="CC_BoardMain">
		<div class="NoticeViewDiv">
			<font class="NoticeViewTitle">${NoticeVO.title }</font>
			<p class="NoticeViewStatus">
				작성자 : ${NoticeVO.writer } | 작성일 : <fmt:formatDate value="${NoticeVO.writedate }" pattern="yyyy-MM-dd"/> | 
				조회수 : ${NoticeVO.views }
			</p>
			<p class="NoticeViewContent">
				${NoticeVO.content }
			</p>		
			<input type="button" onclick="location.href='${cpath}/CCNotice/'" value="목록">
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>