<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>

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
		<form action="" method="post">
			<div class="CCQnA_FormDiv">
				<label>구분</label>
				<select name="category" required="required">
					<option value="">:::선택:::</option>
					<option value="product">상품문의</option>
					<option value="order">주문 및 결제문의</option>
					<option value="cancel">주문취소 및 환불</option>
					<option value="other">기타문의</option>
				</select>			
			</div>
			<div class="CCQnA_FormDiv">
				<label>제목</label>
				<input type="text" id="title" name="title" required="required" oninvalid="this.setCustomValidity('제목을 입력해주세요')" >
			</div>
			<div class="CCQnA_FormDiv">
				<label>내용</label>
				<textarea cols="" rows="" name="content" id="content" required="required" maxlength="1000"></textarea>
			</div>
			<div class="CCQnA_FormDiv">
				<label>첨부파일1</label>			
				<input type="file" name="img1">
			</div>			
			<div class="CCQnA_FormDiv">
				<label>첨부파일2</label>			
				<input type="file" name="img2">
			</div>			
			<div class="CCQnA_FormDiv">
				<label>첨부파일3</label>			
				<input type="file" name="img3">
			</div>
			<div class="CCQnA_FormDiv">
				<input type="submit" value="확인">
				<button type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>