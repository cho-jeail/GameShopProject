<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAMESHOP</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${cpath }/css/main.css">
</head>
<body>
	<script type="text/javascript">
		cpath = '${cpath}';
	</script>
	<script type="text/javascript" src="${cpath }/js/header.js"></script>
	<header>
		<div class="LOGO">
			<a href="${cpath }/"><img alt="" src=""></a>
		</div>
		<div>
			<div class="TopMenu">
				<div class="SearchBar">
					<input type="text" id="SearchWord" placeholder="검색"> 
					<input type="image" src="${cpath }/resources/image/searchimg.jpg" onclick="search()" id="SearchImg">
				</div>
				<div class="LoginArea">
					<c:choose>
						<c:when test="${not empty signin }">
							<input type="button" onclick="location.href='${cpath}/signout/'" id="Signout" value="로그아웃">
							<input type="button" onclick="location.href='${cpath}/mypage/'" id="MyPage" value="마이페이지">
						</c:when>
						<c:otherwise>
							<input type="button" onclick="location.href='${cpath}/signin/'" id="Login" value="로그인">
							<input type="button" class="join" onclick="location.href='${cpath}/policy/'" id="AddAccount" value="회원가입">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="Menu">
				<ul>
					<li style="width: 70px;"><a href="${cpath }/">홈</a></li>
					<li style="width: 90px;"><a href="${cpath }/siteInfo/">소개</a></li>
					<li style="width: 90px;"><a href="${cpath}/gameStore/?page=1">상점</a></li>
					<li style="width: 130px;" class="HeaderCCli">
						<a href="javascript:viod(0)">고객센터</a>
						<ul>
							<li><a href="${cpath }/CCNotice/?page=1">공지사항</a></li>
							<li><a href="${cpath }/CCFAQ/">자주 묻는 질문</a></li>
							<li><a href="${cpath }/CCQnA/">Q&amp;A</a></li>							
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</header>
	
	<script type="text/javascript">
	function search() {
		var word = document.getElementById("SearchWord").value;
		
		var form = document.createElement("form");
		var input_word = document.createElement("input");
		
		form.setAttribute("method", "post");
		form.setAttribute("action", "${cpath}/info/");
		
		input_word.setAttribute("type", "hidden");
		input_word.setAttribute("name", "word");
		input_word.setAttribute("value", word);
		document.body.appendChild(form);
		
		form.appendChild(input_word);
		
		form.submit();
	}
	</script>