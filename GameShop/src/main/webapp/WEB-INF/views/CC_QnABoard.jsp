<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/css/CC_Board.css">
<script type="text/javascript" src="${cpath }/js/QnaBoard.js"></script>
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
		<h3>${BoardMainName }</h3>
		<form action="" method="post" enctype="multipart/form-data" class="CC_QNAForm">
			<input type="hidden" name="writer" value="${sessionScope.signin.id }">
			<div class="CCQnA_FormDiv">
				<label>구분</label>
				<select name="category" required="required">
					<option value="" selected="selected" disabled="disabled">:::선택:::</option>
					<option value="product">상품문의</option>
					<option value="order">주문 및 결제문의</option>
					<option value="cancel">주문취소 및 환불</option>
					<option value="other">기타문의</option>
				</select>			
			</div>
			<div class="CCQnA_FormDiv">
				<label>제목</label>
				<input type="text" id="title" name="title" required="required">
			</div>
			<div class="CCQnA_FormDiv">
				<label>내용</label>
				<textarea cols="50" rows="25" name="content" id="content" required="required" maxlength="1000"></textarea>
			</div>
			<div class="CCQnA_FormDiv">
				<label>첨부파일1</label>
				<div style="display: flex; flex-direction: column;">
					<input type="file" name="imgFile1" class="UploadImg" accept=".png, .jpeg, .gif, .jpg" onchange="FileSizeCheck(this)">
					첨부파일은 최대 2MB입니다.&nbsp;(사용가능 파일 형식 - jpg / gif / png / jpeg )
				</div>
			</div>			
			<div class="CCQnA_FormDiv">
				<label>첨부파일2</label>
				<div style="display: flex; flex-direction: column;">
					<input type="file" name="imgFile2" class="UploadImg" accept=".png, .jpeg, .gif, .jpg" onchange="FileSizeCheck(this)">
					첨부파일은 최대 2MB입니다.&nbsp;(사용가능 파일 형식 - jpg / gif / png / jpeg )
				</div>	
			</div>			
			<div class="CCQnA_FormDiv">
				<label>첨부파일3</label>
				<div style="display: flex; flex-direction: column;">
					<input type="file" name="imgFile3" class="UploadImg" accept=".png, .jpeg, .gif, .jpg" onchange="FileSizeCheck(this)">
					첨부파일은 최대 2MB입니다.&nbsp;(사용가능 파일 형식 - jpg / gif / png / jpeg )
				</div>
			</div>
			<div class="CCQnA_FormDiv" style="float: right;">
				<input type="submit" value="확인">
				<button type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>