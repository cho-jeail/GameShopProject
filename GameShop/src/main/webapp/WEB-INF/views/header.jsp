<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAMESHOP</title>
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
					<input type="text" id="SearchWord" placeholder="검색"> <input
						type="button" onclick="" value="돋보기 그림">
				</div>
				<div class="LoginArea">
					<input type="button" onclick="" id="Login" value="로그인">
					<input type="button" onclick="" id="AddAccount" value="회원가입">
				</div>
			</div>
			<div class="Menu">
				<ul>
					<li><a href="${cpath }/">HOME</a></li>
					<li><a href="#">INFO</a></li>
					<li><a href="${cpath}/gameStore/">STORE</a></li>
					<li><a href="${cpath }/CC/">고객센터</a></li>
				</ul>
			</div>
		</div>
	</header>